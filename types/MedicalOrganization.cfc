// --------------------------------------------------------
// AUTO-GENERATED: MedicalOrganization.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Organization" accessors="true" {

    property name="healthPlanNetworkId" hint="Name or unique ID of network. (Networks are often reused across different insurance plans.)";

    property name="isAcceptingNewPatients" hint="Whether the provider is accepting new patients.";

    property name="medicalSpecialty" hint="A medical specialty of the provider.";


    variables[ "@type" ] = "MedicalOrganization";

    variables._mappers[ "_abstract" ] = "abstract";

}
