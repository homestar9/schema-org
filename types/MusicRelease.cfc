// --------------------------------------------------------
// AUTO-GENERATED: MusicRelease.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MusicPlaylist" accessors="true" {

    property name="catalogNumber" hint="The catalog number for the release.";

    property name="creditedTo" hint="The group the release is credited to if different than the byArtist. For example, Red and Blue is credited to 'Stefani Germanotta Band', but by Lady Gaga.";

    property name="duration" hint="The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="musicReleaseFormat" hint="Format of this release (the type of recording media used, i.e. compact disc, digital media, LP, etc.).";

    property name="recordLabel" hint="The label that issued the release.";

    property name="releaseOf" hint="The album this is a release of.";


    variables[ "@type" ] = "MusicRelease";

    variables._mappers[ "_abstract" ] = "abstract";

}
