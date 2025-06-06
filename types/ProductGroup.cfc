// --------------------------------------------------------
// AUTO-GENERATED: ProductGroup.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Product" accessors="true" {

    property name="hasVariant" hint="Indicates a [[Product]] that is a member of this [[ProductGroup]] (or [[ProductModel]]).";

    property name="productGroupID" hint="Indicates a textual identifier for a ProductGroup.";

    property name="variesBy" hint="Indicates the property or properties by which the variants in a [[ProductGroup]] vary, e.g. their size, color etc. Schema.org properties can be referenced by their short name e.g. 'color'; terms defined elsewhere can be referenced with their URIs.";


    variables[ "@type" ] = "ProductGroup";

    variables._mappers[ "_abstract" ] = "abstract";

}
