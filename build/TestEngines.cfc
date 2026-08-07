/**
 * Runs the complete test suite on each configured CFML engine.
 *
 * Run this task with: box run-script test:engines
 *
 * Run this task before a release. The release process does not run this task because an engine
 * startup problem should not block publishing. The release still runs the suite on the active engine.
 *
 * All engines share one port, so the task tests them in order. It stops all servers, starts one
 * engine, waits for the server, runs the suite, and stops that engine before starting the next.
 * A first run may take longer because CommandBox must download the engine.
 *
 * A failed engine does not prevent the remaining engines from running. The final report shows one
 * result per engine. The task exits with an error when any engine fails.
 *
 * Configure the engine list in build/build.json.
 */
component {

	/**
	 * Loads the shared build settings.
	 */
	function init(){
		variables.config = new BuildConfig( getDirectoryFromPath( getCurrentTemplatePath() ) );
		variables.s      = variables.config.getSettings();
		return this;
	}

	/**
	 * Tests each engine in order and prints a complete result report.
	 *
	 * Every engine runs even after a failure. The task returns an error when any engine fails so
	 * continuous integration can detect the failure. All configured servers are stopped at the end.
	 */
	function run(){
		if ( !arrayLen( variables.s.engines ) ) {
			return fail(
				"No engines are listed in build/build.json.",
				[
					'"engines": [',
					'    { "name": "Lucee 5",    "configFile": "server-lucee@5.json" },',
					'    { "name": "Adobe 2023", "configFile": "server-adobe@2023.json" }',
					']',
					"",
					"Each configFile is a server json file in your project root.",
					"Every engine you list is run, in the order you list them."
				],
				"Add them to build/build.json like this"
			);
		}

		var results = [];
		var started = getTickCount();

		// Stop all configured servers because only one server can use the shared port.
		stopAllEngines();

		for ( var engine in variables.s.engines ) {
			var engineName  = engine.name ?: engine.configFile;
			var engineStart = getTickCount();
			print.line().boldBlueLine( "=== #engineName# (#engine.configFile#) ===" ).toConsole();

			var startResult = startEngine( engine, engineName );
			if ( !startResult.ok ) {
				results.append( recordFailure( engineName, engineStart, startResult.reason ) );
				continue;
			}

			var warmUpResult = warmUp( engine, engineName );
			if ( !warmUpResult.ok ) {
				results.append( recordFailure( engineName, engineStart, warmUpResult.reason ) );
				continue;
			}

			print.blueLine( "Running the suite on #engineName#..." ).toConsole();
			var suiteFailed = false;
			try {
				command( "testbox run" )
					.params( runner = variables.s.testRunner, verbose = false )
					.run();
				suiteFailed = ( shell.getExitCode() != 0 );
			} catch ( any e ) {
				suiteFailed = true;
			}

			stopEngine( engine.configFile );

			if ( suiteFailed ) {
				results.append( recordFailure( engineName, engineStart, "the suite failed" ) );
				continue;
			}

			var minutes = numberFormat( ( getTickCount() - engineStart ) / 60000, "0.9" );
			results.append( {
				"name"    : engineName,
				"passed"  : true,
				"minutes" : minutes,
				"reason"  : ""
			} );
			print.boldGreenLine( "#engineName#: passed in #minutes# min." ).toConsole();
		}

		return report( results, started );
	}

	// Private helpers

	/**
	 * Starts one engine and returns a struct with ok and reason values.
	 *
	 * Returning a result instead of stopping the task lets the remaining engines run after a failure.
	 *
	 * @engine     The engine settings from build.json.
	 * @engineName The engine name shown in status messages.
	 */
	private struct function startEngine( required struct engine, required string engineName ){
		// A stopped server may keep the port for a short time. Wait for the port so the next engine
		// is not blamed for a conflict caused by the previous server.
		waitForPortToFree( arguments.engineName );

		var startFailed = false;
		var startError  = "";
		try {
			command( "server start" )
				.params( serverConfigFile = arguments.engine.configFile )
				.run();
			startFailed = ( shell.getExitCode() != 0 );
		} catch ( any e ) {
			startFailed = true;
			startError  = e.message;
		}
		if ( startFailed ) {
			print
				.line()
				.boldLine( "Why a server will not start, usually:" )
				.yellowLine( "  the file is missing from your project root" )
				.yellowLine( "  another server still holds the port" )
				.yellowLine( "  the engine could not be downloaded" )
				.line()
				.boldLine( "Try it by hand to see the real reason:" )
				.yellowLine( "  box server start serverConfigFile=#arguments.engine.configFile#" )
				.line()
				.toConsole();
			// A failed startup may still hold the port. Stop the server before testing the next engine.
			stopEngine( arguments.engine.configFile );
			return {
				"ok"     : false,
				"reason" : "would not start" & ( len( startError ) ? ": " & startError : "" )
			};
		}

		return { "ok" : true, "reason" : "" };
	}

	/**
	 * Waits until the previous server stops answering on the shared test port.
	 *
	 * The method gives up after a short wait. The next server command can then report the actual
	 * port conflict if the old server still owns the port.
	 *
	 * @engineName The engine name shown while the task waits.
	 */
	private function waitForPortToFree( required string engineName ){
		var probeUrl = variables.config.probeUrl();
		for ( var attempt = 1; attempt <= 12; attempt++ ) {
			var answered = false;
			try {
				cfhttp(
					url          = probeUrl,
					method       = "GET",
					timeout      = 5,
					throwonerror = false,
					redirect     = false,
					result       = "local.probe"
				);
				answered = ( val( local.probe.statuscode ?: "0" ) > 0 );
			} catch ( any e ) {
				answered = false;
			}
			if ( !answered ) {
				return;
			}
			if ( attempt == 1 ) {
				print.yellowLine( "Waiting for the previous server to release the port..." ).toConsole();
			}
			sleep( 5000 );
		}
		print
			.yellowLine( "Something still answers on the port. Starting #arguments.engineName# anyway." )
			.toConsole();
	}

	/**
	 * Waits for the site to answer before running tests on an engine.
	 *
	 * Tests against a partly started application can produce false failures. The returned ok and
	 * reason values let the task record a startup failure and continue with the next engine.
	 *
	 * @engine     The engine settings from build.json.
	 * @engineName The engine name shown in status messages.
	 */
	private struct function warmUp( required struct engine, required string engineName ){
		var attempts = variables.s.warmup.attempts;
		var delay    = variables.s.warmup.delaySeconds;
		var probeUrl = variables.config.probeUrl();

		print.blueLine( "Waiting for #arguments.engineName# (up to #attempts * delay# seconds)..." ).toConsole();
		var lastStatus = 0;
		for ( var attempt = 1; attempt <= attempts; attempt++ ) {
			var httpResult = "";
			try {
				cfhttp(
					url          = probeUrl,
					method       = "GET",
					timeout      = 60,
					throwonerror = false,
					redirect     = false,
					result       = "local.httpResult"
				);
				lastStatus = val( httpResult.statuscode ?: "0" );
			} catch ( any e ) {
				lastStatus = 0;
			}
			// Any HTTP status from 200 through 399 confirms that the server answered.
			if ( lastStatus >= 200 && lastStatus < 400 ) {
				print.greenLine( "#arguments.engineName# is up (status #lastStatus#)." ).toConsole();
				return { "ok" : true, "reason" : "" };
			}
			sleep( delay * 1000 );
		}

		stopEngine( arguments.engine.configFile );
		print
			.line()
			.yellowLine(
				"A repeating 500 usually means the app will not start on this engine. Start it by hand and read the log:"
			)
			.yellowLine( "  box server start serverConfigFile=#arguments.engine.configFile#" )
			.line()
			.toConsole();

		return { "ok" : false, "reason" : "never answered (last status: #lastStatus#)" };
	}

	/**
	 * Stops every configured engine and ignores stop failures.
	 *
	 * Only one engine should be running. CommandBox may still print a message for the others.
	 */
	private function stopAllEngines(){
		print.blueLine( "Stopping any running server..." ).toConsole();
		for ( var engine in variables.s.engines ) {
			stopEngine( engine.configFile );
		}
	}

	/**
	 * Stops one server and ignores failures.
	 *
	 * A failure means the server was already stopped or the next startup will report the port problem.
	 *
	 * @configFile The server JSON file for the engine being stopped.
	 */
	private function stopEngine( required string configFile ){
		try {
			command( "server stop" ).params( serverConfigFile = arguments.configFile ).run();
		} catch ( any e ) {
			// The server may already be stopped.
		}
	}

	/**
	 * Records an engine failure and prints a one-line reason.
	 *
	 * @engineName  The engine name shown in the result.
	 * @engineStart The tick count recorded before this engine started.
	 * @reason      A short explanation of why the engine failed.
	 */
	private struct function recordFailure( required string engineName, required numeric engineStart, required string reason ){
		var minutes = numberFormat( ( getTickCount() - arguments.engineStart ) / 60000, "0.9" );
		print.boldRedLine( "#arguments.engineName#: FAILED after #minutes# min -- #arguments.reason#" ).toConsole();
		return {
			"name"    : arguments.engineName,
			"passed"  : false,
			"minutes" : minutes,
			"reason"  : arguments.reason
		};
	}

	/**
	 * Prints one result per engine and returns an error when any engine failed.
	 *
	 * The error gives continuous integration a failing exit code.
	 *
	 * @results One result per engine in execution order.
	 * @started The tick count recorded before the first engine started.
	 */
	private function report( required array results, required numeric started ){
		var totalMinutes = numberFormat( ( getTickCount() - arguments.started ) / 60000, "0.9" );
		var failed       = arguments.results.filter( function( result ){
			return !result.passed;
		} );

		print.line().boldLine( "Results (#totalMinutes# min total):" ).toConsole();
		for ( var result in arguments.results ) {
			if ( result.passed ) {
				print.greenLine( "  PASSED  #result.name# (#result.minutes# min)" ).toConsole();
			} else {
				print.redLine( "  FAILED  #result.name# (#result.minutes# min) -- #result.reason#" ).toConsole();
			}
		}
		print.line().toConsole();

		if ( !failed.len() ) {
			print.boldGreenLine( "All #arguments.results.len()# engines passed." ).toConsole();
			return;
		}

		var failedNames = failed.map( function( result ){
			return result.name;
		} );

		return error(
			"#failed.len()# of #arguments.results.len()# engines failed: "
			& failedNames.toList( ", " ) & "."
		);
	}

	/**
	 * Prints detailed guidance and then stops the task with a short error.
	 *
	 * CommandBox error messages remove line breaks. Printing the guidance first keeps its layout.
	 * error() receives only the one-line summary because it ends the task immediately.
	 *
	 * @summary A one-line description of the failure.
	 * @detail  The guidance lines printed before the error.
	 * @heading The heading printed above the guidance.
	 */
	private function fail( required string summary, array detail = [], string heading = "What to do" ){
		if ( arrayLen( arguments.detail ) ) {
			print.line().boldLine( arguments.heading & ":" ).toConsole();
			for ( var line in arguments.detail ) {
				print.yellowLine( "  " & line ).toConsole();
			}
			print.line().toConsole();
		}
		return error( arguments.summary );
	}
}
