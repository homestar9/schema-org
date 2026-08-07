// --------------------------------------------------------
// AUTO-GENERATED: MedicalCode.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalIntangible" accessors="true" {

    property name="codeValue" hint="A short textual code that uniquely identifies the value.";

    property name="codingSystem" hint="The coding system, e.g. 'ICD-10'.";

    property name="inCodeSet" hint="A [[CategoryCodeSet]] that contains this category code.";

    property name="inDefinedTermSet" hint="A [[DefinedTermSet]] that contains this term.";

    property name="termCode" hint="A code that identifies this [[DefinedTerm]] within a [[DefinedTermSet]].";


    variables[ "@type" ] = "MedicalCode";

}
