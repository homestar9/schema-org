// --------------------------------------------------------
// AUTO-GENERATED: MedicalTherapy.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.TherapeuticProcedure" accessors="true" {

    property name="contraindication" hint="A contraindication for this therapy.";

    property name="duplicateTherapy" hint="A therapy that duplicates or overlaps this one.";

    property name="seriousAdverseOutcome" hint="A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.";


    variables[ "@type" ] = "MedicalTherapy";

    variables._mappers[ "_abstract" ] = "abstract";

}
