// --------------------------------------------------------
// AUTO-GENERATED: ServiceChannel.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="availableLanguage" hint="A language someone may use with or at the item, service or place. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[inLanguage]].";

    property name="processingTime" hint="Estimated processing time for the service using this channel.";

    property name="providesService" hint="The service provided by this channel.";

    property name="serviceLocation" hint="The location (e.g. civic structure, local business, etc.) where a person can go to access the service.";

    property name="servicePhone" hint="The phone number to use to access the service.";

    property name="servicePostalAddress" hint="The address for accessing the service by mail.";

    property name="serviceSmsNumber" hint="The number to access the service by text message.";

    property name="serviceUrl" hint="The website to access the service.";


    variables[ "@type" ] = "ServiceChannel";

    variables._mappers[ "_abstract" ] = "abstract";

}
