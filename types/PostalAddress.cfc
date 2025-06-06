// --------------------------------------------------------
// AUTO-GENERATED: PostalAddress.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.ContactPoint" accessors="true" {

    property name="addressCountry" hint="The country. Recommended to be in 2-letter [ISO 3166-1 alpha-2](http://en.wikipedia.org/wiki/ISO_3166-1) format, for example 'US'. For backward compatibility, a 3-letter [ISO 3166-1 alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) country code such as 'SGP' or a full country name such as 'Singapore' can also be used.";

    property name="addressLocality" hint="The locality in which the street address is, and which is in the region. For example, Mountain View.";

    property name="addressRegion" hint="The region in which the locality is, and which is in the country. For example, California or another appropriate first-level [Administrative division](https://en.wikipedia.org/wiki/List_of_administrative_divisions_by_country).";

    property name="extendedAddress" hint="An address extension such as an apartment number, C/O or alternative name.";

    property name="postalCode" hint="The postal code. For example, 94043.";

    property name="postOfficeBoxNumber" hint="The post office box number for PO box addresses.";

    property name="streetAddress" hint="The street address. For example, 1600 Amphitheatre Pkwy.";


    variables[ "@type" ] = "PostalAddress";

    variables._mappers[ "_abstract" ] = "abstract";

}
