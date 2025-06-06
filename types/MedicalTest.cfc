// --------------------------------------------------------
// AUTO-GENERATED: MedicalTest.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="affectedBy" hint="Drugs that affect the test's results.";

    property name="normalRange" hint="Range of acceptable values for a typical patient, when applicable.";

    property name="signDetected" hint="A sign detected by the test.";

    property name="usedToDiagnose" hint="A condition the test is used to diagnose.";

    property name="usesDevice" hint="Device used to perform the test.";


    variables[ "@type" ] = "MedicalTest";

    variables._mappers[ "_abstract" ] = "abstract";

}
