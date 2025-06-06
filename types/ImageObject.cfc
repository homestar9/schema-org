// --------------------------------------------------------
// AUTO-GENERATED: ImageObject.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MediaObject" accessors="true" {

    property name="caption" hint="The caption for this object. For downloadable machine formats (closed caption, subtitles etc.) use MediaObject and indicate the [[encodingFormat]].";

    property name="embeddedTextCaption" hint="Represents textual captioning from a [[MediaObject]], e.g. text of a 'meme'.";

    property name="exifData" hint="exif data for this object.";

    property name="representativeOfPage" hint="Indicates whether this image is representative of the content of the page.";


    variables[ "@type" ] = "ImageObject";

}
