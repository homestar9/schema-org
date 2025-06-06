// --------------------------------------------------------
// AUTO-GENERATED: MedicalCondition.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="associatedAnatomy" hint="The anatomy of the underlying organ system or structures associated with this entity.";

    property name="differentialDiagnosis" hint="One of a set of differential diagnoses for the condition. Specifically, a closely-related or competing diagnosis typically considered later in the cognitive process whereby this medical condition is distinguished from others most likely responsible for a similar collection of signs and symptoms to reach the most parsimonious diagnosis or diagnoses in a patient.";

    property name="drug" hint="Specifying a drug or medicine used in a medication procedure.";

    property name="epidemiology" hint="The characteristics of associated patients, such as age, gender, race etc.";

    property name="expectedPrognosis" hint="The likely outcome in either the short term or long term of the medical condition.";

    property name="naturalProgression" hint="The expected progression of the condition if it is not treated and allowed to progress naturally.";

    property name="pathophysiology" hint="Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.";

    property name="possibleComplication" hint="A possible unexpected and unfavorable evolution of a medical condition. Complications may include worsening of the signs or symptoms of the disease, extension of the condition to other organ systems, etc.";

    property name="possibleTreatment" hint="A possible treatment to address this condition, sign or symptom.";

    property name="primaryPrevention" hint="A preventative therapy used to prevent an initial occurrence of the medical condition, such as vaccination.";

    property name="riskFactor" hint="A modifiable or non-modifiable factor that increases the risk of a patient contracting this condition, e.g. age,  coexisting condition.";

    property name="secondaryPrevention" hint="A preventative therapy used to prevent reoccurrence of the medical condition after an initial episode of the condition.";

    property name="signOrSymptom" hint="A sign or symptom of this condition. Signs are objective or physically observable manifestations of the medical condition while symptoms are the subjective experience of the medical condition.";

    property name="stage" hint="The stage of the condition, if applicable.";

    property name="status" hint="The status of the study (enumerated).";

    property name="typicalTest" hint="A medical test typically performed given this condition.";


    variables[ "@type" ] = "MedicalCondition";

}
