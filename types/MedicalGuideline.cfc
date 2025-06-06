// --------------------------------------------------------
// AUTO-GENERATED: MedicalGuideline.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="evidenceLevel" hint="Strength of evidence of the data used to formulate the guideline (enumerated).";

    property name="evidenceOrigin" hint="Source of the data used to formulate the guidance, e.g. RCT, consensus opinion, etc.";

    property name="guidelineDate" hint="Date on which this guideline's recommendation was made.";

    property name="guidelineSubject" hint="The medical conditions, treatments, etc. that are the subject of the guideline.";


    variables[ "@type" ] = "MedicalGuideline";

}
