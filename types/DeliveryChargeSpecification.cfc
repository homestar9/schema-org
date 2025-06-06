// --------------------------------------------------------
// AUTO-GENERATED: DeliveryChargeSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PriceSpecification" accessors="true" {

    property name="appliesToDeliveryMethod" hint="The delivery method(s) to which the delivery charge or payment charge specification applies.";

    property name="areaServed" hint="The geographic area where a service or offered item is provided.";

    property name="eligibleRegion" hint="The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.\n\nSee also [[ineligibleRegion]].
    ";

    property name="ineligibleRegion" hint="The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.\n\nSee also [[eligibleRegion]].
      ";


    variables[ "@type" ] = "DeliveryChargeSpecification";

}
