// --------------------------------------------------------
// AUTO-GENERATED: DeliveryTimeSettings.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="deliveryTime" hint="The total delay between the receipt of the order and the goods reaching the final customer.";

    property name="isUnlabelledFallback" hint="This can be marked 'true' to indicate that some published [[DeliveryTimeSettings]] or [[ShippingRateSettings]] are intended to apply to all [[OfferShippingDetails]] published by the same merchant, when referenced by a [[shippingSettingsLink]] in those settings. It is not meaningful to use a 'true' value for this property alongside a transitTimeLabel (for [[DeliveryTimeSettings]]) or shippingLabel (for [[ShippingRateSettings]]), since this property is for use with unlabelled settings.";

    property name="shippingDestination" hint="indicates (possibly multiple) shipping destinations. These can be defined in several ways, e.g. postalCode ranges.";

    property name="transitTimeLabel" hint="Label to match an [[OfferShippingDetails]] with a [[DeliveryTimeSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).";


    variables[ "@type" ] = "DeliveryTimeSettings";

}
