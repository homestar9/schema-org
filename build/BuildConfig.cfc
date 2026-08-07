/**
 * Loads shared settings and provides common helpers for every build task.
 *
 * Each build task creates this component first. The component finds the project root, reads
 * build/build.json, fills missing settings, and returns one settings struct. It also provides
 * one consistent way to run external programs such as Git and the GitHub CLI.
 *
 * Put project-specific values in build.json instead of editing this component.
 */
component {

	/**
	 * Finds the project root, then loads and validates the build settings.
	 *
	 * @buildDir The folder that contains the build tasks. Callers pass the directory returned by
	 *           getDirectoryFromPath( getCurrentTemplatePath() ).
	 */
	function init( required string buildDir ){
		variables.buildDir = reReplace( arguments.buildDir, "[\\/]$", "" );
		// The build folder sits directly inside the project root.
		variables.root        = reReplace( variables.buildDir, "[\\/][^\\/]+$", "" );
		variables.binaryCache = {};
		// Track values set in build.json. A derived default must not replace a value the user chose.
		variables.touchedKeys = {};
		variables.settings    = loadSettings();
		return this;
	}

	/**
	 * Returns all validated build settings.
	 */
	struct function getSettings(){
		return variables.settings;
	}

	/**
	 * Returns one build setting or a fallback value.
	 *
	 * @key          The build setting name, such as "branch".
	 * @defaultValue The value returned when the setting does not exist.
	 */
	function get( required string key, defaultValue = "" ){
		return structKeyExists( variables.settings, arguments.key ) ? variables.settings[ arguments.key ] : arguments.defaultValue;
	}

	/**
	 * Returns the full path for an item inside the project root.
	 *
	 * Do not name this method resolvePath. CommandBox tasks already provide a resolvePath() method.
	 * That method takes priority and resolves paths from the task folder instead of the project root.
	 *
	 * @relative A project-relative path, such as "CHANGELOG.md".
	 */
	string function repoPath( required string relative ){
		return variables.root & "/" & arguments.relative;
	}

	/**
	 * Returns the full path for an item inside the build folder.
	 *
	 * @relative A build-folder-relative path, such as "templates/RELEASE.md".
	 */
	string function buildPath( required string relative ){
		return variables.buildDir & "/" & arguments.relative;
	}

	/**
	 * Returns the absolute path of the project root.
	 */
	string function getRoot(){
		return variables.root;
	}

	/**
	 * Reads box.json and returns its contents as a struct.
	 */
	struct function boxJSON(){
		var path = repoPath( "box.json" );
		if ( !fileExists( path ) ) {
			throw( type = "BuildConfig", message = "No box.json found at #path#. Run build tasks from a CommandBox package." );
		}
		return deserializeJSON( fileRead( path ) );
	}

	/**
	 * Returns the package slug from box.json or the package name when the slug is missing.
	 */
	string function slug(){
		var box = boxJSON();
		return box.slug ?: ( box.name ?: "package" );
	}

	/**
	 * Returns the package version from box.json.
	 */
	string function version(){
		return boxJSON().version ?: "0.0.0";
	}

	/**
	 * Runs an external program and returns its exit code and text output.
	 *
	 * This method returns failures instead of throwing them. The caller can then decide whether a
	 * non-zero exit code is expected. For example, some Git checks use a non-zero code as a valid answer.
	 *
	 * Each argument is passed separately, so paths with spaces do not need quotes. Java starts the
	 * process because CommandBox gives command helpers to task files but not to plain components.
	 * The process does not support shell features such as pipes, redirects, or wildcards.
	 *
	 * @name The executable name, such as "git".
	 * @args The separate command arguments, such as [ "status", "--porcelain" ].
	 */
	struct function execNative( required string name, array args = [] ){
		var binary  = findBinary( arguments.name );
		var argList = createObject( "java", "java.util.ArrayList" ).init();
		argList.add( javaCast( "string", binary ) );
		for ( var arg in arguments.args ) {
			argList.add( javaCast( "string", arg ) );
		}

		try {
			var builder = createObject( "java", "java.lang.ProcessBuilder" ).init( argList );
			builder.directory( createObject( "java", "java.io.File" ).init( variables.root ) );
			// Combine normal and error output so callers can show the program's full response.
			builder.redirectErrorStream( javaCast( "boolean", true ) );

			var process = builder.start();
			var reader  = createObject( "java", "java.io.BufferedReader" ).init(
				createObject( "java", "java.io.InputStreamReader" ).init( process.getInputStream() )
			);

			var output = createObject( "java", "java.lang.StringBuilder" ).init();
			var line   = reader.readLine();
			while ( !isNull( line ) ) {
				output.append( line ).append( chr( 10 ) );
				line = reader.readLine();
			}
			reader.close();

			return { exitCode : process.waitFor(), output : trim( output.toString() ) };
		} catch ( any e ) {
			// Starting the process usually fails because the program is missing. Exit code 127 is the
			// standard "command not found" code, so callers can recognize that case.
			return {
				exitCode : 127,
				output   : "Could not run '#arguments.name#': #e.message#"
			};
		}
	}

	/**
	 * Returns true when the program can be found on this computer.
	 *
	 * @name The executable name, such as "gh".
	 */
	boolean function commandExists( required string name ){
		// findBinary() returns a full path when it finds the program and the original name otherwise.
		return findBinary( arguments.name ) != arguments.name;
	}

	/**
	 * Finds a program and returns its full path, such as C:\Program Files\Git\cmd\git.exe.
	 *
	 * Returns the original program name when no file is found. The operating system can then try
	 * its own lookup and produce a useful error. The returned path has no quotes because Java passes
	 * it as one argument. Quotes would become part of the file name.
	 *
	 * The search checks PATH first and then checks common install folders. A terminal can have an
	 * old PATH when a program was installed after the terminal opened. Checking common folders lets
	 * the build find the new program without requiring a new terminal.
	 *
	 * The component caches each result until the current task ends.
	 *
	 * @name The executable name, such as "git" or "gh".
	 */
	string function findBinary( required string name ){
		if ( structKeyExists( variables.binaryCache, arguments.name ) ) {
			return variables.binaryCache[ arguments.name ];
		}

		var jFile     = createObject( "java", "java.io.File" );
		var separator = jFile.separator;
		var resolved  = arguments.name;
		// macOS and Linux use no extension. Windows programs may use the other extensions.
		var extensions = [ "", ".exe", ".cmd", ".bat" ];

		var searchDirs = [];
		var pathEnv    = createObject( "java", "java.lang.System" ).getenv( "PATH" );
		if ( !isNull( pathEnv ) ) {
			searchDirs.append( listToArray( pathEnv, jFile.pathSeparator ), true );
		}
		searchDirs.append( wellKnownDirs(), true );

		for ( var dir in searchDirs ) {
			if ( !len( trim( dir ) ) ) {
				continue;
			}
			for ( var ext in extensions ) {
				var candidate = reReplace( dir, "[\\/]$", "" ) & separator & arguments.name & ext;
				if ( fileExists( candidate ) ) {
					resolved = candidate;
					break;
				}
			}
			if ( resolved != arguments.name ) {
				break;
			}
		}

		variables.binaryCache[ arguments.name ] = resolved;
		return resolved;
	}

	// Private helpers

	/**
	 * Returns common program folders to search when PATH does not contain a program.
	 */
	private array function wellKnownDirs(){
		var sys  = createObject( "java", "java.lang.System" );
		var dirs = [];

		var programFiles   = sys.getenv( "ProgramFiles" );
		var programFilesX86 = sys.getenv( "ProgramFiles(x86)" );
		var localAppData   = sys.getenv( "LOCALAPPDATA" );

		if ( !isNull( programFiles ) ) {
			dirs.append( programFiles & "\GitHub CLI" );
			dirs.append( programFiles & "\Git\cmd" );
			dirs.append( programFiles & "\Git\bin" );
			dirs.append( programFiles & "\nodejs" );
		}
		if ( !isNull( programFilesX86 ) ) {
			dirs.append( programFilesX86 & "\GitHub CLI" );
			dirs.append( programFilesX86 & "\Git\cmd" );
		}
		if ( !isNull( localAppData ) ) {
			dirs.append( localAppData & "\Programs\GitHub CLI" );
			dirs.append( localAppData & "\Microsoft\WinGet\Links" );
			dirs.append( localAppData & "\Programs\Git\cmd" );
		}

		// Common macOS and Linux program folders.
		dirs.append( "/usr/local/bin" );
		dirs.append( "/usr/bin" );
		dirs.append( "/bin" );
		dirs.append( "/opt/homebrew/bin" );
		dirs.append( "/opt/local/bin" );
		dirs.append( "/snap/bin" );

		return dirs;
	}

	/**
	 * Loads defaults, applies values from build.json, and validates the final settings.
	 */
	private struct function loadSettings(){
		var result   = defaults();
		var jsonPath = buildPath( "build.json" );

		if ( fileExists( jsonPath ) ) {
			var raw = trim( fileRead( jsonPath ) );
			if ( len( raw ) ) {
				var userSettings = "";
				try {
					userSettings = deserializeJSON( raw );
				} catch ( any e ) {
					throw(
						type    = "BuildConfig",
						message = "build/build.json is not valid JSON (#e.message#). Two common causes: a value left unquoted, and a single backslash. Backslashes must be doubled in JSON, so a regular expression looks like ""\\.avif$""."
					);
				}
				if ( !isStruct( userSettings ) ) {
					throw( type = "BuildConfig", message = "build/build.json must hold a JSON object, for example { ""branch"": ""main"" }." );
				}
				result = merge( result, userSettings );
			}
		}

		applyProjectTypeDefaults( result );
		fillDerivedDefaults( result );
		validate( result );
		return result;
	}

	/**
	 * Returns the settings used when build.json does not provide a value.
	 */
	private struct function defaults(){
		return {
			"templateVersion" : "1.0.0",
			"projectType"     : "module",
			"branch"          : "main",
			"changelog"       : "CHANGELOG.md",
			// A blank value tells fillDerivedDefaults() to read the runner from box.json.
			"testRunner"      : "",
			"runTests"        : true,
			"gitSync"         : true,
			"requireCleanTree": true,
			"coldboxMapping"  : "test-harness/coldbox",
			"stagingDir"      : ".tmp",
			"artifactsDir"    : ".artifacts",
			"tagPrefix"       : "v",
			"publish"         : { "forgebox" : true, "github" : true },
			"excludes"        : defaultExcludes(),
			"excludesAdd"     : [],
			"engines"         : [],
			"warmup"          : { "attempts" : 60, "delaySeconds" : 5 }
		};
	}

	/**
	 * Returns the top-level files and folders that are not included in the package.
	 *
	 * Each regular expression checks one top-level name. Regular expressions use partial matches.
	 * For example, "modules" also matches "modules_app" unless the pattern is anchored. The build
	 * copies every file inside a folder that is not excluded.
	 *
	 * Use excludesAdd in build.json to add project patterns without replacing this list.
	 */
	private array function defaultExcludes(){
		return [
			// Build tools are not part of the published module.
			"^[\\/]?build$",
			// CommandBox installs these dependencies from box.json.
			"^[\\/]?modules$",
			"^[\\/]?node_modules$",
			// Test files are not part of the published module.
			"^[\\/]?test-harness$",
			"^[\\/]?tests$",
			"^[\\/]?test-results$",
			// Server settings and temporary working folders stay local.
			"server-.*\.json",
			"^[\\/]?temp$",
			"^[\\/]?plans$",
			// Development notes are not part of the published module.
			"(AGENTS|CLAUDE|DEVNOTES|RELEASE)\.md",
			"\.bak$",
			// Existing archives can make the package much larger and are never required at runtime.
			"\.(zip|tar|tar\.gz|tgz|7z|rar)$",
			// Hidden paths include source control data, secrets, artifacts, and temporary files.
			"^[\\/]?\..*"
		];
	}

	/**
	 * Adjusts default settings for the selected project type.
	 *
	 * Application projects do not publish to ForgeBox by default. build.json can still enable it.
	 *
	 * @settings The settings struct to update directly.
	 */
	private void function applyProjectTypeDefaults( required struct settings ){
		// Change only the default value. Keep any publish.forgebox value set in build.json.
		if ( lCase( arguments.settings.projectType ) == "app" && !userTouched( "publish.forgebox" ) ) {
			arguments.settings.publish.forgebox = false;
		}
	}

	/**
	 * Fills settings that can be read from other project files.
	 *
	 * The test runner URL comes from box.json when build.json does not provide one.
	 *
	 * @settings The settings struct to update directly.
	 */
	private void function fillDerivedDefaults( required struct settings ){
		if ( len( trim( arguments.settings.testRunner ) ) ) {
			return;
		}
		var box = "";
		try {
			box = boxJSON();
		} catch ( any e ) {
			box = {};
		}
		var runner = ( box.testbox.runner ?: "" );
		// testbox.runner can contain several named runners. Use the first available URL.
		if ( isArray( runner ) && arrayLen( runner ) ) {
			runner = isStruct( runner[ 1 ] ) ? ( runner[ 1 ].default ?: "" ) : runner[ 1 ];
		} else if ( isStruct( runner ) ) {
			for ( var key in runner ) {
				runner = runner[ key ];
				break;
			}
		}
		arguments.settings.testRunner = isSimpleValue( runner ) && len( trim( runner ) )
			? trim( runner )
			: "http://127.0.0.1:60299/tests/runner.cfm";
	}

	/**
	 * Copies values from one struct over a base struct.
	 *
	 * Nested structs merge one key at a time. For example, setting publish.github keeps the default
	 * value for publish.forgebox. Arrays replace the original array as one complete value.
	 *
	 * @base    The default values copied into the result first.
	 * @overlay The values to copy onto the base struct.
	 */
	private struct function merge( required struct base, required struct overlay ){
		var result = duplicate( arguments.base );
		for ( var key in arguments.overlay ) {
			var incoming = arguments.overlay[ key ];
			if (
				structKeyExists( result, key )
				&& isStruct( result[ key ] )
				&& isStruct( incoming )
			) {
				result[ key ] = merge( result[ key ], incoming );
				for ( var sub in incoming ) {
					variables.touchedKeys[ key & "." & sub ] = true;
				}
			} else {
				result[ key ] = incoming;
				variables.touchedKeys[ key ] = true;
			}
		}
		return result;
	}

	/**
	 * Returns true when build.json provided the given setting.
	 *
	 * This check prevents a derived default from replacing a value the user selected.
	 *
	 * @key The complete setting key, such as "publish.forgebox".
	 */
	private boolean function userTouched( required string key ){
		return structKeyExists( variables.touchedKeys ?: {}, arguments.key );
	}

	/**
	 * Checks every build setting and reports invalid values before the build starts.
	 *
	 * @settings The complete settings struct to validate.
	 */
	private void function validate( required struct settings ){
		var s = arguments.settings;

		if ( !listFindNoCase( "module,app", s.projectType ) ) {
			throw( type = "BuildConfig", message = "build.json projectType must be ""module"" or ""app"", not ""#s.projectType#""." );
		}
		if ( !len( trim( s.branch ) ) ) {
			throw( type = "BuildConfig", message = "build.json branch cannot be empty. Use the branch you release from, for example ""main""." );
		}
		if ( !len( trim( s.changelog ) ) ) {
			throw( type = "BuildConfig", message = "build.json changelog cannot be empty. Name your changelog file, for example ""CHANGELOG.md""." );
		}
		if ( !isBoolean( s.runTests ) ) {
			throw( type = "BuildConfig", message = "build.json runTests must be true or false." );
		}
		if ( !isStruct( s.publish ) || !structKeyExists( s.publish, "forgebox" ) || !structKeyExists( s.publish, "github" ) ) {
			throw( type = "BuildConfig", message = "build.json publish must look like { ""forgebox"": true, ""github"": true }." );
		}
		if ( !isBoolean( s.publish.forgebox ) || !isBoolean( s.publish.github ) ) {
			throw( type = "BuildConfig", message = "build.json publish.forgebox and publish.github must be true or false." );
		}
		if ( !isArray( s.excludes ) || !isArray( s.excludesAdd ) ) {
			throw( type = "BuildConfig", message = "build.json excludes and excludesAdd must be arrays of regular expressions." );
		}
		if ( !isArray( s.engines ) ) {
			throw( type = "BuildConfig", message = "build.json engines must be an array like [ { ""name"": ""Lucee 5"", ""configFile"": ""server-lucee@5.json"" } ]." );
		}
		for ( var engine in s.engines ) {
			if ( !isStruct( engine ) || !structKeyExists( engine, "configFile" ) ) {
				throw(
					type    = "BuildConfig",
					message = "Every entry in build.json engines needs a configFile, for example { ""name"": ""Lucee 5"", ""configFile"": ""server-lucee@5.json"" }."
				);
			}
		}
		if ( !isStruct( s.warmup ) || !isNumeric( s.warmup.attempts ?: "" ) || !isNumeric( s.warmup.delaySeconds ?: "" ) ) {
			throw( type = "BuildConfig", message = "build.json warmup must look like { ""attempts"": 60, ""delaySeconds"": 5 }." );
		}
		if ( !reFindNoCase( "^https?://", s.testRunner ) ) {
			throw( type = "BuildConfig", message = "build.json testRunner must be a full URL, for example ""http://127.0.0.1:60310/tests/runner.cfm""." );
		}
	}

	/**
	 * Returns the base exclusion patterns followed by the patterns in excludesAdd.
	 */
	array function allExcludes(){
		var result = duplicate( variables.settings.excludes );
		result.append( variables.settings.excludesAdd, true );
		return result;
	}

	/**
	 * Returns the site root used to check whether the test server is running.
	 *
	 * The check does not request the test runner because that request would start the test suite.
	 */
	string function probeUrl(){
		return reReplaceNoCase( variables.settings.testRunner, "^(https?://[^/]+).*$", "\1" ) & "/";
	}
}
