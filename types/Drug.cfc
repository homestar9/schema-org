// --------------------------------------------------------
// AUTO-GENERATED: Drug.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Product" accessors="true" {

    property name="activeIngredient" hint="An active ingredient, typically chemical compounds and/or biologic substances.";

    property name="administrationRoute" hint="A route by which this drug may be administered, e.g. 'oral'.";

    property name="alcoholWarning" hint="Any precaution, guidance, contraindication, etc. related to consumption of alcohol while taking this drug.";

    property name="availableStrength" hint="An available dosage strength for the drug.";

    property name="breastfeedingWarning" hint="Any precaution, guidance, contraindication, etc. related to this drug's use by breastfeeding mothers.";

    property name="clincalPharmacology" hint="Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).";

    property name="clinicalPharmacology" hint="Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).";

    property name="dosageForm" hint="A dosage form in which this drug/supplement is available, e.g. 'tablet', 'suspension', 'injection'.";

    property name="doseSchedule" hint="A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.";

    property name="drugClass" hint="The class of drug this belongs to (e.g., statins).";

    property name="drugUnit" hint="The unit in which the drug is measured, e.g. '5 mg tablet'.";

    property name="foodWarning" hint="Any precaution, guidance, contraindication, etc. related to consumption of specific foods while taking this drug.";

    property name="includedInHealthInsurancePlan" hint="The insurance plans that cover this drug.";

    property name="interactingDrug" hint="Another drug that is known to interact with this drug in a way that impacts the effect of this drug or causes a risk to the patient. Note: disease interactions are typically captured as contraindications.";

    property name="isAvailableGenerically" hint="True if the drug is available in a generic form (regardless of name).";

    property name="isProprietary" hint="True if this item's name is a proprietary/brand name (vs. generic name).";

    property name="labelDetails" hint="Link to the drug's label details.";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="maximumIntake" hint="Recommended intake of this supplement for a given population as defined by a specific recommending authority.";

    property name="mechanismOfAction" hint="The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.";

    property name="nonProprietaryName" hint="The generic name of this drug or supplement.";

    property name="overdosage" hint="Any information related to overdose on a drug, including signs or symptoms, treatments, contact information for emergency response.";

    property name="pregnancyCategory" hint="Pregnancy category of this drug.";

    property name="pregnancyWarning" hint="Any precaution, guidance, contraindication, etc. related to this drug's use during pregnancy.";

    property name="prescribingInfo" hint="Link to prescribing information for the drug.";

    property name="prescriptionStatus" hint="Indicates the status of drug prescription, e.g. local catalogs classifications or whether the drug is available by prescription or over-the-counter, etc.";

    property name="proprietaryName" hint="Proprietary name given to the diet plan, typically by its originator or creator.";

    property name="relatedDrug" hint="Any other drug related to this one, for example commonly-prescribed alternatives.";

    property name="rxcui" hint="The RxCUI drug identifier from RXNORM.";

    property name="warning" hint="Any FDA or other warnings about the drug (text or URL).";


    variables[ "@type" ] = "Drug";

    variables._mappers[ "_abstract" ] = "abstract";

}
