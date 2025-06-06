// --------------------------------------------------------
// AUTO-GENERATED: BioChemEntity.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="associatedDisease" hint="Disease associated to this BioChemEntity. Such disease can be a MedicalCondition or a URL. If you want to add an evidence supporting the association, please use PropertyValue.";

    property name="bioChemInteraction" hint="A BioChemEntity that is known to interact with this item.";

    property name="bioChemSimilarity" hint="A similar BioChemEntity, e.g., obtained by fingerprint similarity algorithms.";

    property name="biologicalRole" hint="A role played by the BioChemEntity within a biological context.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="hasBioChemEntityPart" hint="Indicates a BioChemEntity that (in some sense) has this BioChemEntity as a part. ";

    property name="hasMolecularFunction" hint="Molecular function performed by this BioChemEntity; please use PropertyValue if you want to include any evidence.";

    property name="hasRepresentation" hint="A common representation such as a protein sequence or chemical structure for this entity. For images use schema.org/image.";

    property name="isEncodedByBioChemEntity" hint="Another BioChemEntity encoding by this one.";

    property name="isInvolvedInBiologicalProcess" hint="Biological process this BioChemEntity is involved in; please use PropertyValue if you want to include any evidence.";

    property name="isLocatedInSubcellularLocation" hint="Subcellular location where this BioChemEntity is located; please use PropertyValue if you want to include any evidence.";

    property name="isPartOfBioChemEntity" hint="Indicates a BioChemEntity that is (in some sense) a part of this BioChemEntity. ";

    property name="taxonomicRange" hint="The taxonomic grouping of the organism that expresses, encodes, or in some way related to the BioChemEntity.";


    variables[ "@type" ] = "BioChemEntity";

}
