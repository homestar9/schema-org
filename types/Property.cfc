// --------------------------------------------------------
// AUTO-GENERATED: Property.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="domainIncludes" hint="Relates a property to a class that is (one of) the type(s) the property is expected to be used on.";

    property name="inverseOf" hint="Relates a property to a property that is its inverse. Inverse properties relate the same pairs of items to each other, but in reversed direction. For example, the 'alumni' and 'alumniOf' properties are inverseOf each other. Some properties don't have explicit inverses; in these situations RDFa and JSON-LD syntax for reverse properties can be used.";

    property name="rangeIncludes" hint="Relates a property to a class that constitutes (one of) the expected type(s) for values of the property.";

    property name="supersededBy" hint="Relates a term (i.e. a property, class or enumeration) to one that supersedes it.";


    variables[ "@type" ] = "Property";

    variables._mappers[ "_abstract" ] = "abstract";

}
