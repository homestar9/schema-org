// --------------------------------------------------------
// AUTO-GENERATED: PropertyValueSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="defaultValue" hint="The default value of the input.  For properties that expect a literal, the default is a literal value, for properties that expect an object, it's an ID reference to one of the current values.";

    property name="maxValue" hint="The upper value of some characteristic or property.";

    property name="minValue" hint="The lower value of some characteristic or property.";

    property name="multipleValues" hint="Whether multiple values are allowed for the property.  Default is false.";

    property name="readonlyValue" hint="Whether or not a property is mutable.  Default is false. Specifying this for a property that also has a value makes it act similar to a 'hidden' input in an HTML form.";

    property name="stepValue" hint="The stepValue attribute indicates the granularity that is expected (and required) of the value in a PropertyValueSpecification.";

    property name="valueMaxLength" hint="Specifies the allowed range for number of characters in a literal value.";

    property name="valueMinLength" hint="Specifies the minimum allowed range for number of characters in a literal value.";

    property name="valueName" hint="Indicates the name of the PropertyValueSpecification to be used in URL templates and form encoding in a manner analogous to HTML's input@name.";

    property name="valuePattern" hint="Specifies a regular expression for testing literal values according to the HTML spec.";

    property name="valueRequired" hint="Whether the property must be filled in to complete the action.  Default is false.";


    variables[ "@type" ] = "PropertyValueSpecification";

    variables._mappers[ "_abstract" ] = "abstract";

}
