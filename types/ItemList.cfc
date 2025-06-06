// --------------------------------------------------------
// AUTO-GENERATED: ItemList.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="aggregateElement" hint="Indicates a prototype of the elements in the list that is used to hold aggregate information (ratings, offers, etc.).";

    property name="itemListElement" hint="For itemListElement values, you can use simple strings (e.g. 'Peter', 'Paul', 'Mary'), existing entities, or use ListItem.\n\nText values are best if the elements in the list are plain strings. Existing entities are best for a simple, unordered list of existing things in your data. ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.\n\nNote: The order of elements in your mark-up is not sufficient for indicating the order or elements.  Use ListItem with a 'position' property in such cases.";

    property name="itemListOrder" hint="Type of ordering (e.g. Ascending, Descending, Unordered).";

    property name="numberOfItems" hint="The number of items in an ItemList. Note that some descriptions might not fully describe all items in a list (e.g., multi-page pagination); in such cases, the numberOfItems would be for the entire list.";


    variables[ "@type" ] = "ItemList";

    variables._mappers[ "_abstract" ] = "abstract";

}
