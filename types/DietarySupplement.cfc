// --------------------------------------------------------
// AUTO-GENERATED: DietarySupplement.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Product" accessors="true" {

    property name="activeIngredient" hint="An active ingredient, typically chemical compounds and/or biologic substances.";

    property name="code" hint="A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.";

    property name="guideline" hint="A medical guideline related to this entity.";

    property name="isProprietary" hint="True if this item's name is a proprietary/brand name (vs. generic name).";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="maximumIntake" hint="Recommended intake of this supplement for a given population as defined by a specific recommending authority.";

    property name="mechanismOfAction" hint="The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.";

    property name="medicineSystem" hint="The system of medicine that includes this MedicalEntity, for example 'evidence-based', 'homeopathic', 'chiropractic', etc.";

    property name="nonProprietaryName" hint="The generic name of this drug or supplement.";

    property name="proprietaryName" hint="Proprietary name given to the diet plan, typically by its originator or creator.";

    property name="recognizingAuthority" hint="If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.";

    property name="recommendedIntake" hint="Recommended intake of this supplement for a given population as defined by a specific recommending authority.";

    property name="relevantSpecialty" hint="If applicable, a medical specialty in which this entity is relevant.";

    property name="safetyConsideration" hint="Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.";

    property name="study" hint="A medical study or trial related to this entity.";

    property name="targetPopulation" hint="Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.";


    variables[ "@type" ] = "DietarySupplement";

}
