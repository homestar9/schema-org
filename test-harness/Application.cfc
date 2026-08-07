/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
*/
component{

	// ColdBox uses this name to load the module being tested.
	request.MODULE_NAME = "schema-org";

	// Configure the test-harness application.
	this.name              = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout    = createTimeSpan(0,0,15,0);
    this.setClientCookies  = true;

    // Lucee-specific output settings
	// Keep buffered output available when a tag or function throws an exception.
	this.bufferOutput 					= true;
	// Leave HTTP compression disabled in the local test application.
	this.compression 					= false;
	// Use Lucee's smart whitespace handling.
	this.whiteSpaceManagement 			= "smart";
	// Keep whitespace in responses from remote CFC methods.
	this.suppressRemoteComponentContent = false;

	// ColdBox starts from this folder because the test harness is the application root.
	COLDBOX_APP_ROOT_PATH       = getDirectoryFromPath( getCurrentTemplatePath() );
	// An empty value means the application is mounted at the web server root.
	COLDBOX_APP_MAPPING         = "";
	// An empty value tells ColdBox to use the default configuration file.
	COLDBOX_CONFIG_FILE 	    = "";
	// An empty value lets ColdBox create the application key.
	COLDBOX_APP_KEY 		    = "";

    // Let tests address the harness root as /root.
	this.mappings[ "/root" ] = COLDBOX_APP_ROOT_PATH;

	// Find the repository root and module path from the test-harness location.
	moduleRootPath 	= REReplaceNoCase( this.mappings[ "/root" ], "#request.MODULE_NAME#(\\|/)test-harness(\\|/)", "" );
	modulePath 		= REReplaceNoCase( this.mappings[ "/root" ], "test-harness(\\|/)", "" );

	// Expose the repository and module paths to ColdBox.
	this.mappings[ "/moduleroot" ] = moduleRootPath;
	this.mappings[ "/#request.MODULE_NAME#" ] = modulePath;

	// Optional ORM settings. Uncomment this code only when a test needs a database.
	//this.datasource = "coolblog";
	//this.ormEnabled = "true";
	/**
	this.ormSettings = {
		cfclocation = [ "models" ],
		logSQL = true,
		dbcreate = "update",
		secondarycacheenabled = false,
		cacheProvider = "ehcache",
		flushAtRequestEnd = false,
		eventhandling = true,
		eventHandler = "cborm.models.EventHandler",
		skipcfcWithError = true
	};
	**/

	// Start ColdBox when the test-harness application starts.
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// Pass each request through the ColdBox application.
	public boolean function onRequestStart(String targetPage){

		if( url.keyExists( "fwreinit" ) ){
			if( server.keyExists( "lucee" ) ){
				pagePoolClear();
			}
			// Uncomment this call when tests need ORM metadata to reload during fwreinit.
			// ormReload();
		}

		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}

}
