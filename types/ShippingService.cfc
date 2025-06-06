// --------------------------------------------------------
// AUTO-GENERATED: ShippingService.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="fulfillmentType" hint="Type of fulfillment applicable to the [[ShippingService]].";

    property name="handlingTime" hint="The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.

In the context of [[ShippingDeliveryTime]], Typical properties: minValue, maxValue, unitCode (d for DAY).  This is by common convention assumed to mean business days (if a unitCode is used, coded as 'd'), i.e. only counting days when the business normally operates.

In the context of [[ShippingService]], use the [[ServicePeriod]] format, that contains the same information in a structured form, with cut-off time, business days and duration.";

    property name="shippingConditions" hint="The conditions (constraints, price) applicable to the [[ShippingService]].";

    property name="validForMemberTier" hint="The membership program tier an Offer (or a PriceSpecification, OfferShippingDetails, or MerchantReturnPolicy under an Offer) is valid for.";


    variables[ "@type" ] = "ShippingService";

    variables._mappers[ "_abstract" ] = "abstract";

}
