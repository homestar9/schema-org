// --------------------------------------------------------
// AUTO-GENERATED: ProductModel.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Product" accessors="true" {

    property name="isVariantOf" hint="Indicates the kind of product that this is a variant of. In the case of [[ProductModel]], this is a pointer (from a ProductModel) to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive. In the case of a [[ProductGroup]], the group description also serves as a template, representing a set of Products that vary on explicitly defined, specific dimensions only (so it defines both a set of variants, as well as which values distinguish amongst those variants). When used with [[ProductGroup]], this property can apply to any [[Product]] included in the group.";

    property name="predecessorOf" hint="A pointer from a previous, often discontinued variant of the product to its newer variant.";

    property name="successorOf" hint="A pointer from a newer variant of a product  to its previous, often discontinued predecessor.";


    variables[ "@type" ] = "ProductModel";

}
