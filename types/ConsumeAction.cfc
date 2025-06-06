// --------------------------------------------------------
// AUTO-GENERATED: ConsumeAction.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Action" accessors="true" {

    property name="actionAccessibilityRequirement" hint="A set of requirements that must be fulfilled in order to perform an Action. If more than one value is specified, fulfilling one set of requirements will allow the Action to be performed.";

    property name="expectsAcceptanceOf" hint="An Offer which must be accepted before the user can perform the Action. For example, the user may need to buy a movie before being able to watch it.";


    variables[ "@type" ] = "ConsumeAction";

    variables._mappers[ "_abstract" ] = "abstract";

}
