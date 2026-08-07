/**
 * Builds the release package and checks that the package is complete.
 *
 * Run this task with: box run-script build:package
 *
 * The task runs the tests first. It then copies the allowed source files into a temporary staging
 * folder, adds the version, creates the zip file, checks the file count, and writes checksums.
 * The finished files are stored in .artifacts/<slug>/<version>/.
 *
 * Read project-specific settings from build/build.json instead of editing this task.
 */
component {

	/**
	 * Loads the build settings and prepares empty staging and artifact folders.
	 */
	function init(){
		variables.config = new BuildConfig( getDirectoryFromPath( getCurrentTemplatePath() ) );
		variables.s      = variables.config.getSettings();
		variables.root   = variables.config.getRoot();

		variables.buildDir     = variables.root & "/" & variables.s.stagingDir;
		variables.artifactsDir = variables.root & "/" & variables.s.artifactsDir;

		// Remove old build files so they cannot be included in the new package.
		[ variables.buildDir, variables.artifactsDir ].each( function( item ){
			if ( directoryExists( item ) ) {
				directoryDelete( item, true );
			}
			directoryCreate( item, true, true );
		} );

		// Some projects need the ColdBox mapping to load their components during a build.
		// Create the mapping only when the configured ColdBox folder exists.
		if ( len( trim( variables.s.coldboxMapping ) ) ) {
			var coldboxPath = variables.root & "/" & variables.s.coldboxMapping;
			if ( directoryExists( coldboxPath ) ) {
				fileSystemUtil.createMapping( "coldbox", coldboxPath );
			}
		}

		return this;
	}

	/**
	 * Runs the tests, creates the release package, and writes checksum files.
	 *
	 * @projectName The package-folder and zip name. A blank value uses the slug from box.json.
	 * @version     The release version. A blank value uses the version from box.json.
	 * @buildID     The build identifier. A blank value uses the short Git commit hash.
	 * @branch      The branch being built. A blank value uses the current branch.
	 * @skipTests   Skip the test suite for this build. Use true only after testing this version.
	 *              The task prints a warning when tests are skipped.
	 */
	function run(
		string projectName = "",
		string version     = "",
		string buildID     = "",
		string branch      = "",
		boolean skipTests  = false
	){
		fillDefaults( arguments );

		if ( arguments.skipTests || !variables.s.runTests ) {
			var reason = arguments.skipTests ? "asked for with skipTests" : "turned off in build.json";
			print
				.line()
				.boldYellowLine( "WARNING: the test suite was skipped (#reason#)." )
				.yellowLine( "This package has not been tested by this build." )
				.line()
				.toConsole();
		} else {
			ensureTestRunnerReachable();
			runTests();
		}

		// The project mapping lets the build load components from the project root.
		fileSystemUtil.createMapping( arguments.projectName, variables.root );

		buildSource( argumentCollection = arguments );
		buildChecksums();

		print.line().boldMagentaLine( "Build finished. The package is in #variables.exportsDir#" ).toConsole();
	}

	/**
	 * Runs the test suite and stops the build when a test fails.
	 */
	function runTests(){
		print.blueLine( "Running the test suite, please wait..." ).toConsole();

		command( "testbox run" )
			.params( runner = variables.s.testRunner, verbose = false )
			.run();

		if ( shell.getExitCode() ) {
			return error( "Stopping: the tests failed. Fix them, or use skipTests to build anyway." );
		}
	}

	/**
	 * Copies the source into staging, adds version data, and creates a complete zip file.
	 *
	 * @projectName The package-folder and zip name.
	 * @version     The release version.
	 * @buildID     The commit or continuous-integration build identifier.
	 * @branch      The source branch name.
	 * @skipTests   An unused value accepted so run() can pass its complete argument struct.
	 */
	function buildSource(
		string projectName = "",
		string version     = "",
		string buildID     = "",
		string branch      = "",
		boolean skipTests  = false
	){
		fillDefaults( arguments );

		print
			.line()
			.boldMagentaLine(
				"Building #arguments.projectName# #arguments.version#+#arguments.buildID# from the #arguments.branch# branch."
			)
			.toConsole();

		ensureExportDir( arguments.projectName, arguments.version );

		variables.projectBuildDir = variables.buildDir & "/#arguments.projectName#";
		directoryCreate( variables.projectBuildDir, true, true );

		print.blueLine( "Copying source into the staging folder..." ).toConsole();
		copy( variables.root, variables.projectBuildDir );

		// Record the source commit inside the package for later reference.
		fileWrite(
			"#variables.projectBuildDir#/#arguments.projectName#-#arguments.version#+#arguments.buildID#",
			"Built from commit #arguments.buildID# on #dateTimeFormat( now(), "full" )#"
		);

		// Replace version placeholders in the staged files. Release-branch builds include the build
		// identifier. Builds from other branches use "snapshot" instead.
		print.greenLine( "Stamping version #arguments.version#" ).toConsole();
		command( "tokenReplace" )
			.params(
				path        = "#variables.projectBuildDir#/**",
				token       = "@build.version@",
				replacement = arguments.version
			)
			.run();

		var isReleaseBranch = ( arguments.branch == variables.s.branch );
		print.greenLine( "Stamping build identifier #arguments.buildID#" ).toConsole();
		command( "tokenReplace" )
			.params(
				path        = "#variables.projectBuildDir#/**",
				token       = ( isReleaseBranch ? "@build.number@" : "+@build.number@" ),
				replacement = ( isReleaseBranch ? arguments.buildID : "-snapshot" )
			)
			.run();

		var destination = "#variables.exportsDir#/#arguments.projectName#-#arguments.version#.zip";
		print.greenLine( "Zipping to #destination#" ).toConsole();
		cfzip(
			action    = "zip",
			file      = "#destination#",
			source    = "#variables.projectBuildDir#",
			overwrite = true,
			recurse   = true
		);

		verifyZip( destination );

		// Copy box.json next to the zip so the package details can be read without opening the zip.
		fileCopy( "#variables.projectBuildDir#/box.json", variables.exportsDir );
	}

	// Private helpers

	/**
	 * Fills blank build arguments with values from box.json and Git.
	 *
	 * Using one helper gives every public build method the same default values.
	 *
	 * @args The build arguments to update directly.
	 */
	private void function fillDefaults( required struct args ){
		if ( !len( trim( arguments.args.projectName ?: "" ) ) ) {
			arguments.args.projectName = variables.config.slug();
		}
		if ( !len( trim( arguments.args.version ?: "" ) ) ) {
			arguments.args.version = variables.config.version();
		}
		if ( !len( trim( arguments.args.branch ?: "" ) ) ) {
			arguments.args.branch = getCurrentBranch();
		}
		if ( !len( trim( arguments.args.buildID ?: "" ) ) ) {
			arguments.args.buildID = getCurrentCommit();
		}
	}

	/**
	 * Reads the current branch directly from .git/HEAD without running Git.
	 *
	 * The configured release branch is returned when .git/HEAD is unavailable. This case can occur
	 * when the build runs from a copied project that does not include the .git folder.
	 */
	private string function getCurrentBranch(){
		var headFile = variables.root & "/.git/HEAD";
		if ( !fileExists( headFile ) ) {
			return variables.s.branch;
		}
		var head = trim( fileRead( headFile ) );
		if ( left( head, 16 ) == "ref: refs/heads/" ) {
			return replace( head, "ref: refs/heads/", "" );
		}
		// A detached HEAD contains a commit hash, so use the configured release branch instead.
		return variables.s.branch;
	}

	/**
	 * Reads the short commit hash directly from the .git folder without running Git.
	 *
	 * Returns "nocommit" when the commit data is unavailable.
	 */
	private string function getCurrentCommit(){
		var headFile = variables.root & "/.git/HEAD";
		if ( !fileExists( headFile ) ) {
			return "nocommit";
		}
		var head = trim( fileRead( headFile ) );
		var sha  = "";

		if ( left( head, 5 ) == "ref: " ) {
			// A branch-based HEAD points to a file that normally contains the commit hash.
			// Git may move that reference into .git/packed-refs during repository cleanup.
			var ref     = trim( mid( head, 6, len( head ) ) );
			var refFile = variables.root & "/.git/" & ref;
			if ( fileExists( refFile ) ) {
				sha = trim( fileRead( refFile ) );
			} else {
				var packedFile = variables.root & "/.git/packed-refs";
				if ( fileExists( packedFile ) ) {
					for ( var rawLine in listToArray( fileRead( packedFile ), chr( 10 ) ) ) {
						var line = trim( rawLine );
						// Each entry uses "<hash> <ref>". Ignore comment lines and peeled tag lines.
						if ( len( line ) && left( line, 1 ) != "##" && left( line, 1 ) != "^" && right( line, len( ref ) ) == ref ) {
							sha = listFirst( line, " " );
							break;
						}
					}
				}
			}
		} else {
			// A detached HEAD stores the commit hash directly.
			sha = head;
		}

		return len( sha ) ? left( sha, 7 ) : "nocommit";
	}

	/**
	 * Stops the build when the test server does not answer.
	 *
	 * This check is separate from runTests() so a server problem is not reported as a test failure.
	 * The request uses the site root because requesting the test runner would start the test suite.
	 */
	private function ensureTestRunnerReachable(){
		var probeUrl   = variables.config.probeUrl();
		var httpResult = "";
		try {
			cfhttp(
				url          = probeUrl,
				method       = "GET",
				timeout      = 15,
				throwonerror = false,
				redirect     = false,
				result       = "local.httpResult"
			);
		} catch ( any e ) {
			httpResult = { statuscode : "0" };
		}
		// Any HTTP status from 200 through 399 confirms that the server answered.
		var statusCode = val( httpResult.statuscode ?: "0" );
		if ( statusCode < 200 || statusCode >= 400 ) {
			return error(
				"No answer from the test server at #probeUrl# (status #statusCode#). "
				& "Start a server first, then run this again. "
				& "To build without running the tests, add :skipTests=true."
			);
		}
	}

	/**
	 * Writes SHA-512 and MD5 checksum files next to the zip.
	 *
	 * A checksum lets a user confirm that a downloaded file matches the original package.
	 */
	private function buildChecksums(){
		print.greenLine( "Writing checksums" ).toConsole();
		command( "checksum" )
			.params(
				path      = "#variables.exportsDir#/*.zip",
				algorithm = "SHA-512",
				extension = "sha512",
				write     = true
			)
			.run();
		command( "checksum" )
			.params(
				path      = "#variables.exportsDir#/*.zip",
				algorithm = "md5",
				extension = "md5",
				write     = true
			)
			.run();
	}

	/**
	 * Stops the build when the zip and staging folder contain different numbers of files.
	 *
	 * The count detects missing files without depending on a specific cause. This check protects
	 * against exclusion rules that accidentally remove source folders from a published package.
	 *
	 * @zipPath The full path of the newly created zip.
	 */
	private function verifyZip( required string zipPath ){
		cfzip( action = "list", file = arguments.zipPath, name = "local.zipEntries" );

		var stagedCount = directoryList( variables.projectBuildDir, true, "path" )
			.filter( function( item ){
				return fileExists( item );
			} )
			.len();

		// A zip contains entries for folders, but the staging count includes only files.
		var zippedCount = 0;
		for ( var row in local.zipEntries ) {
			if ( row.type == "file" ) {
				zippedCount++;
			}
		}

		if ( zippedCount != stagedCount ) {
			return error(
				"The zip is incomplete: #stagedCount# files were staged but the zip holds #zippedCount#. "
				& "Check .gitignore and the excludes in build/build.json for a rule matching source files. "
				& "Staging folder: #variables.projectBuildDir#"
			);
		}

		print.greenLine( "Checked: the zip holds all #zippedCount# staged files." ).toConsole();
	}

	/**
	 * Copies allowed top-level project items into the staging folder.
	 *
	 * This method replaces directoryCopy because its filter is unreliable on Lucee. Exclusion
	 * patterns check only top-level names. An allowed folder is copied with all of its contents.
	 *
	 * @src    The project folder to read.
	 * @target The staging folder to write.
	 */
	private function copy( required string src, required string target ){
		var excludes = variables.config.allExcludes();
		// Each closure has its own arguments scope. Save the outer target value before entering
		// the closures so they do not look for a missing arguments.target value.
		var targetDir = arguments.target;

		directoryList(
			arguments.src,
			false,
			"path",
			function( path ){
				var isExcluded = false;
				var name       = relativeName( path );
				excludes.each( function( pattern ){
					if ( name.reFindNoCase( pattern ) ) {
						isExcluded = true;
					}
				} );
				return !isExcluded;
			}
		).each( function( item ){
			var name = relativeName( item );
			if ( fileExists( item ) ) {
				print.blueLine( "  copy #name#" ).toConsole();
				fileCopy( item, targetDir );
			} else {
				print.greenLine( "  copy folder #name#" ).toConsole();
				directoryCopy( item, targetDir & "/" & name, true );
			}
		} );
	}

	/**
	 * Returns a path relative to the project root, such as "models" or "box.json".
	 *
	 * Both paths use forward slashes before comparison. Without normalization, different system
	 * separators can prevent the project root from matching the full path.
	 *
	 * @path The full project path to convert.
	 */
	private string function relativeName( required string path ){
		var normalisedPath = replace( arguments.path, "\", "/", "all" );
		var normalisedRoot = replace( variables.root, "\", "/", "all" );

		var name = replaceNoCase( normalisedPath, normalisedRoot, "", "one" );
		// Remove path separators that remain at either end of the relative path.
		return reReplace( reReplace( name, "^[\\/]+", "" ), "[\\/]+$", "" );
	}

	/**
	 * Creates .artifacts/<name>/<version>/ and stores the path for the rest of the build.
	 *
	 * @projectName The package name used in the artifact path.
	 * @version     The release version used in the artifact path.
	 */
	private function ensureExportDir( required string projectName, required string version ){
		if ( structKeyExists( variables, "exportsDir" ) && directoryExists( variables.exportsDir ) ) {
			return;
		}
		variables.exportsDir = variables.artifactsDir & "/#arguments.projectName#/#arguments.version#";
		directoryCreate( variables.exportsDir, true, true );
	}
}
