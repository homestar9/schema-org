// --------------------------------------------------------
// AUTO-GENERATED: MerchantReturnPolicySeasonalOverride.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="endDate" hint="The end date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="merchantReturnDays" hint="Specifies either a fixed return date or the number of days (from the delivery date) that a product can be returned. Used when the [[returnPolicyCategory]] property is specified as [[MerchantReturnFiniteReturnWindow]].";

    property name="refundType" hint="A refund type, from an enumerated list.";

    property name="restockingFee" hint="Use [[MonetaryAmount]] to specify a fixed restocking fee for product returns, or use [[Number]] to specify a percentage of the product price paid by the customer.";

    property name="returnFees" hint="The type of return fees for purchased products (for any return reason).";

    property name="returnMethod" hint="The type of return method offered, specified from an enumeration.";

    property name="returnPolicyCategory" hint="Specifies an applicable return policy (from an enumeration).";

    property name="returnShippingFeesAmount" hint="Amount of shipping costs for product returns (for any reason). Applicable when property [[returnFees]] equals [[ReturnShippingFees]].";

    property name="startDate" hint="The start date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";


    variables[ "@type" ] = "MerchantReturnPolicySeasonalOverride";

    variables._mappers[ "_abstract" ] = "abstract";

}
