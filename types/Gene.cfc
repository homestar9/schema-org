// --------------------------------------------------------
// AUTO-GENERATED: Gene.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.BioChemEntity" accessors="true" {

    property name="alternativeOf" hint="Another gene which is a variation of this one.";

    property name="encodesBioChemEntity" hint="Another BioChemEntity encoded by this one. ";

    property name="expressedIn" hint="Tissue, organ, biological sample, etc in which activity of this gene has been observed experimentally. For example brain, digestive system.";

    property name="hasBioPolymerSequence" hint="A symbolic representation of a BioChemEntity. For example, a nucleotide sequence of a Gene or an amino acid sequence of a Protein.";


    variables[ "@type" ] = "Gene";

    variables._mappers[ "_abstract" ] = "abstract";

}
