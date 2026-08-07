// --------------------------------------------------------
// AUTO-GENERATED: HowToDirection.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="afterMedia" hint="A media object representing the circumstances after performing this direction.";

    property name="beforeMedia" hint="A media object representing the circumstances before performing this direction.";

    property name="duringMedia" hint="A media object representing the circumstances while performing this direction.";

    property name="item" hint="An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists').";

    property name="nextItem" hint="A link to the ListItem that follows the current one.";

    property name="performTime" hint="The length of time it takes to perform instructions or a direction (not including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="prepTime" hint="The length of time it takes to prepare the items to be used in instructions or a direction, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="previousItem" hint="A link to the ListItem that precedes the current one.";

    property name="supply" hint="A sub-property of instrument. A supply consumed when performing instructions or a direction.";

    property name="tool" hint="A sub property of instrument. An object used (but not consumed) when performing instructions or a direction.";

    property name="totalTime" hint="The total time required to perform instructions or a direction (including time to prepare the supplies), in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";


    variables[ "@type" ] = "HowToDirection";

}
