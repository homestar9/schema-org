// --------------------------------------------------------
// AUTO-GENERATED: AggregateRating.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Rating" accessors="true" {

    property name="itemReviewed" hint="The item that is being reviewed/rated.";

    property name="ratingCount" hint="The count of total number of ratings.";

    property name="reviewCount" hint="The count of total number of reviews.";


    variables[ "@type" ] = "AggregateRating";

    variables._mappers[ "_abstract" ] = "abstract";

}
