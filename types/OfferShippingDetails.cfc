// --------------------------------------------------------
// AUTO-GENERATED: OfferShippingDetails.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="deliveryTime" hint="The total delay between the receipt of the order and the goods reaching the final customer.";

    property name="depth" hint="The depth of the item.";

    property name="doesNotShip" hint="Indicates when shipping to a particular [[shippingDestination]] is not available.";

    property name="hasShippingService" hint="Specification of a shipping service offered by the organization.";

    property name="height" hint="The height of the item.";

    property name="shippingDestination" hint="indicates (possibly multiple) shipping destinations. These can be defined in several ways, e.g. postalCode ranges.";

    property name="shippingLabel" hint="Label to match an [[OfferShippingDetails]] with a [[ShippingRateSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).";

    property name="shippingOrigin" hint="Indicates the origin of a shipment, i.e. where it should be coming from.";

    property name="shippingRate" hint="The shipping rate is the cost of shipping to the specified destination. Typically, the maxValue and currency values (of the [[MonetaryAmount]]) are most appropriate.";

    property name="shippingSettingsLink" hint="Link to a page containing [[ShippingRateSettings]] and [[DeliveryTimeSettings]] details.";

    property name="transitTimeLabel" hint="Label to match an [[OfferShippingDetails]] with a [[DeliveryTimeSettings]] (within the context of a [[shippingSettingsLink]] cross-reference).";

    property name="validForMemberTier" hint="The membership program tier an Offer (or a PriceSpecification, OfferShippingDetails, or MerchantReturnPolicy under an Offer) is valid for.";

    property name="weight" hint="The weight of the product or person.";

    property name="width" hint="The width of the item.";


    variables[ "@type" ] = "OfferShippingDetails";

    variables._mappers[ "_abstract" ] = "abstract";

}
