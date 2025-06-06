// --------------------------------------------------------
// AUTO-GENERATED: ComicIssue.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PublicationIssue" accessors="true" {

    property name="artist" hint="The primary artist for a work
    	in a medium other than pencils or digital line art--for example, if the
    	primary artwork is done in watercolors or digital paints.";

    property name="colorist" hint="The individual who adds color to inked drawings.";

    property name="inker" hint="The individual who traces over the pencil drawings in ink after pencils are complete.";

    property name="letterer" hint="The individual who adds lettering, including speech balloons and sound effects, to artwork.";

    property name="penciler" hint="The individual who draws the primary narrative artwork.";

    property name="variantCover" hint="A description of the variant cover
    	for the issue, if the issue is a variant printing. For example, 'Bryan Hitch
    	Variant Cover' or '2nd Printing Variant'.";


    variables[ "@type" ] = "ComicIssue";

}
