// --------------------------------------------------------
// AUTO-GENERATED: QuantitativeValueDistribution.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="duration" hint="The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="median" hint="The median value.";

    property name="percentile10" hint="The 10th percentile value.";

    property name="percentile25" hint="The 25th percentile value.";

    property name="percentile75" hint="The 75th percentile value.";

    property name="percentile90" hint="The 90th percentile value.";


    variables[ "@type" ] = "QuantitativeValueDistribution";

    variables._mappers[ "_abstract" ] = "abstract";

}
