/**
* Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.ortussolutions.com
* ---
*/
component{

	// ColdBox uses this name to load and map the module under test.
	request.MODULE_NAME = "schema-org";
	// This is the module's folder name inside the repository path.
	request.MODULE_PATH = "schema-org";

	// Configure the TestBox application.
	this.name 				= "#request.MODULE_NAME# Testing Suite";
	this.sessionManagement 	= true;
	this.sessionTimeout 	= createTimeSpan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimeSpan( 0, 0, 15, 0 );
	this.setClientCookies 	= true;
	// Use smart whitespace handling in test responses.
	this.whiteSpaceManagement = "smart";
    this.enableNullSupport = shouldEnableFullNullSupport();

	// Map /tests to this test folder.
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );

	// The parent of /tests is the test-harness application root.
	rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings[ "/root" ]   			= rootPath;

	// Map the repository root and module folder for ColdBox.
	moduleRootPath = REReplaceNoCase( rootPath, "#request.MODULE_PATH#(\\|/)test-harness(\\|/)", "" );
	this.mappings[ "/moduleroot" ] 				= moduleRootPath;
	this.mappings[ "/#request.MODULE_NAME#" ] 	= moduleRootPath & "#request.MODULE_PATH#";

	// Optional ORM settings. Keep this code commented out unless a test needs a database.
	/**
	this.datasource = "coolblog";
	this.ormEnabled = "true";
	this.ormSettings = {
		cfclocation = [ "/root/models" ],
		logSQL = true,
		dbcreate = "update",
		secondarycacheenabled = false,
		cacheProvider = "ehcache",
		flushAtRequestEnd = false,
		eventhandling = true,
		eventHandler = "cborm.models.EventHandler",
		skipcfcWithError = false
	};
	**/

	function onRequestStart( required targetPage ){

		// Generated-type tests can take several minutes on slower CFML engines.
		setting requestTimeout="9999";
		// Create an isolated ColdBox application for this test request.
		request.coldBoxVirtualApp = new coldbox.system.testing.VirtualApp( appMapping = "/root" );

		// Start ColdBox only for TestBox runner and spec requests.
		if ( getBaseTemplatePath().replace( expandPath( "/tests" ), "" ).reFindNoCase( "(runner|specs)" ) ) {
			request.coldBoxVirtualApp.startup( true );
		}

		// fwreinit restarts ColdBox and clears Lucee's cached pages.
		if( structKeyExists( url, "fwreinit" ) ){
			if( structKeyExists( server, "lucee" ) ){
				pagePoolClear();
			}
			// ormReload();
			request.coldBoxVirtualApp.restart();
		}

		return true;
	}

	public void function onRequestEnd( required targetPage ) {
		request.coldBoxVirtualApp.shutdown();
	}

    private boolean function shouldEnableFullNullSupport() {
        var system = createObject( "java", "java.lang.System" );
        var value = system.getEnv( "FULL_NULL" );
        return isNull( value ) ? false : !!value;
    }
}
