// --------------------------------------------------------
// AUTO-GENERATED: MusicGroup.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PerformingGroup" accessors="true" {

    property name="album" hint="A music album.";

    property name="albums" hint="A collection of music albums.";

    property name="genre" hint="Genre of the creative work, broadcast channel or group.";

    property name="musicGroupMember" hint="A member of a music group&##x2014;for example, John, Paul, George, or Ringo.";

    property name="track" hint="A music recording (track)&##x2014;usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.";

    property name="tracks" hint="A music recording (track)&##x2014;usually a single song.";


    variables[ "@type" ] = "MusicGroup";

    variables._mappers[ "_abstract" ] = "abstract";

}
