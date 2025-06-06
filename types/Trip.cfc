// --------------------------------------------------------
// AUTO-GENERATED: Trip.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="arrivalTime" hint="The expected arrival time.";

    property name="departureTime" hint="The expected departure time.";

    property name="itinerary" hint="Destination(s) ( [[Place]] ) that make up a trip. For a trip where destination order is important use [[ItemList]] to specify that order (see examples).";

    property name="offers" hint="An offer to provide this item&##x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.
      ";

    property name="partOfTrip" hint="Identifies that this [[Trip]] is a subTrip of another Trip.  For example Day 1, Day 2, etc. of a multi-day trip.";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="subTrip" hint="Identifies a [[Trip]] that is a subTrip of this Trip.  For example Day 1, Day 2, etc. of a multi-day trip.";

    property name="tripOrigin" hint="The location of origin of the trip, prior to any destination(s).";


    variables[ "@type" ] = "Trip";

    variables._mappers[ "_abstract" ] = "abstract";

}
