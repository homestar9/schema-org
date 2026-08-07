// --------------------------------------------------------
// AUTO-GENERATED: PhysicalExam.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEnumeration" accessors="true" {

    property name="bodyLocation" hint="Location in the body of the anatomical structure.";

    property name="code" hint="A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.";

    property name="followup" hint="Typical or recommended followup care after the procedure is performed.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="guideline" hint="A medical guideline related to this entity.";

    property name="howPerformed" hint="How the procedure is performed.";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="medicineSystem" hint="The system of medicine that includes this MedicalEntity, for example 'evidence-based', 'homeopathic', 'chiropractic', etc.";

    property name="preparation" hint="Typical preparation that a patient must undergo before having the procedure performed.";

    property name="procedureType" hint="The type of procedure, for example Surgical, Noninvasive, or Percutaneous.";

    property name="recognizingAuthority" hint="If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.";

    property name="relevantSpecialty" hint="If applicable, a medical specialty in which this entity is relevant.";

    property name="status" hint="The status of the study (enumerated).";

    property name="study" hint="A medical study or trial related to this entity.";


    variables[ "@type" ] = "PhysicalExam";

}
