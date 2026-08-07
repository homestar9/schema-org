// --------------------------------------------------------
// AUTO-GENERATED: Diet.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="code" hint="A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.";

    property name="dietFeatures" hint="Nutritional information specific to the dietary plan. May include dietary recommendations on what foods to avoid, what foods to consume, and specific alterations/deviations from the USDA or other regulatory body's approved dietary guidelines.";

    property name="endorsers" hint="People or organizations that endorse the plan.";

    property name="expertConsiderations" hint="Medical expert advice related to the plan.";

    property name="guideline" hint="A medical guideline related to this entity.";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="medicineSystem" hint="The system of medicine that includes this MedicalEntity, for example 'evidence-based', 'homeopathic', 'chiropractic', etc.";

    property name="physiologicalBenefits" hint="Specific physiologic benefits associated to the plan.";

    property name="recognizingAuthority" hint="If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.";

    property name="relevantSpecialty" hint="If applicable, a medical specialty in which this entity is relevant.";

    property name="risks" hint="Specific physiologic risks associated to the diet plan.";

    property name="study" hint="A medical study or trial related to this entity.";


    variables[ "@type" ] = "Diet";

}
