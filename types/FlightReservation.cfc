// --------------------------------------------------------
// AUTO-GENERATED: FlightReservation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Reservation" accessors="true" {

    property name="boardingGroup" hint="The airline-specific indicator of boarding order / preference.";

    property name="passengerPriorityStatus" hint="The priority status assigned to a passenger for security or boarding (e.g. FastTrack or Priority).";

    property name="passengerSequenceNumber" hint="The passenger's sequence number as assigned by the airline.";

    property name="securityScreening" hint="The type of security screening the passenger is subject to.";


    variables[ "@type" ] = "FlightReservation";

}
