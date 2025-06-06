// --------------------------------------------------------
// AUTO-GENERATED: Rating.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="author" hint="The author of this content or rating. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.";

    property name="bestRating" hint="The highest value allowed in this rating system.";

    property name="ratingExplanation" hint="A short explanation (e.g. one to two sentences) providing background context and other information that led to the conclusion expressed in the rating. This is particularly applicable to ratings associated with 'fact check' markup using [[ClaimReview]].";

    property name="ratingValue" hint="The rating for the content.\n\nUsage guidelines:\n\n* Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similar Unicode symbols.\n* Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.";

    property name="reviewAspect" hint="This Review or Rating is relevant to this part or facet of the itemReviewed.";

    property name="worstRating" hint="The lowest value allowed in this rating system.";


    variables[ "@type" ] = "Rating";

}
