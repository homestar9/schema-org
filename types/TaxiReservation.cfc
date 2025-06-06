// --------------------------------------------------------
// AUTO-GENERATED: TaxiReservation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Reservation" accessors="true" {

    property name="partySize" hint="Number of people the reservation should accommodate.";

    property name="pickupLocation" hint="Where a taxi will pick up a passenger or a rental car can be picked up.";

    property name="pickupTime" hint="When a taxi will pick up a passenger or a rental car can be picked up.";


    variables[ "@type" ] = "TaxiReservation";

    variables._mappers[ "_abstract" ] = "abstract";

}
