/**
 * Checks, builds, publishes, tags, and creates a GitHub Release for the project.
 *
 * Run this task with: box run-script release
 *
 * All checks run before the task changes remote data or publishes to ForgeBox. A published version
 * cannot be removed. If a later step fails, the task prints the commands needed to finish the
 * release manually.
 *
 * Targets that can run independently:
 *   run       Runs the complete release. box run-script release uses this target.
 *   preflight Runs only the safety checks.
 *   github    Creates the tag and GitHub Release after an incomplete release.
 *
 * Read project-specific settings from build/build.json instead of editing this task.
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
	 * Runs the complete release in the required order.
	 *
	 * @version     The release version. A blank value uses the version from box.json.
	 * @dryRun      Build and check without publishing, tagging, or pushing. The task prints each
	 *              skipped command so the user can review the release process.
	 * @skipTests   Skip the test suite after this version has already been tested.
	 * @existingTag Publish the tag that identifies HEAD. Tag-triggered continuous integration uses this mode.
	 * @buildID      The optional identifier passed to Build.cfc. Continuous integration uses its run number.
	 */
	function run(
		string version      = "",
		boolean dryRun      = false,
		boolean skipTests   = false,
		boolean existingTag = false,
		string buildID      = ""
	){
		var releaseVersion = len( trim( arguments.version ) ) ? trim( arguments.version ) : variables.config.version();
		var tagName        = variables.s.tagPrefix & releaseVersion;

		if ( arguments.dryRun ) {
			print
				.line()
				.boldYellowLine( "DRY RUN: nothing will be published, tagged, or pushed." )
				.line()
				.toConsole();
		}

		// Run every safety check before changing local or remote release data.
		preflight(
			version     = releaseVersion,
			dryRun     = arguments.dryRun,
			existingTag = arguments.existingTag
		);

		// Update a branch-based release from the remote. A dry run must not change the checkout.
		// An existing-tag release must build the exact commit that the tag already identifies.
		if ( variables.s.gitSync && !arguments.dryRun && !arguments.existingTag ) {
			syncWithRemote();
		} else if ( arguments.existingTag ) {
			print.greenLine( "Using existing tag #tagName# at the checked-out commit; skipping branch sync." ).toConsole();
		} else if ( variables.s.gitSync ) {
			print.yellowLine( "Dry run: skipping git pull." ).toConsole();
		}

		// The build runs the test suite and stops the release after any failure.
		runBuild( releaseVersion, arguments.skipTests, arguments.buildID );

		// Publish the checked staging folder instead of packaging the project root again.
		if ( variables.s.publish.forgebox ) {
			publishToForgebox( releaseVersion, arguments.dryRun );
		} else {
			print.line().yellowLine( "Skipping ForgeBox (publish.forgebox is false in build.json)." ).toConsole();
		}

		// Create the Git tag and GitHub Release after the package is published.
		if ( variables.s.publish.github ) {
			github(
				version     = releaseVersion,
				dryRun     = arguments.dryRun,
				existingTag = arguments.existingTag
			);
		} else {
			print.yellowLine( "Skipping GitHub (publish.github is false in build.json)." ).toConsole();
		}

		print.line().toConsole();
		if ( arguments.dryRun ) {
			print
				.boldGreenLine( "Dry run finished. Nothing was published." )
				.line( "The package was built and checked. Run box run-script release when you are ready." )
				.toConsole();
		} else {
			print.boldGreenLine( "Released #tagName#." ).toConsole();
		}
	}

	/**
	 * Checks every requirement that must pass before a release starts.
	 *
	 * A failed check stops the release and explains how to fix the problem.
	 *
	 * @version     The release version to check.
	 * @dryRun      Allow conditions that are safe only during a release rehearsal.
	 * @existingTag Require the expected tag to identify HEAD instead of requiring a new tag.
	 */
	function preflight( string version = "", boolean dryRun = false, boolean existingTag = false ){
		var releaseVersion = len( trim( arguments.version ) ) ? trim( arguments.version ) : variables.config.version();

		print.boldBlueLine( "=== Checking ===" ).toConsole();

		// Releases require Git and must run inside a Git repository.
		var status = variables.config.execNative( "git", [ "status", "--porcelain" ] );
		if ( status.exitCode == 127 ) {
			return error( "Could not find git. Install it, or open a new terminal if you installed it recently." );
		}
		if ( status.exitCode != 0 ) {
			return error( "git could not read this folder (#status.output#). Is it a git repository?" );
		}

		// A real release requires a clean checkout because a later checkout could discard local
		// changes. A dry run does not change the checkout, so local changes only produce a warning.
		if ( variables.s.requireCleanTree && len( trim( status.output ) ) ) {
			if ( arguments.dryRun ) {
				print
					.yellowLine( "  note  you have uncommitted changes; a real release would stop here" )
					.toConsole();
			} else {
				return fail(
					"You have uncommitted changes. Commit or stash them, then run this again.",
					listToArray( status.output, chr( 10 ) ),
					"Uncommitted"
				);
			}
		}

		// A branch-based release must use the production branch from build.json. A dry run can use
		// another branch. Existing-tag mode also accepts a detached checkout used by CI.
		var branch = variables.config.execNative( "git", [ "rev-parse", "--abbrev-ref", "HEAD" ] );
		if ( branch.exitCode != 0 ) {
			return error( "git could not identify the checked-out branch (#branch.output#)." );
		}
		var branchName = trim( branch.output );
		if ( arguments.existingTag && branchName != variables.s.branch && branchName != "HEAD" ) {
			return error(
				"Existing-tag releases run from production branch #variables.s.branch# or a detached tag checkout, "
				& "but you are on #branchName#."
			);
		} else if ( !arguments.existingTag && branchName != variables.s.branch && arguments.dryRun ) {
			print
				.boldYellowLine( "  warning  rehearsing from #branchName#, not production branch #variables.s.branch#" )
				.yellowLine( "           A real release still has to run from #variables.s.branch#." )
				.toConsole();
		} else if ( !arguments.existingTag && branchName != variables.s.branch ) {
			return error(
				"Releases come from the production branch #variables.s.branch#, but you are on #branchName#. "
				& "Switch branch, or change ""branch"" in build/build.json."
			);
		}

		// A branch-based release creates a new tag, so that tag cannot already exist. Existing-tag
		// mode requires the tag to identify the checked-out commit. git rev-list resolves both
		// lightweight and annotated tags to their commit.
		var tagName = variables.s.tagPrefix & releaseVersion;
		if ( arguments.existingTag ) {
			requireExistingTagAtHead( tagName );
		} else {
			var tagCheck = variables.config.execNative( "git", [ "rev-parse", "-q", "--verify", "refs/tags/" & tagName ] );
			if ( tagCheck.exitCode == 0 ) {
				var tagCommit  = variables.config.execNative( "git", [ "rev-list", "-n", "1", "refs/tags/" & tagName ] );
				var headCommit = variables.config.execNative( "git", [ "rev-parse", "HEAD" ] );
				if (
					tagCommit.exitCode == 0
						&& headCommit.exitCode == 0
						&& trim( tagCommit.output ) == trim( headCommit.output )
				) {
					return error(
						"Tag #tagName# already exists at this commit. If Gitflow or GitKraken created it "
						& "intentionally, publish it with: box run-script release:existing-tag"
					);
				}
				return error(
					"Tag #tagName# already exists locally at a different commit. Do not move a published tag. "
					& "Verify the tag and release history, or choose a new version."
				);
			}
			var remoteTag = variables.config.execNative(
				"git",
				[ "ls-remote", "--exit-code", "--tags", "origin", "refs/tags/" & tagName ]
			);
			if ( remoteTag.exitCode == 0 ) {
				return error(
					"Tag #tagName# already exists on origin. Fetch tags first. If a Gitflow tool created it "
					& "for this release, run box run-script release:existing-tag from its tagged production "
					& "commit; otherwise the version is already claimed."
				);
			}
			if ( remoteTag.exitCode != 2 ) {
				return error( "Could not check origin for tag #tagName# (#remoteTag.output#). Nothing has been published." );
			}
		}

		// GitHub releases require a changelog section for this version. Its text becomes the release notes.
		if ( variables.s.publish.github ) {
			extractChangelogSection( releaseVersion );
		}

		// Check GitHub CLI access before publishing to ForgeBox. An early failure prevents the two
		// services from ending up with different release versions.
		if ( variables.s.publish.github && !arguments.dryRun ) {
			var ghCheck = variables.config.execNative( "gh", [ "auth", "status" ] );
			if ( ghCheck.exitCode == 127 ) {
				return fail(
					"Could not find the GitHub CLI (gh).",
					[
						"Install it from https://cli.github.com, then run: gh auth login",
						"",
						"If you have just installed it, open a new terminal. A terminal keeps the",
						"PATH it started with, so a tool added afterwards looks missing until then."
					]
				);
			}
			if ( ghCheck.exitCode != 0 ) {
				return fail(
					"The GitHub CLI is not signed in, so stopping before anything is published.",
					[ "gh auth login", "", "What gh said: " & ghCheck.output ]
				);
			}
		}

		print
			.greenLine(
				arguments.existingTag
					? "  ok  existing tag #tagName# points to this commit"
					: "  ok  clean checkout#( trim( branch.output ) == variables.s.branch ? " on " & variables.s.branch : "" )#"
			)
			.greenLine( arguments.existingTag ? "  ok  existing-tag publish mode" : "  ok  #releaseVersion# has not been released" )
			.greenLine( variables.s.publish.github ? "  ok  changelog entry found" : "  --  changelog not needed" )
			.greenLine( variables.s.publish.github && !arguments.dryRun ? "  ok  GitHub CLI ready" : "  --  GitHub CLI not needed" )
			.toConsole();
	}

	/**
	 * Creates and pushes the release tag, then creates the GitHub Release.
	 *
	 * The GitHub Release includes changelog notes and the built zip. Run this target by itself to
	 * finish a release that stopped after publishing.
	 *
	 * @version     The release version used for the tag and notes.
	 * @notesOnly   Print the release notes without creating or pushing a tag.
	 * @dryRun      Print commands without running them.
	 * @existingTag Use the existing tag and create only the GitHub Release.
	 */
	function github(
		string version      = "",
		boolean notesOnly   = false,
		boolean dryRun      = false,
		boolean existingTag = false
	){
		var releaseVersion = len( trim( arguments.version ) ) ? trim( arguments.version ) : variables.config.version();
		var tagName        = variables.s.tagPrefix & releaseVersion;
		var slug           = variables.config.slug();
		if ( arguments.existingTag ) {
			requireExistingTagAtHead( tagName );
		}

		var notes = extractChangelogSection( releaseVersion );
		if ( arguments.notesOnly ) {
			print.line().boldLine( "Release notes for #tagName#:" ).line( notes ).toConsole();
			return;
		}

		// Attach the built zip and checksum so GitHub stores the exact package sent to ForgeBox.
		var zipPath = variables.config.repoPath( "#variables.s.artifactsDir#/#slug#/#releaseVersion#/#slug#-#releaseVersion#.zip" );
		var shaPath = zipPath & ".sha512";
		if ( !fileExists( zipPath ) ) {
			return error(
				"No built zip at #zipPath#. Build it first: box run-script build:package"
			);
		}

		// Give the notes to GitHub CLI through a file so their Markdown formatting stays unchanged.
		var notesFile = variables.config.repoPath( "#variables.s.stagingDir#/release-notes.md" );
		if ( !directoryExists( getDirectoryFromPath( notesFile ) ) ) {
			directoryCreate( getDirectoryFromPath( notesFile ), true, true );
		}
		fileWrite( notesFile, notes );

		var ghArgs = [ "release", "create", tagName, "--title", tagName, "--notes-file", notesFile ];
		if ( isPrerelease( releaseVersion ) ) {
			ghArgs.append( "--prerelease" );
		}
		ghArgs.append( zipPath );
		if ( fileExists( shaPath ) ) {
			ghArgs.append( shaPath );
		}

		if ( arguments.dryRun ) {
			var preview = print
				.line()
				.boldYellowLine( "Dry run, would now run:" );
			if ( !arguments.existingTag ) {
				preview
					.line( "  git tag #tagName#" )
					.line( "  git push origin #variables.s.branch#" )
					.line( "  git push origin #tagName#" );
			}
			preview
				.line( "  gh " & arrayToList( ghArgs, " " ) )
				.line()
				.boldLine( "Release notes it would use:" )
				.line( notes )
				.toConsole();
			return;
		}

		// ForgeBox may already contain this version. Later failures must explain how to finish
		// manually because running the full release again would fail on the published version.
		print.line().boldBlueLine( "=== Tagging and releasing on GitHub ===" ).toConsole();

		var result = { exitCode : 0, output : "" };
		if ( !arguments.existingTag ) {
			result = variables.config.execNative( "git", [ "tag", tagName ] );
			if ( result.exitCode != 0 ) {
				return error( "Could not create tag #tagName#: #result.output#" );
			}

			result = variables.config.execNative( "git", [ "push", "origin", variables.s.branch ] );
			if ( result.exitCode != 0 ) {
				return failWithManualSteps( "The push failed (#result.output#).", tagName, ghArgs );
			}

			result = variables.config.execNative( "git", [ "push", "origin", tagName ] );
			if ( result.exitCode != 0 ) {
				return failWithManualSteps( "Pushing the tag failed (#result.output#).", tagName, ghArgs );
			}
		}

		result = variables.config.execNative( "gh", ghArgs );
		if ( result.exitCode != 0 ) {
			return fail(
				"Creating the GitHub Release failed (#result.output#). The tag is already pushed.",
				[ "gh " & arrayToList( ghArgs, " " ) ],
				"Run this to finish"
			);
		}

		print
			.greenLine(
				arguments.existingTag
					? "Created the GitHub Release for existing tag #tagName#."
					: "Tagged #tagName# and created the GitHub Release."
			)
			.toConsole();
	}

	// Private helpers

	/**
	 * Confirms that an existing tag identifies the checked-out commit.
	 *
	 * The check accepts lightweight and annotated tags. Both the full release and the standalone
	 * GitHub target use this check so they cannot publish files from a different commit.
	 *
	 * @tagName The complete tag name, including the prefix from build.json.
	 */
	private function requireExistingTagAtHead( required string tagName ){
		var tagCheck = variables.config.execNative( "git", [ "rev-parse", "-q", "--verify", "refs/tags/" & arguments.tagName ] );
		if ( tagCheck.exitCode != 0 ) {
			return error( "Existing-tag mode expected #arguments.tagName#, but that tag is not available in this checkout." );
		}

		var tagCommit  = variables.config.execNative( "git", [ "rev-list", "-n", "1", "refs/tags/" & arguments.tagName ] );
		var headCommit = variables.config.execNative( "git", [ "rev-parse", "HEAD" ] );
		if (
			tagCommit.exitCode != 0
				|| headCommit.exitCode != 0
				|| trim( tagCommit.output ) != trim( headCommit.output )
		) {
			return error( "Tag #arguments.tagName# does not point at the checked-out commit. Refusing to publish the wrong source." );
		}
	}

	/**
	 * Runs Build.cfc as a CommandBox task and stops after a build failure.
	 *
	 * Build.cfc runs as a CommandBox task instead of a directly created component. CommandBox gives
	 * task files helpers such as command() and print. A plain component does not receive those helpers.
	 *
	 * @version   The release version passed to Build.cfc.
	 * @skipTests Skip the build's test-suite step when true.
	 * @buildID   The optional build identifier passed to Build.cfc.
	 */
	private function runBuild( required string version, boolean skipTests = false, string buildID = "" ){
		print.line().boldBlueLine( "=== Building ===" ).toConsole();

		var buildFailed = false;
		try {
			command( "task run" )
				.params(
					taskFile     = variables.config.buildPath( "Build.cfc" ),
					target       = "run",
					":version"   = arguments.version,
					":skipTests" = arguments.skipTests,
					":buildID"   = arguments.buildID
				)
				.run();
			buildFailed = ( shell.getExitCode() != 0 );
		} catch ( any e ) {
			buildFailed = true;
			print.redLine( e.message ).toConsole();
		}

		if ( buildFailed ) {
			return error( "Stopping: the build failed, so nothing was published." );
		}
	}

	/**
	 * Fast-forwards the production branch to match the remote branch.
	 *
	 * A fast-forward includes remote work without creating a merge commit during release. The
	 * preflight checks have already confirmed the branch and the clean checkout.
	 */
	private function syncWithRemote(){
		print.line().boldBlueLine( "=== Lining up with the remote ===" ).toConsole();

		var result = variables.config.execNative( "git", [ "pull", "--ff-only", "origin", variables.s.branch ] );
		if ( result.exitCode != 0 ) {
			var guidance = [ result.output ];
			if ( result.output contains "publickey" ) {
				guidance.append( "" );
				guidance.append( "git cannot sign in to your remote. Either add your SSH key at" );
				guidance.append( "https://github.com/settings/ssh/new, or switch the remote to HTTPS:" );
				guidance.append( "" );
				guidance.append( "  git remote set-url origin https://github.com/<you>/<repo>.git" );
				guidance.append( "  gh auth setup-git" );
			}
			return fail( "git pull failed.", guidance, "What git said" );
		}
		print.greenLine( "Up to date with origin/#variables.s.branch#." ).toConsole();
	}

	/**
	 * Publishes the checked staging folder to ForgeBox.
	 *
	 * Publishing from the project root would package files using .gitignore. A broad ignore rule
	 * could remove required source folders. The staging folder contains the exact files checked by
	 * the build.
	 *
	 * @version The release version being published.
	 * @dryRun  Print commands without running them.
	 */
	private function publishToForgebox( required string version, boolean dryRun = false ){
		var slug       = variables.config.slug();
		var publishDir = variables.config.repoPath( "#variables.s.stagingDir#/#slug#" );

		if ( arguments.dryRun ) {
			print
				.line()
				.boldYellowLine( "Dry run, would now publish to ForgeBox:" )
				.line( "  cd #publishDir#" )
				.line( "  publish" )
				.toConsole();
			return;
		}

		if ( !directoryExists( publishDir ) ) {
			return error( "No built folder at #publishDir#. The build should have created it." );
		}

		print.line().boldBlueLine( "=== Publishing to ForgeBox ===" ).toConsole();

		// Always return the shell to its original folder, even when publishing fails.
		var originalDir = shell.pwd();
		try {
			command( "cd" ).params( publishDir ).run();
			command( "publish" ).run();
			if ( shell.getExitCode() != 0 ) {
				return error( "Publishing to ForgeBox failed. Check you are signed in: box forgebox whoami" );
			}
		} finally {
			command( "cd" ).params( originalDir ).run();
		}

		print.greenLine( "Published #slug# #arguments.version# to ForgeBox." ).toConsole();
	}

	/**
	 * Stops an incomplete release and prints the commands needed to finish it manually.
	 *
	 * The package may already be published, so the same release version cannot be run again.
	 *
	 * @reason  The step and reason that caused the failure.
	 * @tagName The tag that must be pushed for this release.
	 * @ghArgs  The arguments needed to create the GitHub Release.
	 */
	private function failWithManualSteps( required string reason, required string tagName, required array ghArgs ){
		return fail(
			arguments.reason & " The package may already be published, so finish by hand rather than running the release again.",
			[
				"git push origin " & variables.s.branch,
				"git push origin " & arguments.tagName,
				"gh " & arrayToList( arguments.ghArgs, " " )
			],
			"Run these to finish"
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

	/**
	 * Returns the notes between a version heading and the next level-two heading.
	 *
	 * A missing or empty section stops the release so every GitHub Release has notes.
	 *
	 * CFML uses ## inside a string for one literal #. The patterns below use #### to match a
	 * two-character "## " Markdown heading.
	 *
	 * @version The release version whose notes should be returned.
	 */
	private string function extractChangelogSection( required string version ){
		var changelogPath = variables.config.repoPath( variables.s.changelog );
		if ( !fileExists( changelogPath ) ) {
			return error( "No #variables.s.changelog# in the project root. Create one before releasing." );
		}

		var lines     = listToArray( fileRead( changelogPath ), chr( 10 ), true );
		var collected = [];
		var inSection = false;
		for ( var rawLine in lines ) {
			var line = reReplace( rawLine, chr( 13 ) & "$", "" );
			// Match the complete bracketed version in a heading such as "## [1.0.0] - 2026-07-24".
			// The closing bracket prevents 1.0.0 from also matching 1.0.0-beta.1.
			var isHeading = reFind( "^####\s*\[", line );
			if ( !inSection && isHeading && line contains "[#arguments.version#]" ) {
				inSection = true;
				continue;
			}
			if ( inSection ) {
				// The next heading or the final reference-link list ends the current version section.
				if ( reFind( "^####\s", line ) || reFind( "^\[.+\]:\s*http", line ) ) {
					break;
				}
				collected.append( line );
			}
		}

		if ( !inSection ) {
			return error(
				"#variables.s.changelog# has no ""#### [#arguments.version#]"" section. "
				& "Move your notes out of [Unreleased] into a dated section by running: box run-script bump:patch"
			);
		}

		var notes = trim( arrayToList( collected, chr( 10 ) ) );
		if ( !len( notes ) ) {
			return error( "The ""#### [#arguments.version#]"" section in #variables.s.changelog# is empty. Write the notes first." );
		}
		return notes;
	}

	/**
	 * Returns true when the version contains a prerelease label after a hyphen.
	 *
	 * For example, 1.0.0-beta.4 is a prerelease and must be marked that way on GitHub.
	 *
	 * @version The release version to inspect.
	 */
	private boolean function isPrerelease( required string version ){
		return find( "-", arguments.version ) > 0;
	}
}
