// --------------------------------------------------------
// AUTO-GENERATED: SingleFamilyResidence.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.House" accessors="true" {

    property name="numberOfRooms" hint="The number of rooms (excluding bathrooms and closets) of the accommodation or lodging business.
Typical unit code(s): ROM for room or C62 for no unit. The type of room can be put in the unitText property of the QuantitativeValue.";

    property name="occupancy" hint="The allowed total occupancy for the accommodation in persons (including infants etc). For individual accommodations, this is not necessarily the legal maximum but defines the permitted usage as per the contractual agreement (e.g. a double room used by a single person).
Typical unit code(s): C62 for person.";


    variables[ "@type" ] = "SingleFamilyResidence";

}
