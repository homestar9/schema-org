component{

	// Configure the ColdBox test application.
	function configure(){

		// Main ColdBox settings.
		coldbox = {
			// Identify the test application.
			appName 				= "Module Tester",

			// Reload handlers during local development.
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			modulesExternalLocation = [],

			// No application-wide lifecycle handlers are required.
			defaultEvent			= "",
			requestStartHandler		= "",
			requestEndHandler		= "",
			applicationStartHandler = "",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			// Show the ColdBox error page for unhandled exceptions.
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate 	= "/coldbox/system/exceptions/Whoops.cfm",

			// Disable caching so tests always use current handler code.
			handlerCaching 			= false,
			eventCaching			= false
		};

		// Treat localhost addresses as the development environment. Add a method named after an
		// environment when that environment needs extra settings.
		environments = {
			development = "localhost,127\.0\.0\.1"
		};

		// Empty include and exclude lists allow ColdBox to discover every module.
		modules = {
			// An empty include list loads all discovered modules.
			include = [],
			// An empty exclude list blocks no modules.
			exclude = []
		};

		// Interceptors run in array order. This application does not register any.
		interceptors = [
		];

		// Send test-application logs to the console and a rolling file.
		logBox = {
			// Appenders choose where LogBox writes messages.
			appenders = {
				myConsole : { class : "ConsoleAppender" },
				files : {
					class="RollingFileAppender",
					properties = {
						filename = "tester", filePath="/#appMapping#/logs"
					}
				}
			},
			// The root logger accepts messages through DEBUG level.
			root = { levelmax="DEBUG", appenders="*" },
			// ColdBox framework messages use the INFO category.
			info = [ "coldbox.system" ]
		};

	}

	/**
	 * Registers and activates the module after ColdBox finishes loading application services.
	 */
	function afterAspectsLoad( event, interceptData, rc, prc ){

		controller.getModuleService()
			.registerAndActivateModule(
				moduleName 		= request.MODULE_NAME,
				invocationPath 	= "moduleroot"
			);

        // Restart the renderer so helpers from the newly loaded module are available.
        controller.getRenderer().startup()
        // Tell interceptors to load helper methods added by the module.
        controller.getInterceptorService().announce( "cbLoadInterceptorHelpers" )
	}

}
