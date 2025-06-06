// --------------------------------------------------------
// AUTO-GENERATED: MediaReview.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Review" accessors="true" {

    property name="mediaAuthenticityCategory" hint="Indicates a MediaManipulationRatingEnumeration classification of a media object (in the context of how it was published or shared).";

    property name="originalMediaContextDescription" hint="Describes, in a [[MediaReview]] when dealing with [[DecontextualizedContent]], background information that can contribute to better interpretation of the [[MediaObject]].";

    property name="originalMediaLink" hint="Link to the page containing an original version of the content, or directly to an online copy of the original [[MediaObject]] content, e.g. video file.";


    variables[ "@type" ] = "MediaReview";

}
