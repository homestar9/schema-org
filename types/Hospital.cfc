// --------------------------------------------------------
// AUTO-GENERATED: Hospital.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.EmergencyService" accessors="true" {

    property name="availableService" hint="A medical service available from this provider.";

    property name="healthcareReportingData" hint="Indicates data describing a hospital, e.g. a CDC [[CDCPMDRecord]] or as some kind of [[Dataset]].";

    property name="medicalSpecialty" hint="A medical specialty of the provider.";


    variables[ "@type" ] = "Hospital";

    variables._mappers[ "_abstract" ] = "abstract";

}
