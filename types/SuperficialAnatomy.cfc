// --------------------------------------------------------
// AUTO-GENERATED: SuperficialAnatomy.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="associatedPathophysiology" hint="If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.";

    property name="relatedAnatomy" hint="Anatomical systems or structures that relate to the superficial anatomy.";

    property name="relatedCondition" hint="A medical condition associated with this anatomy.";

    property name="relatedTherapy" hint="A medical therapy related to this anatomy.";

    property name="significance" hint="The significance associated with the superficial anatomy; as an example, how characteristics of the superficial anatomy can suggest underlying medical conditions or courses of treatment.";


    variables[ "@type" ] = "SuperficialAnatomy";

    variables._mappers[ "_abstract" ] = "abstract";

}
