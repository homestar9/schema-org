// --------------------------------------------------------
// AUTO-GENERATED: ShippingConditions.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="depth" hint="The depth of the item.";

    property name="doesNotShip" hint="Indicates when shipping to a particular [[shippingDestination]] is not available.";

    property name="height" hint="The height of the item.";

    property name="numItems" hint="Limits the number of items being shipped for which these conditions apply.";

    property name="orderValue" hint="Minimum and maximum order value for which these shipping conditions are valid.";

    property name="seasonalOverride" hint="Limited period during which these shipping conditions apply.";

    property name="shippingDestination" hint="indicates (possibly multiple) shipping destinations. These can be defined in several ways, e.g. postalCode ranges.";

    property name="shippingOrigin" hint="Indicates the origin of a shipment, i.e. where it should be coming from.";

    property name="shippingRate" hint="The shipping rate is the cost of shipping to the specified destination. Typically, the maxValue and currency values (of the [[MonetaryAmount]]) are most appropriate.";

    property name="transitTime" hint="The typical delay the order has been sent for delivery and the goods reach the final customer.

  In the context of [[ShippingDeliveryTime]], use the [[QuantitativeValue]]. Typical properties: minValue, maxValue, unitCode (d for DAY).

  In the context of [[ShippingConditions]], use the [[ServicePeriod]]. It has a duration (as a [[QuantitativeValue]]) and also business days and a cut-off time.
";

    property name="weight" hint="The weight of the product or person.";

    property name="width" hint="The width of the item.";


    variables[ "@type" ] = "ShippingConditions";

}
