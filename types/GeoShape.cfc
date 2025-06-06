// --------------------------------------------------------
// AUTO-GENERATED: GeoShape.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="address" hint="Physical address of the item.";

    property name="addressCountry" hint="The country. Recommended to be in 2-letter [ISO 3166-1 alpha-2](http://en.wikipedia.org/wiki/ISO_3166-1) format, for example 'US'. For backward compatibility, a 3-letter [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) country code such as 'SGP' or a full country name such as 'Singapore' can also be used.";

    property name="box" hint="A box is the area enclosed by the rectangle formed by two points. The first point is the lower corner, the second point is the upper corner. A box is expressed as two points separated by a space character.";

    property name="circle" hint="A circle is the circular region of a specified radius centered at a specified latitude and longitude. A circle is expressed as a pair followed by a radius in meters.";

    property name="elevation" hint="The elevation of a location ([WGS 84](https://en.wikipedia.org/wiki/World_Geodetic_System)). Values may be of the form 'NUMBER UNIT\_OF\_MEASUREMENT' (e.g., '1,000 m', '3,200 ft') while numbers alone should be assumed to be a value in meters.";

    property name="line" hint="A line is a point-to-point path consisting of two or more points. A line is expressed as a series of two or more point objects separated by space.";

    property name="polygon" hint="A polygon is the area enclosed by a point-to-point path for which the starting and ending points are the same. A polygon is expressed as a series of four or more space delimited points where the first and final points are identical.";

    property name="postalCode" hint="The postal code. For example, 94043.";


    variables[ "@type" ] = "GeoShape";

    variables._mappers[ "_abstract" ] = "abstract";

}
