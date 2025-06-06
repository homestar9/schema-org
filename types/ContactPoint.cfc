// --------------------------------------------------------
// AUTO-GENERATED: ContactPoint.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="areaServed" hint="The geographic area where a service or offered item is provided.";

    property name="availableLanguage" hint="A language someone may use with or at the item, service or place. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[inLanguage]].";

    property name="contactOption" hint="An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers).";

    property name="contactType" hint="A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.";

    property name="email" hint="Email address.";

    property name="faxNumber" hint="The fax number.";

    property name="hoursAvailable" hint="The hours during which this service or contact is available.";

    property name="productSupported" hint="The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. 'iPhone') or a general category of products or services (e.g. 'smartphones').";

    property name="serviceArea" hint="The geographic area where the service is provided.";

    property name="telephone" hint="The telephone number.";


    variables[ "@type" ] = "ContactPoint";

}
