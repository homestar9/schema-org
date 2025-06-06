// --------------------------------------------------------
// AUTO-GENERATED: HealthPlanCostSharingSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="healthPlanCoinsuranceOption" hint="Whether the coinsurance applies before or after deductible, etc. TODO: Is this a closed set?";

    property name="healthPlanCoinsuranceRate" hint="The rate of coinsurance expressed as a number between 0.0 and 1.0.";

    property name="healthPlanCopay" hint="The copay amount.";

    property name="healthPlanCopayOption" hint="Whether the copay is before or after deductible, etc. TODO: Is this a closed set?";

    property name="healthPlanPharmacyCategory" hint="The category or type of pharmacy associated with this cost sharing.";


    variables[ "@type" ] = "HealthPlanCostSharingSpecification";

}
