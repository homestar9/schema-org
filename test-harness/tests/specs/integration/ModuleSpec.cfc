component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		setup();
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){
		describe( "MockData CFC", function(){
			beforeEach( function( currentSpec ){
                setup();
            } );

            it( "can load the module home page", function(){
				var event 		= get( "/" );
                var prc = event.getPrivateCollection();

                // Coldbox limitation: You can't get the status code from a call to the default route. Only explicit routes.
                // https://community.ortussolutions.com/t/coldbox-7-optimal-way-to-get-current-http-status-code/10632/9
                // expect( event.getStatusCode() ).toBe( 200 );
                
                expect( prc ).toHaveKey( "schema" );
				
			});

		} );
	}

}
