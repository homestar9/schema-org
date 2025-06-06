// --------------------------------------------------------
// AUTO-GENERATED: DoseSchedule.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalIntangible" accessors="true" {

    property name="doseUnit" hint="The unit of the dose, e.g. 'mg'.";

    property name="doseValue" hint="The value of the dose, e.g. 500.";

    property name="frequency" hint="How often the dose is taken, e.g. 'daily'.";

    property name="targetPopulation" hint="Characteristics of the population for which this is intended, or which typically uses it, e.g. 'adults'.";


    variables[ "@type" ] = "DoseSchedule";

    variables._mappers[ "_abstract" ] = "abstract";

}
