// --------------------------------------------------------
// AUTO-GENERATED: MedicalRiskEstimator.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="estimatesRiskOf" hint="The condition, complication, or symptom whose risk is being estimated.";

    property name="includedRiskFactor" hint="A modifiable or non-modifiable risk factor included in the calculation, e.g. age, coexisting condition.";


    variables[ "@type" ] = "MedicalRiskEstimator";

    variables._mappers[ "_abstract" ] = "abstract";

}
