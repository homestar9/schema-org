// --------------------------------------------------------
// AUTO-GENERATED: MerchantReturnPolicy.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="additionalProperty" hint="A property-value pair representing an additional characteristic of the entity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.\n\nNote: Publishers should be aware that applications designed to use specific schema.org properties (e.g. https://schema.org/width, https://schema.org/color, https://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
";

    property name="applicableCountry" hint="A country where a particular merchant return policy applies to, for example the two-letter ISO 3166-1 alpha-2 country code.";

    property name="customerRemorseReturnFees" hint="The type of return fees if the product is returned due to customer remorse.";

    property name="customerRemorseReturnLabelSource" hint="The method (from an enumeration) by which the customer obtains a return shipping label for a product returned due to customer remorse.";

    property name="customerRemorseReturnShippingFeesAmount" hint="The amount of shipping costs if a product is returned due to customer remorse. Applicable when property [[customerRemorseReturnFees]] equals [[ReturnShippingFees]].";

    property name="inStoreReturnsOffered" hint="Are in-store returns offered? (For more advanced return methods use the [[returnMethod]] property.)";

    property name="itemCondition" hint="A predefined value from OfferItemCondition specifying the condition of the product or service, or the products or services included in the offer. Also used for product return policies to specify the condition of products accepted for returns.";

    property name="itemDefectReturnFees" hint="The type of return fees for returns of defect products.";

    property name="itemDefectReturnLabelSource" hint="The method (from an enumeration) by which the customer obtains a return shipping label for a defect product.";

    property name="itemDefectReturnShippingFeesAmount" hint="Amount of shipping costs for defect product returns. Applicable when property [[itemDefectReturnFees]] equals [[ReturnShippingFees]].";

    property name="merchantReturnDays" hint="Specifies either a fixed return date or the number of days (from the delivery date) that a product can be returned. Used when the [[returnPolicyCategory]] property is specified as [[MerchantReturnFiniteReturnWindow]].";

    property name="merchantReturnLink" hint="Specifies a Web page or service by URL, for product returns.";

    property name="refundType" hint="A refund type, from an enumerated list.";

    property name="restockingFee" hint="Use [[MonetaryAmount]] to specify a fixed restocking fee for product returns, or use [[Number]] to specify a percentage of the product price paid by the customer.";

    property name="returnFees" hint="The type of return fees for purchased products (for any return reason).";

    property name="returnLabelSource" hint="The method (from an enumeration) by which the customer obtains a return shipping label for a product returned for any reason.";

    property name="returnMethod" hint="The type of return method offered, specified from an enumeration.";

    property name="returnPolicyCategory" hint="Specifies an applicable return policy (from an enumeration).";

    property name="returnPolicyCountry" hint="The country where the product has to be sent to for returns, for example 'Ireland' using the [[name]] property of [[Country]]. You can also provide the two-letter [ISO 3166-1 alpha-2 country code](http://en.wikipedia.org/wiki/ISO_3166-1). Note that this can be different from the country where the product was originally shipped from or sent to.";

    property name="returnPolicySeasonalOverride" hint="Seasonal override of a return policy.";

    property name="returnShippingFeesAmount" hint="Amount of shipping costs for product returns (for any reason). Applicable when property [[returnFees]] equals [[ReturnShippingFees]].";

    property name="validForMemberTier" hint="The membership program tier an Offer (or a PriceSpecification, OfferShippingDetails, or MerchantReturnPolicy under an Offer) is valid for.";


    variables[ "@type" ] = "MerchantReturnPolicy";

    variables._mappers[ "_abstract" ] = "abstract";

}
