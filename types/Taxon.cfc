// --------------------------------------------------------
// AUTO-GENERATED: Taxon.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="childTaxon" hint="Closest child taxa of the taxon in question.";

    property name="hasDefinedTerm" hint="A Defined Term contained in this term set.";

    property name="parentTaxon" hint="Closest parent taxon of the taxon in question.";

    property name="taxonRank" hint="The taxonomic rank of this taxon given preferably as a URI from a controlled vocabulary – typically the ranks from TDWG TaxonRank ontology or equivalent Wikidata URIs.";


    variables[ "@type" ] = "Taxon";

    variables._mappers[ "_abstract" ] = "abstract";

}
