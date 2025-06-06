// --------------------------------------------------------
// AUTO-GENERATED: AnatomicalSystem.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="associatedPathophysiology" hint="If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.";

    property name="comprisedOf" hint="Specifying something physically contained by something else. Typically used here for the underlying anatomical structures, such as organs, that comprise the anatomical system.";

    property name="relatedCondition" hint="A medical condition associated with this anatomy.";

    property name="relatedStructure" hint="Related anatomical structure(s) that are not part of the system but relate or connect to it, such as vascular bundles associated with an organ system.";

    property name="relatedTherapy" hint="A medical therapy related to this anatomy.";


    variables[ "@type" ] = "AnatomicalSystem";

}
