component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

    // Resolve types from this spec's location. expandPath() would start from the TestBox runner
    // instead. That path can point outside the repository and cause the generated-type specs to run
    // zero tests without reporting an error.
    typesDir = getDirectoryFromPath( getCurrentTemplatePath() ) & "../../../../types/";

	testData = {
        "valid": {
            "id": "##id",
            "url": "https://test.example.com/"
        },
        "dirList" = directoryList( typesDir, true, "query" )
    };

    // Test lifecycle

	function beforeAll(){
		super.beforeAll();
	}

	function afterAll(){
		super.afterAll();
	}

	// Unit specs

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
                // Fail when the path above is wrong instead of reporting a successful run with zero
                // generated-type specs.
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

                                // CFML supports only one parent component. The generator copies
                                // properties from additional Schema.org parents into the child. It
                                // must not copy properties already provided by the CFML parent chain.
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
                // Schema.org defines LocalBusiness as a child of Organization and Place. CFML can
                // extend only one component, so the generator must copy Place properties such as
                // geo and openingHoursSpecification into LocalBusiness.
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
                // Dentist reaches Place through LocalBusiness. The generator must follow more than
                // one parent level to include Place properties on Dentist.
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
                // A mapper belongs only to the type that declares the reserved property. Keeping
                // mapper data between generated files would add _abstract to unrelated types.
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

    // Test helpers

    /**
     * Returns property names from the complete component inheritance chain.
     *
     * Parent properties come first. This helper matches the private BaseType.$getDeepProperties()
     * method so tests can detect duplicate declarations.
     *
     * @meta Component metadata returned by getMetadata().
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
