// --------------------------------------------------------
// AUTO-GENERATED: MedicalDevice.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="adverseOutcome" hint="A possible complication and/or side effect of this therapy. If it is known that an adverse outcome is serious (resulting in death, disability, or permanent damage; requiring hospitalization; or otherwise life-threatening or requiring immediate medical attention), tag it as a seriousAdverseOutcome instead.";

    property name="contraindication" hint="A contraindication for this therapy.";

    property name="postOp" hint="A description of the postoperative procedures, care, and/or followups for this device.";

    property name="preOp" hint="A description of the workup, testing, and other preparations required before implanting this device.";

    property name="procedure" hint="A description of the procedure involved in setting up, using, and/or installing the device.";

    property name="seriousAdverseOutcome" hint="A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.";


    variables[ "@type" ] = "MedicalDevice";

}
