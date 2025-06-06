// --------------------------------------------------------
// AUTO-GENERATED: HotelRoom.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Room" accessors="true" {

    property name="bed" hint="The type of bed or beds included in the accommodation. For the single case of just one bed of a certain type, you use bed directly with a text.
      If you want to indicate the quantity of a certain kind of bed, use an instance of BedDetails. For more detailed information, use the amenityFeature property.";

    property name="occupancy" hint="The allowed total occupancy for the accommodation in persons (including infants etc). For individual accommodations, this is not necessarily the legal maximum but defines the permitted usage as per the contractual agreement (e.g. a double room used by a single person).
Typical unit code(s): C62 for person.";


    variables[ "@type" ] = "HotelRoom";

    variables._mappers[ "_abstract" ] = "abstract";

}
