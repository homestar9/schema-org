// --------------------------------------------------------
// AUTO-GENERATED: Pharmacy.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalOrganization" accessors="true" {

    property name="additionalProperty" hint="A property-value pair representing an additional characteristic of the entity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.\n\nNote: Publishers should be aware that applications designed to use specific schema.org properties (e.g. https://schema.org/width, https://schema.org/color, https://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
";

    property name="amenityFeature" hint="An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.";

    property name="branchCode" hint="A short textual code (also called 'store code') that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.\n\nFor example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code '3047' is a branchCode for a particular branch.
      ";

    property name="branchOf" hint="The larger organization that this local business is a branch of, if any. Not to be confused with (anatomical) [[branch]].";

    property name="containedIn" hint="The basic containment relation between a place and one that contains it.";

    property name="containedInPlace" hint="The basic containment relation between a place and one that contains it.";

    property name="containsPlace" hint="The basic containment relation between a place and another that it contains.";

    property name="currenciesAccepted" hint="The currency accepted.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="geo" hint="The geo coordinates of the place.";

    property name="geoContains" hint="Represents a relationship between two geometries (or the places they represent), relating a containing geometry to a contained geometry. 'a contains b iff no points of b lie in the exterior of a, and at least one point of the interior of b lies in the interior of a'. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="geoCoveredBy" hint="Represents a relationship between two geometries (or the places they represent), relating a geometry to another that covers it. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="geoCovers" hint="Represents a relationship between two geometries (or the places they represent), relating a covering geometry to a covered geometry. 'Every point of b is a point of (the interior or boundary of) a'. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="geoCrosses" hint="Represents a relationship between two geometries (or the places they represent), relating a geometry to another that crosses it: 'a crosses b: they have some but not all interior points in common, and the dimension of the intersection is less than that of at least one of them'. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="geoDisjoint" hint="Represents spatial relations in which two geometries (or the places they represent) are topologically disjoint: 'they have no point in common. They form a set of disconnected geometries.' (A symmetric relationship, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).)";

    property name="geoEquals" hint="Represents spatial relations in which two geometries (or the places they represent) are topologically equal, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM). 'Two geometries are topologically equal if their interiors intersect and no part of the interior or boundary of one geometry intersects the exterior of the other' (a symmetric relationship).";

    property name="geoIntersects" hint="Represents spatial relations in which two geometries (or the places they represent) have at least one point in common. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="geoOverlaps" hint="Represents a relationship between two geometries (or the places they represent), relating a geometry to another that geospatially overlaps it, i.e. they have some but not all points in common. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="geoTouches" hint="Represents spatial relations in which two geometries (or the places they represent) touch: 'they have at least one boundary point in common, but no interior points.' (A symmetric relationship, as defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).)";

    property name="geoWithin" hint="Represents a relationship between two geometries (or the places they represent), relating a geometry to one that contains it, i.e. it is inside (i.e. within) its interior. As defined in [DE-9IM](https://en.wikipedia.org/wiki/DE-9IM).";

    property name="hasDriveThroughService" hint="Indicates whether some facility (e.g. [[FoodEstablishment]], [[CovidTestingFacility]]) offers a service that can be used by driving through in a car. In the case of [[CovidTestingFacility]] such facilities could potentially help with social distancing from other potentially-infected users.";

    property name="hasMap" hint="A URL to a map of the place.";

    property name="isAccessibleForFree" hint="A flag to signal that the item, event, or place is accessible for free.";

    property name="latitude" hint="The latitude of a location. For example ```37.42242``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).";

    property name="longitude" hint="The longitude of a location. For example ```-122.08585``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).";

    property name="map" hint="A URL to a map of the place.";

    property name="maps" hint="A URL to a map of the place.";

    property name="maximumAttendeeCapacity" hint="The total number of individuals that may attend an event or venue.";

    property name="openingHours" hint="The general opening hours for a business. Opening hours can be specified as a weekly time range, starting with days, then times per day. Multiple days can be listed with commas ',' separating each day. Day or time ranges are specified using a hyphen '-'.\n\n* Days are specified using the following two-letter combinations: ```Mo```, ```Tu```, ```We```, ```Th```, ```Fr```, ```Sa```, ```Su```.\n* Times are specified using 24:00 format. For example, 3pm is specified as ```15:00```, 10am as ```10:00```. \n* Here is an example: <code>&lt;time itemprop='openingHours' datetime=&quot;Tu,Th 16:00-20:00&quot;&gt;Tuesdays and Thursdays 4-8pm&lt;/time&gt;</code>.\n* If a business is open 7 days a week, then it can be specified as <code>&lt;time itemprop=&quot;openingHours&quot; datetime=&quot;Mo-Su&quot;&gt;Monday through Sunday, all day&lt;/time&gt;</code>.";

    property name="openingHoursSpecification" hint="The opening hours of a certain place.";

    property name="paymentAccepted" hint="Cash, Credit Card, Cryptocurrency, Local Exchange Tradings System, etc.";

    property name="photo" hint="A photograph of this place.";

    property name="photos" hint="Photographs of this place.";

    property name="priceRange" hint="The price range of the business, for example ```$$$```.";

    property name="publicAccess" hint="A flag to signal that the [[Place]] is open to public visitors.  If this property is omitted there is no assumed default boolean value.";

    property name="smokingAllowed" hint="Indicates whether it is allowed to smoke in the place, e.g. in the restaurant, hotel or hotel room.";

    property name="specialOpeningHoursSpecification" hint="The special opening hours of a certain place.\n\nUse this to explicitly override general opening hours brought in scope by [[openingHoursSpecification]] or [[openingHours]].
      ";

    property name="tourBookingPage" hint="A page providing information on how to book a tour of some [[Place]], such as an [[Accommodation]] or [[ApartmentComplex]] in a real estate setting, as well as other kinds of tours as appropriate.";


    variables[ "@type" ] = "Pharmacy";

}
