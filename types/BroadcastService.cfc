// --------------------------------------------------------
// AUTO-GENERATED: BroadcastService.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Service" accessors="true" {

    property name="area" hint="The area within which users can expect to reach the broadcast service.";

    property name="broadcastAffiliateOf" hint="The media network(s) whose content is broadcast on this station.";

    property name="broadcastDisplayName" hint="The name displayed in the channel guide. For many US affiliates, it is the network name.";

    property name="broadcaster" hint="The organization owning or operating the broadcast service.";

    property name="broadcastFrequency" hint="The frequency used for over-the-air broadcasts. Numeric values or simple ranges, e.g. 87-99. In addition a shortcut idiom is supported for frequencies of AM and FM radio channels, e.g. '87 FM'.";

    property name="broadcastTimezone" hint="The timezone in [ISO 8601 format](http://en.wikipedia.org/wiki/ISO_8601) for which the service bases its broadcasts.";

    property name="callSign" hint="A [callsign](https://en.wikipedia.org/wiki/Call_sign), as used in broadcasting and radio communications to identify people, radio and TV stations, or vehicles.";

    property name="hasBroadcastChannel" hint="A broadcast channel of a broadcast service.";

    property name="inLanguage" hint="The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].";

    property name="parentService" hint="A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.";

    property name="videoFormat" hint="The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).";


    variables[ "@type" ] = "BroadcastService";

}
