component {

    property name="schemaBuilder" inject="provider:SchemaBuilder@schema-org";
    
    function index( event, rc, prc, eventName="", routedUrl="" ) {

        var baseUrl = event.getHTMLBaseURL();
        
        // Build the complete JSON-LD graph used by the test page.
        prc.schema = schemaBuilder
            // Describe the current web page.
            .webpage( function( o ) {
                o.id( prc.canonicalUrl & "##webpage" )
                    .name( prc.pageTitle  )
                    .description( prc.pageDescription )
                    .url( prc.canonicalUrl )
                    .inLanguage( "en-US" )
                    .isPartOf( { "@id": baseUrl & "##website"  } )
                    .publisher( { "@id": baseUrl & "##organization" } )
                    .image( { "@id": baseUrl & "##logo" } );
            } )
            
            // Describe the website that contains the current page.
            .website( function( o ) {
                o.id( baseUrl & "##website" )
                    .name( "Starfleet Command Official Website" )
                    .alternateName( "Starfleet Command" )
                    .url( baseUrl )
                    .description( "The official website of Starfleet Command, providing information on missions, personnel, and more." )
                    .inLanguage( "en-US" )
                    .publisher( { "@id": baseUrl & "##organization" } );
            } )
        
            .organization(function(s) {
                // Set the main organization details.
                s.id( baseUrl & "##organization" )
                    .name("Starfleet Command")
                    .alternateName("SF Command")
                    .url( baseUrl)
                    .foundingDate( "2161" )
                    .description( "Starfleet is the deep-space exploratory and defense arm of the United Federation of Planets." )

                // Create the logo as a nested ImageObject.
                .logo(
                    s.new("ImageObject", function(i) {
                        i.id( baseUrl & "##logo")
                            .url( baseUrl & "assets/starfleet-logo.png")
                            .contentUrl( baseUrl & "assets/starfleet-logo.png")
                            .width( 512 )
                            .height( 256 )
                            .caption( "Starfleet Command Logo" )
                            .inLanguage( "en-US" );
                    })
                )

                // Reuse the logo as the organization image by referencing its @id.
                .image( { "@id": baseUrl & "##logo" } )

                // Create the organization's address as a nested PostalAddress.
                .address(
                    s.new("PostalAddress", function( a ) {
                        a.streetAddress("Federation HQ, 1 Unity Plaza")
                            .addressLocality("San Francisco")
                            .addressRegion("CA")
                            .postalCode("94123")
                            .addressCountry("US");
                    })
                )

                // ContactPoint accepts an array because an organization can have several contacts.
                .contactPoint( [
                    s.new("ContactPoint", function(c) {
                        c.telephone("+1-800-STARFLEET")
                        .contactType("customer service")
                        .contactOption("TollFree")
                        .areaServed( ["US-CA", "US-NY", "US-TX"] )
                        .availableLanguage("en");
                    })
                ] )

                // sameAs links this organization to its profiles on other websites.
                .sameAs( [
                    "https://www.facebook.com/StarfleetOfficial/",
                    "https://www.linkedin.com/company/starfleet-command/"
                ] );
            } )

            // CreativeWork verifies the safe _abstract setter for the reserved word "abstract".
            .creativeWork( function( o ) {
                o.id( baseUrl & "##creativeWork" )
                    .name( "Star Trek" )
                    ._abstract( "Star Trek is a science fiction franchise created by Gene Roddenberry that follows the adventures of the USS Enterprise (NCC-1701) and its crew as they explore space, discover new life, and seek out new civilizations." );
            } ) 
            .get();

        return serializeJson( prc.schema );

    }

}
