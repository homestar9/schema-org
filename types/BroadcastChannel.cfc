// --------------------------------------------------------
// AUTO-GENERATED: BroadcastChannel.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="broadcastChannelId" hint="The unique address by which the BroadcastService can be identified in a provider lineup. In US, this is typically a number.";

    property name="broadcastFrequency" hint="The frequency used for over-the-air broadcasts. Numeric values or simple ranges, e.g. 87-99. In addition a shortcut idiom is supported for frequencies of AM and FM radio channels, e.g. '87 FM'.";

    property name="broadcastServiceTier" hint="The type of service required to have access to the channel (e.g. Standard or Premium).";

    property name="genre" hint="Genre of the creative work, broadcast channel or group.";

    property name="inBroadcastLineup" hint="The CableOrSatelliteService offering the channel.";

    property name="providesBroadcastService" hint="The BroadcastService offered on this channel.";


    variables[ "@type" ] = "BroadcastChannel";

    variables._mappers[ "_abstract" ] = "abstract";

}
