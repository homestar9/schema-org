// --------------------------------------------------------
// AUTO-GENERATED: OrderItem.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="orderDelivery" hint="The delivery of the parcel related to this order or order item.";

    property name="orderedItem" hint="The item ordered.";

    property name="orderItemNumber" hint="The identifier of the order item.";

    property name="orderItemStatus" hint="The current status of the order item.";

    property name="orderQuantity" hint="The number of the item ordered. If the property is not set, assume the quantity is one.";


    variables[ "@type" ] = "OrderItem";

    variables._mappers[ "_abstract" ] = "abstract";

}
