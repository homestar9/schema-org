// --------------------------------------------------------
// AUTO-GENERATED: PronounceableText.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Text" accessors="true" {

    property name="inLanguage" hint="The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].";

    property name="phoneticText" hint="Representation of a text [[textValue]] using the specified [[speechToTextMarkup]]. For example the city name of Houston in IPA: /ˈhju�?stən/.";

    property name="speechToTextMarkup" hint="Form of markup used. eg. [SSML](https://www.w3.org/TR/speech-synthesis11) or [IPA](https://www.wikidata.org/wiki/Property:P898).";

    property name="textValue" hint="Text value being annotated.";


    variables[ "@type" ] = "PronounceableText";

    variables._mappers[ "_abstract" ] = "abstract";

}
