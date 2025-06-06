// --------------------------------------------------------
// AUTO-GENERATED: EntryPoint.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="actionApplication" hint="An application that can complete the request.";

    property name="actionPlatform" hint="The high level platform(s) where the Action can be performed for the given URL. To specify a specific application or operating system instance, use actionApplication.";

    property name="application" hint="An application that can complete the request.";

    property name="contentType" hint="The supported content type(s) for an EntryPoint response.";

    property name="encodingType" hint="The supported encoding type(s) for an EntryPoint request.";

    property name="httpMethod" hint="An HTTP method that specifies the appropriate HTTP method for a request to an HTTP EntryPoint. Values are capitalized strings as used in HTTP.";

    property name="urlTemplate" hint="An url template (RFC6570) that will be used to construct the target of the execution of the action.";


    variables[ "@type" ] = "EntryPoint";

}
