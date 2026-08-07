/**
 * Adds the build and release tools to a project.
 *
 * Run this task once from the project root:
 *   box task run taskFile=build/Install.cfc
 *
 * The task writes build/build.json, adds release scripts to box.json, creates a changelog when
 * needed, and copies RELEASE.md into the project. Existing files are kept unless :force=true is
 * provided, so the task can be run more than once.
 *
 * Initial settings come from the project. The test runner comes from box.json. The engine list
 * comes from server JSON files in the project root.
 */
component {

	/**
	 * Installs each build file and prints the next setup steps.
	 *
	 * @force Replace supported files that already exist.
	 */
	function run( boolean force = false ){
		variables.buildDir = getDirectoryFromPath( getCurrentTemplatePath() );
		variables.root     = reReplace( reReplace( variables.buildDir, "[\\/]$", "" ), "[\\/][^\\/]+$", "" );

		print.line().boldLine( "Setting up the build kit" ).line( repeatString( "-", 60 ) ).toConsole();

		if ( !fileExists( variables.root & "/box.json" ) ) {
			return error(
				"No box.json found at #variables.root#. Run this from a CommandBox package: "
				& "put this build folder in your project root and run the command from there."
			);
		}

		writeBuildJSON( arguments.force );
		patchBoxJSON();
		writeChangelog( arguments.force );
		copyReleaseDoc( arguments.force );

		print
			.line( repeatString( "-", 60 ) )
			.boldGreenLine( "Done." )
			.line()
			.boldLine( "Next steps:" )
			.line( "  1. Look through build/build.json and adjust anything that is wrong." )
			.line( "  2. Check you are ready:   box run-script release:check" )
			.line( "  3. Rehearse a release:    box run-script release:dryrun" )
			.line()
			.line( "RELEASE.md in your project root explains the whole routine." )
			.toConsole();
	}

	// Installation steps

	/**
	 * Writes build/build.json with settings detected from the project.
	 *
	 * @force Replace an existing build.json file.
	 */
	private function writeBuildJSON( required boolean force ){
		var path          = variables.buildDir & "build.json";
		var replacingSeed = fileExists( path ) && isInstallerSeed( path );
		if ( fileExists( path ) && !arguments.force && !replacingSeed ) {
			print.yellowLine( "  skip  build/build.json already exists (use :force=true to replace it)" ).toConsole();
			return;
		}

		var box         = deserializeJSON( fileRead( variables.root & "/box.json" ) );
		var projectType = detectProjectType( box );
		var settings = {
			"templateVersion" : "1.0.0",
			"projectType"     : projectType,
			"branch"          : detectBranch(),
			"changelog"       : detectChangelogName(),
			"testRunner"      : detectTestRunner( box ),
			"runTests"        : true,
			"publish"         : {
				"forgebox" : projectType == "module",
				"github"   : true
			},
			"excludes"    : defaultExcludes( projectType ),
			"excludesAdd" : [],
			"engines"     : detectEngines()
		};

		fileWrite( path, formatJSON( settings ) );
		print.greenLine( "  made  build/build.json#( replacingSeed ? " (replaced starter config)" : "" )#" ).toConsole();
		print.line( "        project type:   #settings.projectType#" ).toConsole();
		print.line( "        release branch: #settings.branch#" ).toConsole();
		print.line( "        test runner:    #settings.testRunner#" ).toConsole();
		print.line( "        engines:        #arrayLen( settings.engines )# found" ).toConsole();
	}

	/**
	 * Returns true when build.json is the starter file included with this build kit.
	 *
	 * Only a marked starter file can be replaced without force. Invalid files and user-created
	 * files are not replaced automatically.
	 *
	 * @path The full path of the build.json file to inspect.
	 */
	private boolean function isInstallerSeed( required string path ){
		try {
			var settings = deserializeJSON( fileRead( arguments.path ) );
			return isStruct( settings )
				&& isBoolean( settings._installerSeed ?: false )
				&& settings._installerSeed;
		} catch ( any e ) {
			return false;
		}
	}

	/**
	 * Adds missing build and release scripts to box.json.
	 *
	 * Existing script entries stay unchanged so the installer does not replace project commands.
	 */
	private function patchBoxJSON(){
		var path = variables.root & "/box.json";
		var box  = deserializeJSON( fileRead( path ) );

		if ( !structKeyExists( box, "scripts" ) ) {
			box[ "scripts" ] = {};
		}

		var wanted = {
			"release"         : "task run taskFile=build/Release.cfc target=run :version=`package show version`",
			"release:check"   : "task run taskFile=build/Doctor.cfc",
			"release:dryrun"  : "task run taskFile=build/Release.cfc target=run :version=`package show version` :dryRun=true",
			"release:existing-tag" : "task run taskFile=build/Release.cfc target=run :version=`package show version` :existingTag=true",
			"release:skip-tests" : "task run taskFile=build/Release.cfc target=run :version=`package show version` :skipTests=true",
			"release:hotfix"  : "task run taskFile=build/Release.cfc target=run :version=`package show version` :skipTests=true",
			"test:engines"    : "task run taskFile=build/TestEngines.cfc",
			"bump:major"      : "task run taskFile=build/Bump.cfc :level=major",
			"bump:minor"      : "task run taskFile=build/Bump.cfc :level=minor",
			"bump:patch"      : "task run taskFile=build/Bump.cfc :level=patch",
			"bump:prerelease" : "task run taskFile=build/Bump.cfc :level=prerelease",
			"bump:beta"       : "task run taskFile=build/Bump.cfc :level=preminor :preid=beta",
			"bump:alpha"      : "task run taskFile=build/Bump.cfc :level=preminor :preid=alpha",
			"build:package"   : "task run taskFile=build/Build.cfc :projectName=`package show slug` :version=`package show version`"
		};

		var added = [];
		var kept  = [];
		for ( var name in wanted ) {
			if ( structKeyExists( box.scripts, name ) ) {
				kept.append( name );
			} else {
				box.scripts[ name ] = wanted[ name ];
				added.append( name );
			}
		}

		if ( arrayLen( added ) ) {
			fileWrite( path, formatJSON( box ) );
			print.greenLine( "  added #arrayLen( added )# script#( arrayLen( added ) == 1 ? "" : "s" )# to box.json: #added.sort( "text" ).toList( ", " )#" ).toConsole();
		} else {
			print.yellowLine( "  skip  box.json already has every script" ).toConsole();
		}
		if ( arrayLen( kept ) ) {
			print.line( "        left alone: #kept.sort( "text" ).toList( ", " )#" ).toConsole();
		}
	}

	/**
	 * Creates a changelog with an [Unreleased] section when the project does not have one.
	 *
	 * @force Replace the existing changelog when true.
	 */
	private function writeChangelog( required boolean force ){
		var name = detectChangelogName();
		var path = variables.root & "/" & name;

		if ( fileExists( path ) && !arguments.force ) {
			print.yellowLine( "  skip  #name# already exists" ).toConsole();
			return;
		}

		var template = variables.buildDir & "templates/CHANGELOG.md";
		if ( fileExists( template ) ) {
			fileCopy( template, path );
		} else {
			fileWrite( path, defaultChangelog() );
		}
		print.greenLine( "  made  #name#" ).toConsole();
	}

	/**
	 * Copies the release instructions into RELEASE.md in the project root.
	 *
	 * @force Replace the existing RELEASE.md when true.
	 */
	private function copyReleaseDoc( required boolean force ){
		var source = variables.buildDir & "templates/RELEASE.md";
		var target = variables.root & "/RELEASE.md";

		if ( !fileExists( source ) ) {
			return;
		}
		if ( fileExists( target ) && !arguments.force ) {
			print.yellowLine( "  skip  RELEASE.md already exists" ).toConsole();
			return;
		}
		fileCopy( source, target );
		print.greenLine( "  made  RELEASE.md" ).toConsole();
	}

	// Project detection

	/**
	 * Uses the package type in box.json to classify the project as a module or application.
	 *
	 * @box The box.json data as a struct.
	 */
	private string function detectProjectType( required struct box ){
		var type = lCase( arguments.box.type ?: "" );
		// These CommandBox package types describe installable packages instead of applications.
		return listFindNoCase( "modules,commandbox-modules,cachebox-modules,logbox-modules,wirebox-modules,plugins,interceptors", type )
			? "module"
			: "app";
	}

	/**
	 * Returns the initial package exclusion list for the detected project type.
	 *
	 * The installer saves this list in build.json. A future build-kit update cannot change the
	 * project's reviewed package rules. Modules exclude development tools and all hidden items.
	 * Applications keep files that may be required during deployment, including .htaccess and
	 * .well-known.
	 *
	 * @projectType The detected "module" or "app" value.
	 */
	private array function defaultExcludes( required string projectType ){
		var common = [
			"^build$",
			"^node_modules$",
			"^test-harness$",
			"^tests$",
			"^test-results$",
			"^temp$",
			"^server(?:-.*)?\.json$",
			"^.*\.code-workspace$",
			"^(AGENTS|CLAUDE|DEVNOTES|RELEASE)\.md$",
			"\.bak$",
			"\.(zip|tar|tar\.gz|tgz|7z|rar)$"
		];

		if ( arguments.projectType == "module" ) {
			return [
				"^build$",
				"^modules$",
				"^node_modules$",
				"^resources$",
				"^test-harness$",
				"^tests$",
				"^test-results$",
				"^temp$",
				"^plans$",
				"^(package|package-lock)\.json$",
				"^webpack\.config\.js$",
				"^(vite|vitest)\.config\.js$",
				"^docker-compose\.yml$",
				"^server(?:-.*)?\.json$",
				"^.*\.code-workspace$",
				"^(AGENTS|CLAUDE|DEVNOTES|RELEASE)\.md$",
				"\.bak$",
				"\.(zip|tar|tar\.gz|tgz|7z|rar)$",
				"^\..*"
			];
		}

		// Applications may need .htaccess and .well-known at runtime. Other hidden paths may contain
		// local tools or sensitive configuration, so the package excludes them.
		common.append( "^\.(?!(?:htaccess|well-known)$).*" );
		return common;
	}

	/**
	 * Finds the production branch used for releases.
	 *
	 * A Gitflow production-branch setting has first priority. The current Git branch is next.
	 * The method returns "main" for a detached checkout or unavailable Git data.
	 */
	private string function detectBranch(){
		try {
			var config     = new BuildConfig( variables.buildDir );
			var production = config.execNative( "git", [ "config", "--get", "gitflow.branch.master" ] );
			if ( production.exitCode == 0 && len( trim( production.output ) ) ) {
				return trim( production.output );
			}

			var current = config.execNative( "git", [ "symbolic-ref", "--quiet", "--short", "HEAD" ] );
			if ( current.exitCode == 0 && len( trim( current.output ) ) ) {
				return trim( current.output );
			}
		} catch ( any ignored ) {
			// The installer can create usable settings without Git and will use "main" below.
		}
		return "main";
	}

	/**
	 * Returns the existing changelog name with the same letter case used on disk.
	 *
	 * Windows and macOS may find "changelog.md" even when the real name is "CHANGELOG.md". Linux
	 * requires the letter case to match. Reading the directory keeps build.json correct on every
	 * operating system. The fallback name is CHANGELOG.md.
	 */
	private string function detectChangelogName(){
		for ( var name in directoryList( variables.root, false, "name", "*.md" ) ) {
			if ( reFindNoCase( "^changelog\.md$", name ) ) {
				return name;
			}
		}
		return "CHANGELOG.md";
	}

	/**
	 * Returns the first TestBox runner URL from box.json.
	 *
	 * A default local URL is returned when box.json does not define a runner.
	 *
	 * @box The box.json data as a struct.
	 */
	private string function detectTestRunner( required struct box ){
		var runner = ( arguments.box.testbox.runner ?: "" );
		if ( isArray( runner ) && arrayLen( runner ) ) {
			runner = isStruct( runner[ 1 ] ) ? ( runner[ 1 ].default ?: "" ) : runner[ 1 ];
		} else if ( isStruct( runner ) ) {
			for ( var key in runner ) {
				runner = runner[ key ];
				break;
			}
		}
		return isSimpleValue( runner ) && len( trim( runner ) )
			? trim( runner )
			: "http://127.0.0.1:60299/tests/runner.cfm";
	}

	/**
	 * Creates engine settings from the server JSON files in the project root.
	 */
	private array function detectEngines(){
		var engines = [];
		var files   = directoryList( variables.root, false, "name", "*.json" )
			.filter( function( file ){
				return reFindNoCase( "^server(?:-.*)?\.json$", file );
			} );
		files.sort( "textnocase" );

		for ( var file in files ) {
			engines.append( { "name" : engineName( file ), "configFile" : file } );
		}
		return engines;
	}

	/**
	 * Returns a display name for one server JSON file.
	 *
	 * The app.cfengine value has first priority. The server name and file name are the next choices.
	 * An invalid server file still gets a name so the later server command can report the correct file.
	 *
	 * @file The server JSON file name.
	 */
	private string function engineName( required string file ){
		try {
			var serverSettings = deserializeJSON( fileRead( variables.root & "/" & arguments.file ) );
			if ( isStruct( serverSettings ) ) {
				var cfengine = "";
				if (
					structKeyExists( serverSettings, "app" )
					&& isStruct( serverSettings.app )
					&& structKeyExists( serverSettings.app, "cfengine" )
				) {
					cfengine = serverSettings.app.cfengine;
				}
				if ( isSimpleValue( cfengine ) && len( trim( cfengine ) ) ) {
					return readableEngineName( trim( cfengine ) );
				}

				var serverName = structKeyExists( serverSettings, "name" ) ? serverSettings.name : "";
				if ( isSimpleValue( serverName ) && len( trim( serverName ) ) ) {
					return trim( serverName );
				}
			}
		} catch ( any e ) {
			// Keep invalid server files in the list. The server command will validate the file later
			// and can report the correct configuration name.
		}

		var name = reReplaceNoCase( arguments.file, "^server-?", "" );
		name     = reReplaceNoCase( name, "\.json$", "" );
		return len( trim( name ) ) ? readableEngineName( name ) : "Server";
	}

	/**
	 * Converts an engine ID into a readable display name.
	 *
	 * For example, lucee@5 becomes Lucee 5 and boxlang-cfml@1 becomes Boxlang 1.
	 *
	 * @value A CommandBox engine ID or the base name of a server file.
	 */
	private string function readableEngineName( required string value ){
		var name = arguments.value;
		// Remove "cfml" because the word does not help identify the engine.
		name     = reReplaceNoCase( name, "[-_]cfml\b", "" );
		name     = replace( name, "@", " ", "all" );
		name     = replace( name, "-", " ", "all" );
		// Capitalize the first letter of each word for display.
		var words = listToArray( name, " " );
		for ( var i = 1; i <= arrayLen( words ); i++ ) {
			words[ i ] = uCase( left( words[ i ], 1 ) ) & mid( words[ i ], 2, len( words[ i ] ) );
		}
		return arrayToList( words, " " );
	}

	// Output helpers

	/**
	 * Converts a struct into readable JSON.
	 *
	 * The CommandBox formatter is used when available so the result matches box.json files written
	 * by CommandBox.
	 *
	 * @data The values to serialize as JSON.
	 */
	private string function formatJSON( required struct data ){
		var json = serializeJSON( arguments.data );
		try {
			return formatterUtil.formatJSON( json );
		} catch ( any e ) {
			return json;
		}
	}

	/**
	 * Returns the starter changelog used when the template file is missing.
	 */
	private string function defaultChangelog(){
		var lf = chr( 10 );
		// Build Markdown headings from the # character code. A literal # must be doubled inside a
		// CFML string, which makes headings with several # characters easy to write incorrectly.
		var h1 = repeatString( chr( 35 ), 1 ) & " ";
		var h2 = repeatString( chr( 35 ), 2 ) & " ";
		var h3 = repeatString( chr( 35 ), 3 ) & " ";

		return h1 & "Changelog" & lf & lf
			& "All notable changes to this project are written down here." & lf & lf
			& "The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)," & lf
			& "and the version numbers follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html)." & lf & lf
			& h2 & "[Unreleased]" & lf & lf
			& h3 & "Added" & lf & lf
			& "- Write your changes here as you go." & lf;
	}
}
