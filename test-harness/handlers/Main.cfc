/**
 * Prepares the page details used by the sample Schema.org handler.
 */
component{

	property name="schemaBuilder" inject="provider:SchemaBuilder@schema-org";
    
	any function index( event,rc, prc ){
		
        prc.canonicalUrl = event.getHTMLBaseURL();
        prc.pageTitle = "Starfleet Command Official Website";
        prc.pageDescription = "The official website of Starfleet Command, providing information on missions, personnel, and more.";
        

	}

}
