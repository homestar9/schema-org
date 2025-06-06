// --------------------------------------------------------
// AUTO-GENERATED: AlignmentObject.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="alignmentType" hint="A category of alignment between the learning resource and the framework node. Recommended values include: 'requires', 'textComplexity', 'readingLevel', and 'educationalSubject'.";

    property name="educationalFramework" hint="The framework to which the resource being described is aligned.";

    property name="targetDescription" hint="The description of a node in an established educational framework.";

    property name="targetName" hint="The name of a node in an established educational framework.";

    property name="targetUrl" hint="The URL of a node in an established educational framework.";


    variables[ "@type" ] = "AlignmentObject";

    variables._mappers[ "_abstract" ] = "abstract";

}
