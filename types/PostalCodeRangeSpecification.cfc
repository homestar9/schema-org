// --------------------------------------------------------
// AUTO-GENERATED: PostalCodeRangeSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="postalCodeBegin" hint="First postal code in a range (included).";

    property name="postalCodeEnd" hint="Last postal code in the range (included). Needs to be after [[postalCodeBegin]].";


    variables[ "@type" ] = "PostalCodeRangeSpecification";

}
