// --------------------------------------------------------
// AUTO-GENERATED: LodgingReservation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Reservation" accessors="true" {

    property name="checkinTime" hint="The earliest someone may check into a lodging establishment.";

    property name="checkoutTime" hint="The latest someone may check out of a lodging establishment.";

    property name="lodgingUnitDescription" hint="A full description of the lodging unit.";

    property name="lodgingUnitType" hint="Textual description of the unit type (including suite vs. room, size of bed, etc.).";

    property name="numAdults" hint="The number of adults staying in the unit.";

    property name="numChildren" hint="The number of children staying in the unit.";


    variables[ "@type" ] = "LodgingReservation";

    variables._mappers[ "_abstract" ] = "abstract";

}
