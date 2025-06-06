// --------------------------------------------------------
// AUTO-GENERATED: TypeAndQuantityNode.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="amountOfThisGood" hint="The quantity of the goods included in the offer.";

    property name="businessFunction" hint="The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1##Sell.";

    property name="typeOfGood" hint="The product that this structured value is referring to.";

    property name="unitCode" hint="The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.";

    property name="unitText" hint="A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for
<a href='unitCode'>unitCode</a>.";


    variables[ "@type" ] = "TypeAndQuantityNode";

}
