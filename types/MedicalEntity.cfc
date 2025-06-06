// --------------------------------------------------------
// AUTO-GENERATED: MedicalEntity.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="code" hint="A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="guideline" hint="A medical guideline related to this entity.";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="medicineSystem" hint="The system of medicine that includes this MedicalEntity, for example 'evidence-based', 'homeopathic', 'chiropractic', etc.";

    property name="recognizingAuthority" hint="If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.";

    property name="relevantSpecialty" hint="If applicable, a medical specialty in which this entity is relevant.";

    property name="study" hint="A medical study or trial related to this entity.";


    variables[ "@type" ] = "MedicalEntity";

    variables._mappers[ "_abstract" ] = "abstract";

}
