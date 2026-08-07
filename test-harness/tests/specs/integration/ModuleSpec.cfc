component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

	// Test lifecycle

	function beforeAll(){
		super.beforeAll();
		setup();
	}

	function afterAll(){
		super.afterAll();
	}

	// Integration specs

	function run(){
		describe( "MockData CFC", function(){
			beforeEach( function( currentSpec ){
                setup();
            } );

            it( "can load the module home page", function(){
				var event 		= get( "/" );
                var prc = event.getPrivateCollection();

                // ColdBox does not expose the status code when a test calls the default route.
                // https://community.ortussolutions.com/t/coldbox-7-optimal-way-to-get-current-http-status-code/10632/9
                // expect( event.getStatusCode() ).toBe( 200 );
                
                expect( prc ).toHaveKey( "schema" );
				
			});

		} );
	}

}
