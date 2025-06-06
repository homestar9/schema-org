// --------------------------------------------------------
// AUTO-GENERATED: HowTo.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="estimatedCost" hint="The estimated cost of the supply or supplies consumed when performing instructions.";

    property name="performTime" hint="The length of time it takes to perform instructions or a direction (not including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="prepTime" hint="The length of time it takes to prepare the items to be used in instructions or a direction, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="step" hint="A single step item (as HowToStep, text, document, video, etc.) or a HowToSection.";

    property name="steps" hint="A single step item (as HowToStep, text, document, video, etc.) or a HowToSection (originally misnamed 'steps'; 'step' is preferred).";

    property name="supply" hint="A sub-property of instrument. A supply consumed when performing instructions or a direction.";

    property name="tool" hint="A sub property of instrument. An object used (but not consumed) when performing instructions or a direction.";

    property name="totalTime" hint="The total time required to perform instructions or a direction (including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="yield" hint="The quantity that results by performing instructions. For example, a paper airplane, 10 personalized candles.";


    variables[ "@type" ] = "HowTo";

    variables._mappers[ "_abstract" ] = "abstract";

}
