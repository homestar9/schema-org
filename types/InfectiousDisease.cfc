// --------------------------------------------------------
// AUTO-GENERATED: InfectiousDisease.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalCondition" accessors="true" {

    property name="infectiousAgent" hint="The actual infectious agent, such as a specific bacterium.";

    property name="infectiousAgentClass" hint="The class of infectious agent (bacteria, prion, etc.) that causes the disease.";

    property name="transmissionMethod" hint="How the disease spreads, either as a route or vector, for example 'direct contact', 'Aedes aegypti', etc.";


    variables[ "@type" ] = "InfectiousDisease";

}
