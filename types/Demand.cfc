// --------------------------------------------------------
// AUTO-GENERATED: Demand.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="acceptedPaymentMethod" hint="The payment method(s) that are accepted in general by an organization, or for some specific demand or offer.";

    property name="advanceBookingRequirement" hint="The amount of time that is required between accepting the offer and the actual usage of the resource or service.";

    property name="areaServed" hint="The geographic area where a service or offered item is provided.";

    property name="asin" hint="An Amazon Standard Identification Number (ASIN) is a 10-character alphanumeric unique identifier assigned by Amazon.com and its partners for product identification within the Amazon organization (summary from [Wikipedia](https://en.wikipedia.org/wiki/Amazon_Standard_Identification_Number)'s article).

Note also that this is a definition for how to include ASINs in Schema.org data, and not a definition of ASINs in general - see documentation from Amazon for authoritative details.
ASINs are most commonly encoded as text strings, but the [asin] property supports URL/URI as potential values too.";

    property name="availability" hint="The availability of this item&##x2014;for example In stock, Out of stock, Pre-order, etc.";

    property name="availabilityEnds" hint="The end of the availability of the product or service included in the offer.";

    property name="availabilityStarts" hint="The beginning of the availability of the product or service included in the offer.";

    property name="availableAtOrFrom" hint="The place(s) from which the offer can be obtained (e.g. store locations).";

    property name="availableDeliveryMethod" hint="The delivery method(s) available for this offer.";

    property name="businessFunction" hint="The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1##Sell.";

    property name="deliveryLeadTime" hint="The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.";

    property name="eligibleCustomerType" hint="The type(s) of customers for which the given offer is valid.";

    property name="eligibleDuration" hint="The duration for which the given offer is valid.";

    property name="eligibleQuantity" hint="The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.";

    property name="eligibleRegion" hint="The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.\n\nSee also [[ineligibleRegion]].
    ";

    property name="eligibleTransactionVolume" hint="The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.";

    property name="gtin" hint="A Global Trade Item Number ([GTIN](https://www.gs1.org/standards/id-keys/gtin)). GTINs identify trade items, including products and services, using numeric identification codes.

A correct [[gtin]] value should be a valid GTIN, which means that it should be an all-numeric string of either 8, 12, 13 or 14 digits, or a 'GS1 Digital Link' URL based on such a string. The numeric component should also have a [valid GS1 check digit](https://www.gs1.org/services/check-digit-calculator) and meet the other rules for valid GTINs. See also [GS1's GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) and [Wikipedia](https://en.wikipedia.org/wiki/Global_Trade_Item_Number) for more details. Left-padding of the gtin values is not required or encouraged. The [[gtin]] property generalizes the earlier [[gtin8]], [[gtin12]], [[gtin13]], and [[gtin14]] properties.

The GS1 [digital link specifications](https://www.gs1.org/standards/Digital-Link/) expresses GTINs as URLs (URIs, IRIs, etc.).
Digital Links should be populated into the [[hasGS1DigitalLink]] attribute.

Note also that this is a definition for how to include GTINs in Schema.org data, and not a definition of GTINs in general - see the GS1 documentation for authoritative details.";

    property name="gtin12" hint="The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.";

    property name="gtin13" hint="The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceding zero. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.";

    property name="gtin14" hint="The GTIN-14 code of the product, or the product to which the offer refers. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.";

    property name="gtin8" hint="The GTIN-8 code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See [GS1 GTIN Summary](http://www.gs1.org/barcodes/technical/idkeys/gtin) for more details.";

    property name="includesObject" hint="This links to a node or nodes indicating the exact quantity of the products included in  an [[Offer]] or [[ProductCollection]].";

    property name="ineligibleRegion" hint="The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.\n\nSee also [[eligibleRegion]].
      ";

    property name="inventoryLevel" hint="The current approximate inventory level for the item or items.";

    property name="itemCondition" hint="A predefined value from OfferItemCondition specifying the condition of the product or service, or the products or services included in the offer. Also used for product return policies to specify the condition of products accepted for returns.";

    property name="itemOffered" hint="An item being offered (or demanded). The transactional nature of the offer or demand is documented using [[businessFunction]], e.g. sell, lease etc. While several common expected types are listed explicitly in this definition, others can be used. Using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.";

    property name="mpn" hint="The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.";

    property name="priceSpecification" hint="One or more detailed price specifications, indicating the unit price and delivery or payment charges.";

    property name="seller" hint="An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.";

    property name="serialNumber" hint="The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.";

    property name="sku" hint="The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.";

    property name="validFrom" hint="The date when the item becomes valid.";

    property name="validThrough" hint="The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.";

    property name="warranty" hint="The warranty promise(s) included in the offer.";


    variables[ "@type" ] = "Demand";

}
