// --------------------------------------------------------
// AUTO-GENERATED: ShippingRateSettings.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="doesNotShip" hint="Indicates when shipping to a particular [[shippingDestination]] is not available.";

    property name="freeShippingThreshold" hint="A monetary value above (or at) which the shipping rate becomes free. Intended to be used via an [[OfferShippingDetails]] with [[shippingSettingsLink]] matching this [[ShippingRateSettings]].";

    property name="isUnlabelledFallback" hint="This can be marked 'true' to indicate that some published [[DeliveryTimeSettings]] or [[ShippingRateSettings]] are intended to apply to all [[OfferShippingDetails]] published by the same merchant, when referenced by a [[shippingSettingsLink]] in those settings. It is not meaningful to use a 'true' value for this property alongside a transitTimeLabel (for [[DeliveryTimeSettings]]) or shippingLabel (for [[ShippingRateSettings]]), since this property is for use with unlabelled settings.";

    property name="orderPercentage" hint="Value representing the fraction of the value of the order that is charged as shipping cost. Example: 0.10 would mean shipping rate is 10% of the total order value.";

    property name="shippingDestination" hint="indicates (possibly multiple) shipping destinations. These can be defined in several ways, e.g. postalCode ranges.";

    property name="shippingLabel" hint="Label to match an [[OfferShippingDetails]] with a [[ShippingRateSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).";

    property name="shippingRate" hint="The shipping rate is the cost of shipping to the specified destination. Typically, the maxValue and currency values (of the [[MonetaryAmount]]) are most appropriate.";

    property name="weightPercentage" hint="Value representing the fraction of the weight that is used to compute the shipping price. Example: 0.10 and a shipping weight of 15kg would add $1.5 to the order price, where the $ is the currency of the order.";


    variables[ "@type" ] = "ShippingRateSettings";

}
