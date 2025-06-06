// --------------------------------------------------------
// AUTO-GENERATED: ScreeningEvent.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Event" accessors="true" {

    property name="subtitleLanguage" hint="Languages in which subtitles/captions are available, in [IETF BCP 47 standard format](http://tools.ietf.org/html/bcp47).";

    property name="videoFormat" hint="The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).";

    property name="workPresented" hint="The movie presented during this event.";


    variables[ "@type" ] = "ScreeningEvent";

}
