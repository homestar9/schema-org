// --------------------------------------------------------
// AUTO-GENERATED: TrainTrip.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Trip" accessors="true" {

    property name="arrivalPlatform" hint="The platform where the train arrives.";

    property name="arrivalStation" hint="The station where the train trip ends.";

    property name="departurePlatform" hint="The platform from which the train departs.";

    property name="departureStation" hint="The station from which the train departs.";

    property name="trainName" hint="The name of the train (e.g. The Orient Express).";

    property name="trainNumber" hint="The unique identifier for the train.";


    variables[ "@type" ] = "TrainTrip";

    variables._mappers[ "_abstract" ] = "abstract";

}
