// --------------------------------------------------------
// AUTO-GENERATED: MedicalProcedure.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="bodyLocation" hint="Location in the body of the anatomical structure.";

    property name="followup" hint="Typical or recommended followup care after the procedure is performed.";

    property name="howPerformed" hint="How the procedure is performed.";

    property name="preparation" hint="Typical preparation that a patient must undergo before having the procedure performed.";

    property name="procedureType" hint="The type of procedure, for example Surgical, Noninvasive, or Percutaneous.";

    property name="status" hint="The status of the study (enumerated).";


    variables[ "@type" ] = "MedicalProcedure";

    variables._mappers[ "_abstract" ] = "abstract";

}
