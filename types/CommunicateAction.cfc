// --------------------------------------------------------
// AUTO-GENERATED: CommunicateAction.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.InteractAction" accessors="true" {

    property name="about" hint="The subject matter of the content.";

    property name="inLanguage" hint="The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].";

    property name="language" hint="A sub property of instrument. The language used on this action.";

    property name="recipient" hint="A sub property of participant. The participant who is at the receiving end of the action.";


    variables[ "@type" ] = "CommunicateAction";

    variables._mappers[ "_abstract" ] = "abstract";

}
