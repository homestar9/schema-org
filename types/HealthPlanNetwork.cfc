// --------------------------------------------------------
// AUTO-GENERATED: HealthPlanNetwork.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="healthPlanCostSharing" hint="The costs to the patient for services under this network or formulary.";

    property name="healthPlanNetworkId" hint="Name or unique ID of network. (Networks are often reused across different insurance plans.)";

    property name="healthPlanNetworkTier" hint="The tier(s) for this network.";


    variables[ "@type" ] = "HealthPlanNetwork";

    variables._mappers[ "_abstract" ] = "abstract";

}
