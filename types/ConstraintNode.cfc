// --------------------------------------------------------
// AUTO-GENERATED: ConstraintNode.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="constraintProperty" hint="Indicates a property used as a constraint. For example, in the definition of a [[StatisticalVariable]]. The value is a property, either from within Schema.org or from other compatible (e.g. RDF) systems such as DataCommons.org or Wikidata.org. ";

    property name="numConstraints" hint="Indicates the number of constraints property values defined for a particular [[ConstraintNode]] such as [[StatisticalVariable]]. This helps applications understand if they have access to a sufficiently complete description of a [[StatisticalVariable]] or other construct that is defined using properties on template-style nodes.";


    variables[ "@type" ] = "ConstraintNode";

    variables._mappers[ "_abstract" ] = "abstract";

}
