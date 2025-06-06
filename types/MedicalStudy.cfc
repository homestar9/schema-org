// --------------------------------------------------------
// AUTO-GENERATED: MedicalStudy.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="healthCondition" hint="Specifying the health condition(s) of a patient, medical study, or other target audience.";

    property name="sponsor" hint="A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.";

    property name="status" hint="The status of the study (enumerated).";

    property name="studyLocation" hint="The location in which the study is taking/took place.";

    property name="studySubject" hint="A subject of the study, i.e. one of the medical conditions, therapies, devices, drugs, etc. investigated by the study.";


    variables[ "@type" ] = "MedicalStudy";

    variables._mappers[ "_abstract" ] = "abstract";

}
