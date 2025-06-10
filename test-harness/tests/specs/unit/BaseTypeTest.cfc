component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

	testData = {
        "valid": {
            "id": "##id",
            "url": "https://test.example.com/"
        },
        "dirList" = directoryList( expandPath( "../../../../types/" ), true, "query" )
    };

    writeDump( expandPath( "../../../../types/" ) );
    
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
                                    
                            } 
                        );
                    }
                }

            } );

		} );
	}

}
