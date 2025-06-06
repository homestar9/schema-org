// --------------------------------------------------------
// AUTO-GENERATED: Thing.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.models.BaseType" accessors="true" {

    property name="additionalType" hint="An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax. This is a relationship between something and a class that the thing is in. Typically the value is a URI-identified RDF class, and in this case corresponds to the
    use of rdf:type in RDF. Text values can be used sparingly, for cases where useful information can be added without their being an appropriate schema to reference. In the case of text values, the class label should follow the schema.org <a href='https://schema.org/docs/styleguide.html'>style guide</a>.";

    property name="alternateName" hint="An alias for the item.";

    property name="description" hint="A description of the item.";

    property name="disambiguatingDescription" hint="A sub property of description. A short description of the item used to disambiguate from other, similar items. Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.";

    property name="identifier" hint="The identifier property represents any kind of identifier for any kind of [[Thing]], such as ISBNs, GTIN codes, UUIDs etc. Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links. See [background notes](/docs/datamodel.html##identifierBg) for more details.
        ";

    property name="image" hint="An image of the item. This can be a [[URL]] or a fully described [[ImageObject]].";

    property name="mainEntityOfPage" hint="Indicates a page (or other CreativeWork) for which this thing is the main entity being described. See [background notes](/docs/datamodel.html##mainEntityBackground) for details.";

    property name="name" hint="The name of the item.";

    property name="potentialAction" hint="Indicates a potential Action, which describes an idealized action in which this thing would play an 'object' role.";

    property name="sameAs" hint="URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or official website.";

    property name="subjectOf" hint="A CreativeWork or Event about this Thing.";

    property name="url" hint="URL of the item.";


    variables[ "@type" ] = "Thing";

}
