/**
 * Updates the package version and moves release notes into a dated changelog section.
 *
 * Run this task with box run-script bump:patch, bump:minor, or bump:major.
 *
 * The task updates the version in box.json. It then moves the notes under "## [Unreleased]"
 * into a dated section for the new version. The changelog keeps an empty [Unreleased] section
 * for future notes.
 *
 * The task does not commit, tag, or publish. Review and commit the changes after the task finishes.
 * Release.cfc runs the release safety checks later.
 *
 * For a first release, box.json may already contain the version being released. Use :level=none
 * to date the current notes without changing that version.
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
	 * Calculates the next version and moves the unreleased changelog notes.
	 *
	 * @level  The type of version change. nextVersion() lists the accepted values. An invalid
	 *         value prints the complete list.
	 * @preid  The alpha or beta label used for a prerelease level. A blank label becomes beta when
	 *         the task starts a prerelease.
	 * @dryRun Show the planned changes without writing files.
	 */
	function run( string level = "patch", string preid = "", boolean dryRun = false ){
		var lvl = lCase( trim( arguments.level ) );
		if ( !listFindNoCase( levels(), lvl ) ) {
			return fail(
				"Unknown level '#arguments.level#'.",
				[
					"major, minor, patch            raise the version. On a prerelease these settle on",
					"                               the version it was leading up to.",
					"prerelease                     step a prerelease forward, beta.3 to beta.4.",
					"premajor, preminor, prepatch   start a prerelease, :preid=beta by default.",
					"none                           keep the version and just date the changelog."
				],
				"The levels you can use"
			);
		}

		var current    = variables.config.version();
		var newVersion = ( lvl == "none" ) ? current : nextVersion( current, lvl, trim( arguments.preid ) );
		var today      = dateFormat( now(), "yyyy-mm-dd" );

		// Build the new changelog before writing any files. A missing or empty [Unreleased] section
		// can then stop the task without leaving box.json and the changelog on different versions.
		var newChangelog = buildChangelog( newVersion, today );

		if ( arguments.dryRun ) {
			print
				.line()
				.boldYellowLine( "Dry run: nothing was written." )
				.line( "Version:   #current# -> #newVersion#" )
				.line( "Changelog: notes would move into #### [#newVersion#] - #today#" )
				.line()
				.boldLine( "The new changelog would start like this:" )
				.line( left( newChangelog, 600 ) )
				.toConsole();
			return;
		}

		if ( newVersion != current ) {
			setBoxVersion( newVersion );
			print.greenLine( "box.json: #current# -> #newVersion#" ).toConsole();
		} else {
			print.greenLine( "box.json stays at #current# (level=none)." ).toConsole();
		}

		fileWrite( variables.config.repoPath( variables.s.changelog ), newChangelog );
		print.greenLine( "#variables.s.changelog#: notes moved into #### [#newVersion#] - #today#" ).toConsole();

		print
			.line()
			.boldMagentaLine( "Now at #newVersion#. Next steps:" )
			.line( "  1. Review:        git diff -- box.json ""#variables.s.changelog#""" )
			.line( "  2. Stage:         git add box.json ""#variables.s.changelog#""" )
			.line( "  3. Check staged:  git diff --staged" )
			.line( "  4. Commit:        git commit -m ""Release #newVersion#""" )
			.line( "  5. Check:         box run-script release:check" )
			.line( "  6. Release:       box run-script release" )
			.toConsole();
	}

	// Private helpers

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
	 * Returns the comma-separated version levels accepted by run().
	 */
	private string function levels(){
		return "major,minor,patch,prerelease,premajor,preminor,prepatch,none";
	}

	/**
	 * Splits a version into major, minor, patch, prerelease, and build values.
	 *
	 * For example, 1.2.3-beta.4+build7 becomes major 1, minor 2, patch 3, prerelease
	 * "beta.4", and build "build7".
	 *
	 * @version The Semantic Versioning string to split.
	 */
	private struct function parseVersion( required string version ){
		var remaining = trim( arguments.version );

		var build = "";
		if ( find( "+", remaining ) ) {
			build     = mid( remaining, find( "+", remaining ) + 1, len( remaining ) );
			remaining = left( remaining, find( "+", remaining ) - 1 );
		}

		var prerelease = "";
		if ( find( "-", remaining ) ) {
			prerelease = mid( remaining, find( "-", remaining ) + 1, len( remaining ) );
			remaining  = left( remaining, find( "-", remaining ) - 1 );
		}

		var parts = listToArray( remaining, "." );
		return {
			"major"      : val( parts[ 1 ] ?: "0" ),
			"minor"      : val( parts[ 2 ] ?: "0" ),
			"patch"      : val( parts[ 3 ] ?: "0" ),
			"prerelease" : prerelease,
			"build"      : build
		};
	}

	/**
	 * Calculates the next version for the requested version level.
	 *
	 * Semantic Versioning places 1.1.0-beta.3 before 1.1.0. Completing a prerelease therefore
	 * removes the prerelease label instead of increasing the version again:
	 *
	 *   1.1.0-beta.3  patch       -> 1.1.0        completes the beta version
	 *   1.1.0-beta.3  minor       -> 1.1.0        completes the beta because patch is 0
	 *   2.0.0-beta.3  major       -> 2.0.0        completes the beta because minor and patch are 0
	 *   1.1.2-beta.3  minor       -> 1.2.0        starts the next minor version
	 *   1.1.0         patch       -> 1.1.1        increases a normal patch version
	 *   1.1.0-beta.3  prerelease  -> 1.1.0-beta.4
	 *   1.1.0         preminor    -> 1.2.0-beta.1
	 *
	 * @current The version being changed.
	 * @level   A version-change level returned by levels().
	 * @preid   The requested prerelease label. A blank value keeps an existing label or starts beta.
	 */
	private string function nextVersion( required string current, required string level, string preid = "" ){
		var p      = parseVersion( arguments.current );
		var hasPre = len( p.prerelease ) > 0;
		// A new prerelease needs a label. Use "beta" when the caller does not provide one.
		var label  = len( arguments.preid ) ? arguments.preid : "beta";

		switch ( arguments.level ) {
			case "major":
				// Remove the prerelease label when this version already targets the next major release.
				if ( hasPre && p.minor == 0 && p.patch == 0 ) {
					return "#p.major#.0.0";
				}
				return "#p.major + 1#.0.0";

			case "minor":
				if ( hasPre && p.patch == 0 ) {
					return "#p.major#.#p.minor#.0";
				}
				return "#p.major#.#p.minor + 1#.0";

			case "patch":
				if ( hasPre ) {
					return "#p.major#.#p.minor#.#p.patch#";
				}
				return "#p.major#.#p.minor#.#p.patch + 1#";

			case "premajor":
				return "#p.major + 1#.0.0-#label#.1";

			case "preminor":
				return "#p.major#.#p.minor + 1#.0-#label#.1";

			case "prepatch":
				return "#p.major#.#p.minor#.#p.patch + 1#-#label#.1";

			case "prerelease":
				return nextPrerelease( p, arguments.preid );
		}

		return arguments.current;
	}

	/**
	 * Increases the number of an existing prerelease.
	 *
	 * beta.3 becomes beta.4, and beta becomes beta.1. A different requested label starts at 1.
	 * For example, changing beta.3 to alpha produces alpha.1.
	 *
	 * @parsed The current version parts returned by parseVersion().
	 * @preid  The requested label. A blank value keeps the current label.
	 */
	private string function nextPrerelease( required struct parsed, string preid = "" ){
		var core = "#arguments.parsed.major#.#arguments.parsed.minor#.#arguments.parsed.patch#";

		if ( !len( arguments.parsed.prerelease ) ) {
			return fail(
				"#core# is not a prerelease, so there is nothing to step forward.",
				[
					"box run-script bump:beta     the next minor release as a beta",
					"box run-script bump:alpha    the same, labelled alpha",
					":level=prepatch              a prerelease of the next patch",
					":level=premajor              a prerelease of the next major"
				],
				"To start a prerelease"
			);
		}

		// Separate a trailing counter from the prerelease label when a counter is present.
		var segments = listToArray( arguments.parsed.prerelease, "." );
		var label    = arguments.parsed.prerelease;
		var counter  = 0;
		if ( arrayLen( segments ) > 1 && isNumeric( segments[ arrayLen( segments ) ] ) ) {
			counter = val( segments[ arrayLen( segments ) ] );
			arrayDeleteAt( segments, arrayLen( segments ) );
			label = arrayToList( segments, "." );
		}

		// A new label starts at 1. For example, changing alpha.7 to beta produces beta.1.
		if ( len( arguments.preid ) && arguments.preid != label ) {
			return "#core#-#arguments.preid#.1";
		}

		return "#core#-#label#.#counter + 1#";
	}

	/**
	 * Replaces only the version value in box.json so all other formatting stays unchanged.
	 *
	 * @version The version value to write into box.json.
	 */
	private function setBoxVersion( required string version ){
		var boxPath = variables.config.repoPath( "box.json" );
		var raw     = fileRead( boxPath );

		// Replace the text between the quotes in the first "version" entry. Direct string splicing
		// avoids a regular-expression problem where "\1" followed by a digit can be read as a
		// different capture-group number.
		var m = reFind( '("version"\s*:\s*")([^"]*)(")', raw, 1, true );
		if ( !arrayLen( m.pos ) || m.pos[ 1 ] == 0 ) {
			return error( "Could not find a ""version"" entry in box.json." );
		}
		var valStart = m.pos[ 3 ];
		var valLen   = m.len[ 3 ];
		fileWrite( boxPath, left( raw, valStart - 1 ) & arguments.version & mid( raw, valStart + valLen, len( raw ) ) );
	}

	/**
	 * Moves the [Unreleased] notes into a dated section and returns the complete changelog.
	 *
	 * The task stops when the [Unreleased] section is missing or empty. This rule prevents a
	 * release from being created without release notes.
	 *
	 * CFML uses ## inside a string to represent one literal # character. The patterns below use
	 * #### to match a two-character "## " Markdown heading.
	 *
	 * @version The version used in the new changelog heading.
	 * @date    The heading date in YYYY-MM-DD format.
	 */
	private string function buildChangelog( required string version, required string date ){
		var path = variables.config.repoPath( variables.s.changelog );
		if ( !fileExists( path ) ) {
			return error(
				"No #variables.s.changelog# found in the project root. Create one with an ""#### [Unreleased]"" section, "
				& "or run: box task run taskFile=build/Install.cfc"
			);
		}

		var raw   = fileRead( path );
		// Preserve the changelog's existing line-ending style.
		var crlf  = ( raw contains ( chr( 13 ) & chr( 10 ) ) );
		var lf    = chr( 10 );
		var lines = listToArray( replace( raw, chr( 13 ) & lf, lf, "all" ), lf, true );

		var unreleasedIdx = 0;
		for ( var i = 1; i <= arrayLen( lines ); i++ ) {
			if ( reFindNoCase( "^####\s*\[Unreleased\]", lines[ i ] ) ) {
				unreleasedIdx = i;
				break;
			}
		}
		if ( unreleasedIdx == 0 ) {
			return error(
				"#variables.s.changelog# has no ""#### [Unreleased]"" section. Add one, put your notes under it, and run this again."
			);
		}

		// The section ends at the next level-two heading or at the reference-link list.
		var endIdx = arrayLen( lines ) + 1;
		for ( var i = unreleasedIdx + 1; i <= arrayLen( lines ); i++ ) {
			if ( reFind( "^####\s", lines[ i ] ) || reFind( "^\[.+\]:\s*http", lines[ i ] ) ) {
				endIdx = i;
				break;
			}
		}

		// Collect the notes without leading or trailing blank lines.
		var body = [];
		for ( var i = unreleasedIdx + 1; i <= endIdx - 1; i++ ) {
			body.append( lines[ i ] );
		}
		while ( body.len() && !len( trim( body[ 1 ] ) ) ) {
			body.deleteAt( 1 );
		}
		while ( body.len() && !len( trim( body[ body.len() ] ) ) ) {
			body.deleteAt( body.len() );
		}
		if ( !body.len() ) {
			return error( "The ""#### [Unreleased]"" section in #variables.s.changelog# is empty. Write the release notes first." );
		}

		// Keep the empty [Unreleased] heading first. Add the new dated section next, followed by
		// the rest of the original changelog.
		var out = [];
		for ( var i = 1; i <= unreleasedIdx; i++ ) {
			out.append( lines[ i ] );
		}
		out.append( "" );
		out.append( "#### [" & arguments.version & "] - " & arguments.date );
		out.append( "" );
		for ( var b in body ) {
			out.append( b );
		}
		out.append( "" );
		for ( var i = endIdx; i <= arrayLen( lines ); i++ ) {
			out.append( lines[ i ] );
		}

		return arrayToList( out, crlf ? ( chr( 13 ) & lf ) : lf );
	}
}
