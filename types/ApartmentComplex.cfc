// --------------------------------------------------------
// AUTO-GENERATED: ApartmentComplex.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Residence" accessors="true" {

    property name="numberOfAccommodationUnits" hint="Indicates the total (available plus unavailable) number of accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAvailableAccommodationUnits]].";

    property name="numberOfAvailableAccommodationUnits" hint="Indicates the number of available accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAccommodationUnits]].";

    property name="numberOfBedrooms" hint="The total integer number of bedrooms in a some [[Accommodation]], [[ApartmentComplex]] or [[FloorPlan]].";

    property name="petsAllowed" hint="Indicates whether pets are allowed to enter the accommodation or lodging business. More detailed information can be put in a text value.";

    property name="tourBookingPage" hint="A page providing information on how to book a tour of some [[Place]], such as an [[Accommodation]] or [[ApartmentComplex]] in a real estate setting, as well as other kinds of tours as appropriate.";


    variables[ "@type" ] = "ApartmentComplex";

    variables._mappers[ "_abstract" ] = "abstract";

}
