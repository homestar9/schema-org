// --------------------------------------------------------
// AUTO-GENERATED: ActionAccessSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="availabilityEnds" hint="The end of the availability of the product or service included in the offer.";

    property name="availabilityStarts" hint="The beginning of the availability of the product or service included in the offer.";

    property name="category" hint="A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.";

    property name="eligibleRegion" hint="The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.\n\nSee also [[ineligibleRegion]].
    ";

    property name="expectsAcceptanceOf" hint="An Offer which must be accepted before the user can perform the Action. For example, the user may need to buy a movie before being able to watch it.";

    property name="ineligibleRegion" hint="The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.\n\nSee also [[eligibleRegion]].
      ";

    property name="requiresSubscription" hint="Indicates if use of the media require a subscription  (either paid or free). Allowed values are ```true``` or ```false``` (note that an earlier version had 'yes', 'no').";


    variables[ "@type" ] = "ActionAccessSpecification";

    variables._mappers[ "_abstract" ] = "abstract";

}
