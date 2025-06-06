// --------------------------------------------------------
// AUTO-GENERATED: MusicAlbum.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MusicPlaylist" accessors="true" {

    property name="albumProductionType" hint="Classification of the album by its type of content: soundtrack, live album, studio album, etc.";

    property name="albumRelease" hint="A release of this album.";

    property name="albumReleaseType" hint="The kind of release which this album is: single, EP or album.";

    property name="byArtist" hint="The artist that performed this album or recording.";


    variables[ "@type" ] = "MusicAlbum";

    variables._mappers[ "_abstract" ] = "abstract";

}
