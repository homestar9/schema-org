component extends="coldbox.system.testing.BaseTestCase" appMapping="root" {

	data = {
        "valid": {
            "organization": {
                "name": "TestOrg",
                "url": "https://test.example.com"
            },
            "website": {
                "name": "Test Website",
                "url": "https://test.example.com"
            },
            "creativeWork": {
                "name": "Test Creative Work",
                "abstract": "This is a test creative work abstract. I am here because of an ACF reserved keyword."
            }
        },
        "scriptTag" = '<script type="application/ld+json"',
        "nested": {
            "address": {
                "streetAddress": "123 Test St",
                "addressLocality": "Test City",
                "addressRegion": "Test State",
                "postalCode": "12345",
                "addressCountry": "Test Country"
            }
        }
    }
    
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
		describe( "Schema Builder", function(){
			beforeEach( function( currentSpec ){
                setup();
                model = getInstance( "SchemaBuilder@schema-org" );
            } );

            it( "Can be created", function(){
				expect( model ).toBeComponent();
				
			});

            it("can create an organization schema", function() {
                var builder = model.organization(function(o) {
                    o.name( data.valid.organization.name )
                        .url( data.valid.organization.url );
                } );
                var result = builder.toArray();

                expect( result.len() ).toBe( 1 );
                expect( result[1]["@type"] ).toBe( "Organization" );
                expect( result[1].name ).toBe( data.valid.organization.name );
                expect( result[1].url ).toBe( data.valid.organization.url );
            });

            it("can create multiple schema types via chaining", function() {
                var builder = model
                    .organization( function(o) {
                        o.name( data.valid.organization.name )
                            .url( data.valid.organization.url );
                    } )
                    .website( function( w ) {
                        w.name( data.valid.website.name )
                            .url( data.valid.website.url );
                    } );
                var result = builder.toArray();

                // Filter for organization
                expect( result.len() ).toBe( 2 );
                expect( result[1]["@type"] ).toBe( "Organization" );
                expect( result[1].name ).toBe( data.valid.organization.name );
                expect( result[1].url ).toBe( data.valid.organization.url );
                expect( result[2]["@type"] ).toBe( "WebSite" );
                expect( result[2].name ).toBe( data.valid.website.name );
                expect( result[2].url ).toBe( data.valid.website.url );
            });

            it( "can create a schema that uses and maps an ACF reserved keyword", function() {
                var builder = model.creativeWork( function( cw ) {
                    cw.name( data.valid.creativeWork.name )
                        ._abstract( data.valid.creativeWork.abstract ); // workaround for ACF reserved keyword
                } );
                var result = builder.toArray();

                expect( result.len() ).toBe( 1 );
                expect( result[1]["@type"] ).toBe( "CreativeWork" );
                expect( result[1].name ).toBe( data.valid.creativeWork.name );
                expect( result[1][ "abstract" ] ).toBe( data.valid.creativeWork[ "abstract" ] );
            });

            it("can create a website schema in graph format", function() {
                var builder = model
                    .organization( function(o) {
                        o.name( data.valid.organization.name )
                            .url( data.valid.organization.url );
                    } )
                    .website( function( w ) {
                        w.name( data.valid.website.name )
                            .url( data.valid.website.url );
                    } );

                var result = builder.toGraph();

                expect( result ).toBeStruct();
                expect( result ).toHaveKey( "@context,@graph" );
                expect( result["@context"] ).toBe( "https://schema.org" );
                expect( result["@graph"] ).toBeArray();
                expect( result["@graph"].len() ).toBe( 2 );
                expect( result["@graph"][1]["@type"] ).toBe( "Organization" );
                expect( result["@graph"][2]["@type"] ).toBe( "Website" );
            });

            it("can populate a schema by passing in a struct", function() {
                var builder = model
                    .organization( data.valid.organization )
                    .website( data.valid.website )
                    .creativeWork( data.valid.creativeWork );

                var result = builder.toGraph();

                expect( result ).toBeStruct();
                expect( result ).toHaveKey( "@context,@graph" );
                expect( result["@context"] ).toBe( "https://schema.org" );
                expect( result["@graph"] ).toBeArray();
                expect( result["@graph"].len() ).toBe( 3 );
                expect( result["@graph"][1]["@type"] ).toBe( "Organization" );
                expect( result["@graph"][2]["@type"] ).toBe( "Website" );
                expect( result["@graph"][3]["@type"] ).toBe( "CreativeWork" );
            });

            it("can create nested properties", function() {
                var builder = model.organization(function(o) {
                    o.name( data.valid.organization.name )
                        .url( data.valid.organization.url )
                        .address( o.new("PostalAddress", function(a) {
                            a.streetAddress( data.nested.address.streetAddress )
                                .addressLocality( data.nested.address.addressLocality )
                                .addressRegion( data.nested.address.addressRegion )
                                .postalCode( data.nested.address.postalCode )
                                .addressCountry( data.nested.address.addressCountry );
                        } ) );
                } );
                var result = builder.toArray();

                expect( result.len() ).toBe( 1 );
                expect( result[1]["@type"] ).toBe( "Organization" );
                expect( result[1].name ).toBe( data.valid.organization.name );
                expect( result[1].url ).toBe( data.valid.organization.url );
                expect( result[1].address ).toBeStruct();
                expect( result[1].address.streetAddress ).toBe( data.nested.address.streetAddress );
                expect( result[1].address.addressLocality ).toBe( data.nested.address.addressLocality );
                expect( result[1].address.addressRegion ).toBe( data.nested.address.addressRegion );
                expect( result[1].address.postalCode ).toBe( data.nested.address.postalCode );
                expect( result[1].address.addressCountry ).toBe( data.nested.address.addressCountry );

            });

            it("will throw an error when trying to set a missing property", function() {
                
                expect( function() {
                    model.organization(function(o) {
                        o.badproperty( data.valid.organization.name );
                    } );    
                } ).toThrow( type="MethodNotFound" );
                
            });

            it("can output serialized JSON-LD", function() {
                var builder = model
                    .organization( function(o) {
                        o.name( data.valid.organization.name )
                            .url( data.valid.organization.url );
                    } )
                    .website( function( w ) {
                        w.name( data.valid.website.name )
                            .url( data.valid.website.url );
                    } );

                var result = builder.toJsonLd();

                expect( isJson( result ) ).toBeTrue();
            });

            it("can output full javascript string", function() {
                var builder = model
                    .organization( function(o) {
                        o.name( data.valid.organization.name )
                            .url( data.valid.organization.url );
                    } )
                    .website( function( w ) {
                        w.name( data.valid.website.name )
                            .url( data.valid.website.url );
                    } );

                var result = builder.toScript();

                expect( left( result, len( data.scriptTag ) ) ).toBe( data.scriptTag );
            });

            it("calling get() is the same as calling toGraph()", function() {
                var builder = model
                    .organization( function(o) {
                        o.name( data.valid.organization.name )
                            .url( data.valid.organization.url );
                    } )
                    .website( function( w ) {
                        w.name( data.valid.website.name )
                            .url( data.valid.website.url );
                    } );

                var result1 = builder.get();
                var result2 = builder.toGraph();
                expect( result1 ).toBeStruct();
                expect( result2 ).toBeStruct();
                expect( result1 ).toBe( result2 );
            });

		} );
	}

}
