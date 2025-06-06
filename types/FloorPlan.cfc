// --------------------------------------------------------
// AUTO-GENERATED: FloorPlan.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="amenityFeature" hint="An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.";

    property name="floorSize" hint="The size of the accommodation, e.g. in square meter or squarefoot.
Typical unit code(s): MTK for square meter, FTK for square foot, or YDK for square yard.";

    property name="isPlanForApartment" hint="Indicates some accommodation that this floor plan describes.";

    property name="layoutImage" hint="A schematic image showing the floorplan layout.";

    property name="numberOfAccommodationUnits" hint="Indicates the total (available plus unavailable) number of accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAvailableAccommodationUnits]].";

    property name="numberOfAvailableAccommodationUnits" hint="Indicates the number of available accommodation units in an [[ApartmentComplex]], or the number of accommodation units for a specific [[FloorPlan]] (within its specific [[ApartmentComplex]]). See also [[numberOfAccommodationUnits]].";

    property name="numberOfBathroomsTotal" hint="The total integer number of bathrooms in some [[Accommodation]], following real estate conventions as [documented in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsTotalInteger+Field): 'The simple sum of the number of bathrooms. For example for a property with two Full Bathrooms and one Half Bathroom, the Bathrooms Total Integer will be 3.'. See also [[numberOfRooms]].";

    property name="numberOfBedrooms" hint="The total integer number of bedrooms in a some [[Accommodation]], [[ApartmentComplex]] or [[FloorPlan]].";

    property name="numberOfFullBathrooms" hint="Number of full bathrooms - The total number of full and ¾ bathrooms in an [[Accommodation]]. This corresponds to the [BathroomsFull field in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsFull+Field).";

    property name="numberOfPartialBathrooms" hint="Number of partial bathrooms - The total number of half and ¼ bathrooms in an [[Accommodation]]. This corresponds to the [BathroomsPartial field in RESO](https://ddwiki.reso.org/display/DDW17/BathroomsPartial+Field). ";

    property name="numberOfRooms" hint="The number of rooms (excluding bathrooms and closets) of the accommodation or lodging business.
Typical unit code(s): ROM for room or C62 for no unit. The type of room can be put in the unitText property of the QuantitativeValue.";

    property name="petsAllowed" hint="Indicates whether pets are allowed to enter the accommodation or lodging business. More detailed information can be put in a text value.";


    variables[ "@type" ] = "FloorPlan";

}
