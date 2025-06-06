// --------------------------------------------------------
// AUTO-GENERATED: MusicComposition.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="composer" hint="The person or organization who wrote a composition, or who is the composer of a work performed at some event.";

    property name="firstPerformance" hint="The date and place the work was first performed.";

    property name="includedComposition" hint="Smaller compositions included in this work (e.g. a movement in a symphony).";

    property name="iswcCode" hint="The International Standard Musical Work Code for the composition.";

    property name="lyricist" hint="The person who wrote the words.";

    property name="lyrics" hint="The words in the song.";

    property name="musicalKey" hint="The key, mode, or scale this composition uses.";

    property name="musicArrangement" hint="An arrangement derived from the composition.";

    property name="musicCompositionForm" hint="The type of composition (e.g. overture, sonata, symphony, etc.).";

    property name="recordedAs" hint="An audio recording of the work.";


    variables[ "@type" ] = "MusicComposition";

    variables._mappers[ "_abstract" ] = "abstract";

}
