// --------------------------------------------------------
// AUTO-GENERATED: ParcelDelivery.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="carrier" hint="'carrier' is an out-dated term indicating the 'provider' for parcel delivery and flights.";

    property name="deliveryAddress" hint="Destination address.";

    property name="deliveryStatus" hint="New entry added as the package passes through each leg of its journey (from shipment to final delivery).";

    property name="expectedArrivalFrom" hint="The earliest date the package may arrive.";

    property name="expectedArrivalUntil" hint="The latest date the package may arrive.";

    property name="hasDeliveryMethod" hint="Method used for delivery or shipping.";

    property name="itemShipped" hint="Item(s) being shipped.";

    property name="originAddress" hint="Shipper's address.";

    property name="partOfOrder" hint="The overall order the items in this delivery were included in.";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="trackingNumber" hint="Shipper tracking number.";

    property name="trackingUrl" hint="Tracking url for the parcel delivery.";


    variables[ "@type" ] = "ParcelDelivery";

    variables._mappers[ "_abstract" ] = "abstract";

}
