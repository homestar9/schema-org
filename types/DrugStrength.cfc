// --------------------------------------------------------
// AUTO-GENERATED: DrugStrength.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalIntangible" accessors="true" {

    property name="activeIngredient" hint="An active ingredient, typically chemical compounds and/or biologic substances.";

    property name="availableIn" hint="The location in which the strength is available.";

    property name="maximumIntake" hint="Recommended intake of this supplement for a given population as defined by a specific recommending authority.";

    property name="strengthUnit" hint="The units of an active ingredient's strength, e.g. mg.";

    property name="strengthValue" hint="The value of an active ingredient's strength, e.g. 325.";


    variables[ "@type" ] = "DrugStrength";

}
