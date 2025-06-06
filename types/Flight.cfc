// --------------------------------------------------------
// AUTO-GENERATED: Flight.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Trip" accessors="true" {

    property name="aircraft" hint="The kind of aircraft (e.g., 'Boeing 747').";

    property name="arrivalAirport" hint="The airport where the flight terminates.";

    property name="arrivalGate" hint="Identifier of the flight's arrival gate.";

    property name="arrivalTerminal" hint="Identifier of the flight's arrival terminal.";

    property name="boardingPolicy" hint="The type of boarding policy used by the airline (e.g. zone-based or group-based).";

    property name="carrier" hint="'carrier' is an out-dated term indicating the 'provider' for parcel delivery and flights.";

    property name="departureAirport" hint="The airport where the flight originates.";

    property name="departureGate" hint="Identifier of the flight's departure gate.";

    property name="departureTerminal" hint="Identifier of the flight's departure terminal.";

    property name="estimatedFlightDuration" hint="The estimated time the flight will take.";

    property name="flightDistance" hint="The distance of the flight.";

    property name="flightNumber" hint="The unique identifier for a flight including the airline IATA code. For example, if describing United flight 110, where the IATA code for United is 'UA', the flightNumber is 'UA110'.";

    property name="mealService" hint="Description of the meals that will be provided or available for purchase.";

    property name="seller" hint="An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.";

    property name="webCheckinTime" hint="The time when a passenger can check into the flight online.";


    variables[ "@type" ] = "Flight";

    variables._mappers[ "_abstract" ] = "abstract";

}
