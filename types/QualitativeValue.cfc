// --------------------------------------------------------
// AUTO-GENERATED: QualitativeValue.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Enumeration" accessors="true" {

    property name="additionalProperty" hint="A property-value pair representing an additional characteristic of the entity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.\n\nNote: Publishers should be aware that applications designed to use specific schema.org properties (e.g. https://schema.org/width, https://schema.org/color, https://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.
";

    property name="equal" hint="This ordering relation for qualitative values indicates that the subject is equal to the object.";

    property name="greater" hint="This ordering relation for qualitative values indicates that the subject is greater than the object.";

    property name="greaterOrEqual" hint="This ordering relation for qualitative values indicates that the subject is greater than or equal to the object.";

    property name="lesser" hint="This ordering relation for qualitative values indicates that the subject is lesser than the object.";

    property name="lesserOrEqual" hint="This ordering relation for qualitative values indicates that the subject is lesser than or equal to the object.";

    property name="nonEqual" hint="This ordering relation for qualitative values indicates that the subject is not equal to the object.";

    property name="valueReference" hint="A secondary value that provides additional information on the original value, e.g. a reference temperature or a type of measurement.";


    variables[ "@type" ] = "QualitativeValue";

    variables._mappers[ "_abstract" ] = "abstract";

}
