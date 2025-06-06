// --------------------------------------------------------
// AUTO-GENERATED: CompoundPriceSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PriceSpecification" accessors="true" {

    property name="priceComponent" hint="This property links to all [[UnitPriceSpecification]] nodes that apply in parallel for the [[CompoundPriceSpecification]] node.";

    property name="priceType" hint="Defines the type of a price specified for an offered product, for example a list price, a (temporary) sale price or a manufacturer suggested retail price. If multiple prices are specified for an offer the [[priceType]] property can be used to identify the type of each such specified price. The value of priceType can be specified as a value from enumeration PriceTypeEnumeration or as a free form text string for price types that are not already predefined in PriceTypeEnumeration.";


    variables[ "@type" ] = "CompoundPriceSpecification";

    variables._mappers[ "_abstract" ] = "abstract";

}
