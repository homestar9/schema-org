// --------------------------------------------------------
// AUTO-GENERATED: RentalCarReservation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Reservation" accessors="true" {

    property name="dropoffLocation" hint="Where a rental car can be dropped off.";

    property name="dropoffTime" hint="When a rental car can be dropped off.";

    property name="pickupLocation" hint="Where a taxi will pick up a passenger or a rental car can be picked up.";

    property name="pickupTime" hint="When a taxi will pick up a passenger or a rental car can be picked up.";


    variables[ "@type" ] = "RentalCarReservation";

}
