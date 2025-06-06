// --------------------------------------------------------
// AUTO-GENERATED: ServicePeriod.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="businessDays" hint="Days of the week when the merchant typically operates, indicated via opening hours markup.";

    property name="cutoffTime" hint="Order cutoff time allows merchants to describe the time after which they will no longer process orders received on that day. For orders processed after cutoff time, one day gets added to the delivery time estimate. This property is expected to be most typically used via the [[ShippingRateSettings]] publication pattern. The time is indicated using the ISO-8601 Time format, e.g. '23:30:00-05:00' would represent 6:30 pm Eastern Standard Time (EST) which is 5 hours behind Coordinated Universal Time (UTC).";

    property name="duration" hint="The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";


    variables[ "@type" ] = "ServicePeriod";

    variables._mappers[ "_abstract" ] = "abstract";

}
