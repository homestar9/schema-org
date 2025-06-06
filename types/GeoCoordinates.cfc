// --------------------------------------------------------
// AUTO-GENERATED: GeoCoordinates.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="address" hint="Physical address of the item.";

    property name="addressCountry" hint="The country. Recommended to be in 2-letter [ISO 3166-1 alpha-2](http://en.wikipedia.org/wiki/ISO_3166-1) format, for example 'US'. For backward compatibility, a 3-letter [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) country code such as 'SGP' or a full country name such as 'Singapore' can also be used.";

    property name="elevation" hint="The elevation of a location ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)). Values may be of the form 'NUMBER UNIT\_OF\_MEASUREMENT' (e.g., '1,000 m', '3,200 ft') while numbers alone should be assumed to be a value in meters.";

    property name="latitude" hint="The latitude of a location. For example ```37.42242``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).";

    property name="longitude" hint="The longitude of a location. For example ```-122.08585``` ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)).";

    property name="postalCode" hint="The postal code. For example, 94043.";


    variables[ "@type" ] = "GeoCoordinates";

    variables._mappers[ "_abstract" ] = "abstract";

}
