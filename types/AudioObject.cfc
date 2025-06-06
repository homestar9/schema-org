// --------------------------------------------------------
// AUTO-GENERATED: AudioObject.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MediaObject" accessors="true" {

    property name="caption" hint="The caption for this object. For downloadable machine formats (closed caption, subtitles etc.) use MediaObject and indicate the [[encodingFormat]].";

    property name="embeddedTextCaption" hint="Represents textual captioning from a [[MediaObject]], e.g. text of a 'meme'.";

    property name="transcript" hint="If this MediaObject is an AudioObject or VideoObject, the transcript of that object.";


    variables[ "@type" ] = "AudioObject";

    variables._mappers[ "_abstract" ] = "abstract";

}
