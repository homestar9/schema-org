// --------------------------------------------------------
// AUTO-GENERATED: PublicationVolume.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="pageEnd" hint="The page on which the work ends; for example '138' or 'xvi'.";

    property name="pageStart" hint="The page on which the work starts; for example '135' or 'xiii'.";

    property name="pagination" hint="Any description of pages that is not separated into pageStart and pageEnd; for example, '1-6, 9, 55' or '10-12, 46-49'.";

    property name="volumeNumber" hint="Identifies the volume of publication or multi-part work; for example, 'iii' or '2'.";


    variables[ "@type" ] = "PublicationVolume";

    variables._mappers[ "_abstract" ] = "abstract";

}
