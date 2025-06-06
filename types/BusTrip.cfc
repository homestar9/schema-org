// --------------------------------------------------------
// AUTO-GENERATED: BusTrip.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Trip" accessors="true" {

    property name="arrivalBusStop" hint="The stop or station from which the bus arrives.";

    property name="busName" hint="The name of the bus (e.g. Bolt Express).";

    property name="busNumber" hint="The unique identifier for the bus.";

    property name="departureBusStop" hint="The stop or station from which the bus departs.";


    variables[ "@type" ] = "BusTrip";

    variables._mappers[ "_abstract" ] = "abstract";

}
