// --------------------------------------------------------
// AUTO-GENERATED: HowToSection.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="aggregateElement" hint="Indicates a prototype of the elements in the list that is used to hold aggregate information (ratings, offers, etc.).";

    property name="item" hint="An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists').";

    property name="itemListElement" hint="For itemListElement values, you can use simple strings (e.g. 'Peter', 'Paul', 'Mary'), existing entities, or use ListItem.\n\nText values are best if the elements in the list are plain strings. Existing entities are best for a simple, unordered list of existing things in your data. ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.\n\nNote: The order of elements in your mark-up is not sufficient for indicating the order or elements.  Use ListItem with a 'position' property in such cases.";

    property name="itemListOrder" hint="Type of ordering (e.g. Ascending, Descending, Unordered).";

    property name="nextItem" hint="A link to the ListItem that follows the current one.";

    property name="numberOfItems" hint="The number of items in an ItemList. Note that some descriptions might not fully describe all items in a list (e.g., multi-page pagination); in such cases, the numberOfItems would be for the entire list.";

    property name="previousItem" hint="A link to the ListItem that precedes the current one.";

    property name="steps" hint="A single step item (as HowToStep, text, document, video, etc.) or a HowToSection (originally misnamed 'steps'; 'step' is preferred).";


    variables[ "@type" ] = "HowToSection";

}
