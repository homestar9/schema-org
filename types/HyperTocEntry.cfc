// --------------------------------------------------------
// AUTO-GENERATED: HyperTocEntry.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="associatedMedia" hint="A media object that encodes this CreativeWork. This property is a synonym for encoding.";

    property name="tocContinuation" hint="A [[HyperTocEntry]] can have a [[tocContinuation]] indicated, which is another [[HyperTocEntry]] that would be the default next item to play or render.";

    property name="utterances" hint="Text of an utterances (spoken words, lyrics etc.) that occurs at a certain section of a media object, represented as a [[HyperTocEntry]].";


    variables[ "@type" ] = "HyperTocEntry";

    variables._mappers[ "_abstract" ] = "abstract";

}
