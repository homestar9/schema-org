// --------------------------------------------------------
// AUTO-GENERATED: VideoObject.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MediaObject" accessors="true" {

    property name="actor" hint="An actor (individual or a group), e.g. in TV, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.";

    property name="actors" hint="An actor, e.g. in TV, radio, movie, video games etc. Actors can be associated with individual items or with a series, episode, clip.";

    property name="caption" hint="The caption for this object. For downloadable machine formats (closed caption, subtitles etc.) use MediaObject and indicate the [[encodingFormat]].";

    property name="director" hint="A director of e.g. TV, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.";

    property name="directors" hint="A director of e.g. TV, radio, movie, video games etc. content. Directors can be associated with individual items or with a series, episode, clip.";

    property name="embeddedTextCaption" hint="Represents textual captioning from a [[MediaObject]], e.g. text of a 'meme'.";

    property name="musicBy" hint="The composer of the soundtrack.";

    property name="transcript" hint="If this MediaObject is an AudioObject or VideoObject, the transcript of that object.";

    property name="videoFrameSize" hint="The frame size of the video.";

    property name="videoQuality" hint="The quality of the video.";


    variables[ "@type" ] = "VideoObject";

}
