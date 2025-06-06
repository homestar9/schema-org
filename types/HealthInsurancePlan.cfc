// --------------------------------------------------------
// AUTO-GENERATED: HealthInsurancePlan.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="benefitsSummaryUrl" hint="The URL that goes directly to the summary of benefits and coverage for the specific standard plan or plan variation.";

    property name="contactPoint" hint="A contact point for a person or organization.";

    property name="healthPlanDrugOption" hint="TODO.";

    property name="healthPlanDrugTier" hint="The tier(s) of drugs offered by this formulary or insurance plan.";

    property name="healthPlanId" hint="The 14-character, HIOS-generated Plan ID number. (Plan IDs must be unique, even across different markets.)";

    property name="healthPlanMarketingUrl" hint="The URL that goes directly to the plan brochure for the specific standard plan or plan variation.";

    property name="includesHealthPlanFormulary" hint="Formularies covered by this plan.";

    property name="includesHealthPlanNetwork" hint="Networks covered by this plan.";

    property name="usesHealthPlanIdStandard" hint="The standard for interpreting the Plan ID. The preferred is 'HIOS'. See the Centers for Medicare & Medicaid Services for more details.";


    variables[ "@type" ] = "HealthInsurancePlan";

}
