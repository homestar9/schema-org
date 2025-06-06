// --------------------------------------------------------
// AUTO-GENERATED: PeopleAudience.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Audience" accessors="true" {

    property name="healthCondition" hint="Specifying the health condition(s) of a patient, medical study, or other target audience.";

    property name="requiredGender" hint="Audiences defined by a person's gender.";

    property name="requiredMaxAge" hint="Audiences defined by a person's maximum age.";

    property name="requiredMinAge" hint="Audiences defined by a person's minimum age.";

    property name="suggestedAge" hint="The age or age range for the intended audience or person, for example 3-12 months for infants, 1-5 years for toddlers.";

    property name="suggestedGender" hint="The suggested gender of the intended person or audience, for example 'male', 'female', or 'unisex'.";

    property name="suggestedMaxAge" hint="Maximum recommended age in years for the audience or user.";

    property name="suggestedMeasurement" hint="A suggested range of body measurements for the intended audience or person, for example inseam between 32 and 34 inches or height between 170 and 190 cm. Typically found on a size chart for wearable products.";

    property name="suggestedMinAge" hint="Minimum recommended age in years for the audience or user.";


    variables[ "@type" ] = "PeopleAudience";

    variables._mappers[ "_abstract" ] = "abstract";

}
