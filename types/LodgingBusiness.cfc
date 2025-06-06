// --------------------------------------------------------
// AUTO-GENERATED: LodgingBusiness.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.LocalBusiness" accessors="true" {

    property name="amenityFeature" hint="An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.";

    property name="audience" hint="An intended audience, i.e. a group for whom something was created.";

    property name="availableLanguage" hint="A language someone may use with or at the item, service or place. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[inLanguage]].";

    property name="checkinTime" hint="The earliest someone may check into a lodging establishment.";

    property name="checkoutTime" hint="The latest someone may check out of a lodging establishment.";

    property name="numberOfRooms" hint="The number of rooms (excluding bathrooms and closets) of the accommodation or lodging business.
Typical unit code(s): ROM for room or C62 for no unit. The type of room can be put in the unitText property of the QuantitativeValue.";

    property name="petsAllowed" hint="Indicates whether pets are allowed to enter the accommodation or lodging business. More detailed information can be put in a text value.";

    property name="starRating" hint="An official rating for a lodging business or food establishment, e.g. from national associations or standards bodies. Use the author property to indicate the rating organization, e.g. as an Organization with name such as (e.g. HOTREC, DEHOGA, WHR, or Hotelstars).";


    variables[ "@type" ] = "LodgingBusiness";

    variables._mappers[ "_abstract" ] = "abstract";

}
