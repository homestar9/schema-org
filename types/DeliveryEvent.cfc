// --------------------------------------------------------
// AUTO-GENERATED: DeliveryEvent.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Event" accessors="true" {

    property name="accessCode" hint="Password, PIN, or access code needed for delivery (e.g. from a locker).";

    property name="availableFrom" hint="When the item is available for pickup from the store, locker, etc.";

    property name="availableThrough" hint="After this date, the item will no longer be available for pickup.";

    property name="hasDeliveryMethod" hint="Method used for delivery or shipping.";


    variables[ "@type" ] = "DeliveryEvent";

    variables._mappers[ "_abstract" ] = "abstract";

}
