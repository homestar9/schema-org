// --------------------------------------------------------
// AUTO-GENERATED: DefinedRegion.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="addressCountry" hint="The country. Recommended to be in 2-letter [ISO 3166-1 alpha-2](http://en.wikipedia.org/wiki/ISO_3166-1) format, for example 'US'. For backward compatibility, a 3-letter [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) country code such as 'SGP' or a full country name such as 'Singapore' can also be used.";

    property name="addressRegion" hint="The region in which the locality is, and which is in the country. For example, California or another appropriate first-level [Administrative division](https://en.wikipedia.org/wiki/List_of_administrative_divisions_by_country).";

    property name="postalCode" hint="The postal code. For example, 94043.";

    property name="postalCodePrefix" hint="A defined range of postal codes indicated by a common textual prefix. Used for non-numeric systems such as UK.";

    property name="postalCodeRange" hint="A defined range of postal codes.";


    variables[ "@type" ] = "DefinedRegion";

    variables._mappers[ "_abstract" ] = "abstract";

}
