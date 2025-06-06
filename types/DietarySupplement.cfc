// --------------------------------------------------------
// AUTO-GENERATED: DietarySupplement.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Substance" accessors="true" {

    property name="activeIngredient" hint="An active ingredient, typically chemical compounds and/or biologic substances.";

    property name="isProprietary" hint="True if this item's name is a proprietary/brand name (vs. generic name).";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="maximumIntake" hint="Recommended intake of this supplement for a given population as defined by a specific recommending authority.";

    property name="mechanismOfAction" hint="The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.";

    property name="nonProprietaryName" hint="The generic name of this drug or supplement.";

    property name="proprietaryName" hint="Proprietary name given to the diet plan, typically by its originator or creator.";

    property name="recommendedIntake" hint="Recommended intake of this supplement for a given population as defined by a specific recommending authority.";

    property name="safetyConsideration" hint="Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.";

    property name="targetPopulation" hint="Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.";


    variables[ "@type" ] = "DietarySupplement";

    variables._mappers[ "_abstract" ] = "abstract";

}
