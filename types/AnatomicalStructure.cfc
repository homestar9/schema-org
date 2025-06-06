// --------------------------------------------------------
// AUTO-GENERATED: AnatomicalStructure.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="associatedPathophysiology" hint="If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.";

    property name="bodyLocation" hint="Location in the body of the anatomical structure.";

    property name="connectedTo" hint="Other anatomical structures to which this structure is connected.";

    property name="diagram" hint="An image containing a diagram that illustrates the structure and/or its component substructures and/or connections with other structures.";

    property name="partOfSystem" hint="The anatomical or organ system that this structure is part of.";

    property name="relatedCondition" hint="A medical condition associated with this anatomy.";

    property name="relatedTherapy" hint="A medical therapy related to this anatomy.";

    property name="subStructure" hint="Component (sub-)structure(s) that comprise this anatomical structure.";


    variables[ "@type" ] = "AnatomicalStructure";

    variables._mappers[ "_abstract" ] = "abstract";

}
