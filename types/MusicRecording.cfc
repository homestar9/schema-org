// --------------------------------------------------------
// AUTO-GENERATED: MusicRecording.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="byArtist" hint="The artist that performed this album or recording.";

    property name="duration" hint="The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="inAlbum" hint="The album to which this recording belongs.";

    property name="inPlaylist" hint="The playlist to which this recording belongs.";

    property name="isrcCode" hint="The International Standard Recording Code for the recording.";

    property name="recordingOf" hint="The composition this track is a recording of.";


    variables[ "@type" ] = "MusicRecording";

    variables._mappers[ "_abstract" ] = "abstract";

}
