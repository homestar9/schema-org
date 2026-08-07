component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

    // Resolve types/ from THIS file's own location. expandPath() would resolve against the
    // executing template instead — the TestBox runner in tests/ — which pointed four levels above
    // the repo, so directoryList() returned nothing and the per-type specs below never ran.
    typesDir = getDirectoryFromPath( getCurrentTemplatePath() ) & "../../../../types/";

	testData = {
        "valid": {
            "id": "##id",
            "url": "https://test.example.com/"
        },
        "dirList" = directoryList( typesDir, true, "query" )
    };

    /*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "Base Type", function(){
			beforeEach( function( currentSpec ){
                setup();
                model = getInstance( "BaseType@schema-org" );
            } );

            it( "Can be created", function(){
				expect( model ).toBeComponent();
			});

            it("can accept a closure as an init argument", function() {
                var model = model.init( function( o ){
                    o.id( testData.valid.url & testData.valid.id )
                } );

                expect( invoke( model, "get@id" ) ).toBe( testData.valid.url & testData.valid.id  );
            });

            it("can accept struct as init argument", function() {
                var model = model.init( { "id": testData.valid.url & testData.valid.id } );

                expect( invoke( model, "get@id" ) ).toBe( testData.valid.url & testData.valid.id  );
            });

            it("can use convenience methods for getting and setting @id", function() {
                model.setId( testData.valid.id );
                expect( model.getId() ).toBe( testData.valid.id );
            });

            it( "finds the generated types on disk", function() {
                // Guards the path above. Without this, a broken path silently turns the whole
                // per-type suite below into zero specs and the run still reports green.
                expect( testData.dirList.recordCount ).toBeGT( 900 );
            } );

            given( "All Schema.org Types", function() {

                for( var item in testData.dirList ) {
                    if( listLast( item.name, "." ) == "cfc" ) {

                        var typeName = listFirst( item.name, "." );

                        it(
                            title = "can instantiate a: #typeName#",
                            data = { typeName = typeName },
                            body = function( data ) {

                                var type = createObject( "component", "schema-org.types.#data.typeName#" ).init();
                                expect( type ).toBeComponent();
                                expect( invoke( type, "get@type" ) ).toBe( data.typeName );

                                // The generator flattens properties from second and third parents
                                // into the child, because CFML has single inheritance. It must not
                                // redeclare anything the extends chain already declares.
                                var seen = {};
                                for ( var propName in deepPropertyNames( getMetadata( type ) ) ) {
                                    expect( seen ).notToHaveKey(
                                        propName,
                                        "#data.typeName# declares '#propName#' more than once in its inheritance chain"
                                    );
                                    seen[ propName ] = true;
                                }

                            }
                        );
                    }
                }

            } );

		} );

        describe( "Multi-parent inheritance", function(){

            beforeEach( function( currentSpec ){
                setup();
            } );

            it( "exposes properties reached only through a second parent", function() {
                // LocalBusiness is a subclass of BOTH Organization and Place, but CFML can only
                // extend one. Everything Place contributes - geo, openingHoursSpecification,
                // latitude, longitude - used to be missing from LocalBusiness and every subtype.
                var plumber = createObject( "component", "schema-org.types.Plumber" ).init( {
                    "name": "Test Plumber",
                    "geo": {
                        "@type": "GeoCoordinates",
                        "latitude": 38.2903510,
                        "longitude": -122.3054417
                    },
                    "openingHoursSpecification": {
                        "@type": "OpeningHoursSpecification",
                        "opens": "08:00",
                        "closes": "17:00"
                    }
                } );

                var result = plumber.getMemento();

                expect( result[ "@type" ] ).toBe( "Plumber" );
                expect( result ).toHaveKey( "geo" );
                expect( result.geo.latitude ).toBe( 38.2903510 );
                expect( result.geo.longitude ).toBe( -122.3054417 );
                expect( result ).toHaveKey( "openingHoursSpecification" );
            } );

            it( "walks more than one level up a multi-parent chain", function() {
                // Dentist extends MedicalOrganization but is also a LocalBusiness, which is itself
                // multi-parent. Reaching Place from Dentist takes a transitive walk, not one hop.
                var dentist = createObject( "component", "schema-org.types.Dentist" ).init( {
                    "name": "Test Dentist",
                    "geo": { "@type": "GeoCoordinates", "latitude": 38.2903510, "longitude": -122.3054417 },
                    "priceRange": "$$"
                } );

                var result = dentist.getMemento();

                expect( result ).toHaveKey( "geo" );
                expect( result ).toHaveKey( "priceRange" );
            } );

            it( "keeps the extends chain of single-parent types intact", function() {
                var plumber = createObject( "component", "schema-org.types.Plumber" ).init();

                expect( isInstanceOf( plumber, "schema-org.types.LocalBusiness" ) ).toBeTrue();
                expect( isInstanceOf( plumber, "schema-org.types.Organization" ) ).toBeTrue();
            } );

        } );

        describe( "Reserved keyword mappers", function(){

            beforeEach( function( currentSpec ){
                setup();
            } );

            it( "only registers a mapper on types that declare the property", function() {
                // The generator used to accumulate mappers across the whole run, so 649 types
                // carried an "_abstract" mapper for a property they never declared.
                var plumber = createObject( "component", "schema-org.types.Plumber" ).init();
                prepareMock( plumber );

                expect( plumber.$getProperty( "_mappers", "variables" ) ).toBeEmpty();
            } );

            it( "still maps the reserved keyword on the type that owns it", function() {
                var work = createObject( "component", "schema-org.types.CreativeWork" ).init();
                prepareMock( work );

                var mappers = work.$getProperty( "_mappers", "variables" );

                expect( mappers ).toHaveKey( "_abstract" );
                expect( mappers[ "_abstract" ] ).toBe( "abstract" );
            } );

        } );
	}

    /*********************************** HELPERS ***********************************/

    /**
     * Every property name declared on a component and on each of its ancestors, ancestors first.
     * Mirrors BaseType.$getDeepProperties(), which is private.
     *
     * @meta Component metadata from getMetadata().
     */
    private array function deepPropertyNames( required struct meta ) {
        var names = [];

        if ( structKeyExists( arguments.meta, "extends" ) ) {
            names.append( deepPropertyNames( arguments.meta.extends ), true );
        }

        if ( structKeyExists( arguments.meta, "properties" ) ) {
            for ( var prop in arguments.meta.properties ) {
                names.append( prop.name );
            }
        }

        return names;
    }

}
