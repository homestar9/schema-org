// --------------------------------------------------------
// AUTO-GENERATED: PalliativeProcedure.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalProcedure" accessors="true" {

    property name="adverseOutcome" hint="A possible complication and/or side effect of this therapy. If it is known that an adverse outcome is serious (resulting in death, disability, or permanent damage; requiring hospitalization; or otherwise life-threatening or requiring immediate medical attention), tag it as a seriousAdverseOutcome instead.";

    property name="contraindication" hint="A contraindication for this therapy.";

    property name="doseSchedule" hint="A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.";

    property name="drug" hint="Specifying a drug or medicine used in a medication procedure.";

    property name="duplicateTherapy" hint="A therapy that duplicates or overlaps this one.";

    property name="seriousAdverseOutcome" hint="A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.";


    variables[ "@type" ] = "PalliativeProcedure";

}
