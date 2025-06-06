// --------------------------------------------------------
// AUTO-GENERATED: DataFeedItem.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="dateCreated" hint="The date on which the CreativeWork was created or the item was added to a DataFeed.";

    property name="dateDeleted" hint="The datetime the item was removed from the DataFeed.";

    property name="dateModified" hint="The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed.";

    property name="item" hint="An entity represented by an entry in a list or data feed (e.g. an 'artist' in a list of 'artists').";


    variables[ "@type" ] = "DataFeedItem";

    variables._mappers[ "_abstract" ] = "abstract";

}
