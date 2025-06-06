// --------------------------------------------------------
// AUTO-GENERATED: FoodEstablishment.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.LocalBusiness" accessors="true" {

    property name="acceptsReservations" hint="Indicates whether a FoodEstablishment accepts reservations. Values can be Boolean, an URL at which reservations can be made or (for backwards compatibility) the strings ```Yes``` or ```No```.";

    property name="hasMenu" hint="Either the actual menu as a structured representation, as text, or a URL of the menu.";

    property name="menu" hint="Either the actual menu as a structured representation, as text, or a URL of the menu.";

    property name="servesCuisine" hint="The cuisine of the restaurant.";

    property name="starRating" hint="An official rating for a lodging business or food establishment, e.g. from national associations or standards bodies. Use the author property to indicate the rating organization, e.g. as an Organization with name such as (e.g. HOTREC, DEHOGA, WHR, or Hotelstars).";


    variables[ "@type" ] = "FoodEstablishment";

}
