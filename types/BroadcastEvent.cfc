// --------------------------------------------------------
// AUTO-GENERATED: BroadcastEvent.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PublicationEvent" accessors="true" {

    property name="broadcastOfEvent" hint="The event being broadcast such as a sporting event or awards ceremony.";

    property name="isLiveBroadcast" hint="True if the broadcast is of a live event.";

    property name="subtitleLanguage" hint="Languages in which subtitles/captions are available, in [IETF BCP 47 standard format](http://tools.ietf.org/html/bcp47).";

    property name="videoFormat" hint="The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).";


    variables[ "@type" ] = "BroadcastEvent";

    variables._mappers[ "_abstract" ] = "abstract";

}
