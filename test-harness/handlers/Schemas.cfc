component {

    property name="schemaBuilder" inject="provider:SchemaBuilder@schema-org";
    
    function index( event, rc, prc, eventName="", routedUrl="" ) {

        var baseUrl = event.getHTMLBaseURL();
        
        // In your test handler:
        prc.schema = schemaBuilder
            // Webpage Schema
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
            
            // Website Schema
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
                // Top‐level Organization fields
                s.id( baseUrl & "##organization" )
                    .name("Starfleet Command")
                    .alternateName("SF Command")
                    .url( baseUrl)
                    .foundingDate( "2161" )
                    .description( "Starfleet is the deep-space exploratory and defense arm of the United Federation of Planets." )

                // Nested ImageObject for "logo"
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

                // Reference the same logo as "image" by @id only
                .image( { "@id": baseUrl & "##logo" } )

                // Nested PostalAddress for "address"
                .address(
                    s.new("PostalAddress", function( a ) {
                        a.streetAddress("Federation HQ, 1 Unity Plaza")
                            .addressLocality("San Francisco")
                            .addressRegion("CA")
                            .postalCode("94123")
                            .addressCountry("US");
                    })
                )

                // Array of ContactPoint objects
                .contactPoint( [
                    s.new("ContactPoint", function(c) {
                        c.telephone("+1-800-STARFLEET")
                        .contactType("customer service")
                        .contactOption("TollFree")
                        .areaServed( ["US-CA", "US-NY", "US-TX"] )
                        .availableLanguage("en");
                    })
                ] )

                // Multiple sameAs URLs
                .sameAs( [
                    "https://www.facebook.com/StarfleetOfficial/",
                    "https://www.linkedin.com/company/starfleet-command/"
                ] );
            } )

            // Add Creative Work Schema because it uses an ACF reserved keyword
            .creativeWork( function( o ) {
                o.id( baseUrl & "##creativeWork" )
                    .name( "Star Trek" )
                    ._abstract( "Star Trek is a science fiction franchise created by Gene Roddenberry that follows the adventures of the USS Enterprise (NCC-1701) and its crew as they explore space, discover new life, and seek out new civilizations." );
            } ) 
            .get();

        return serializeJson( prc.schema );

    }

}