// --------------------------------------------------------
// AUTO-GENERATED: Observation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="marginOfError" hint="A [[marginOfError]] for an [[Observation]].";

    property name="measuredProperty" hint="The measuredProperty of an [[Observation]], typically via its [[StatisticalVariable]]. There are various kinds of applicable [[Property]]: a schema.org property, a property from other RDF-compatible systems, e.g. W3C RDF Data Cube, Data Commons, Wikidata, or schema.org extensions such as [GS1's](https://www.gs1.org/voc/?show=properties).";

    property name="measurementDenominator" hint="Identifies the denominator variable when an observation represents a ratio or percentage.";

    property name="measurementMethod" hint="A subproperty of [[measurementTechnique]] that can be used for specifying specific methods, in particular via [[MeasurementMethodEnum]].";

    property name="measurementQualifier" hint="Provides additional qualification to an observation. For example, a GDP observation measures the Nominal value.";

    property name="measurementTechnique" hint="A technique, method or technology used in an [[Observation]], [[StatisticalVariable]] or [[Dataset]] (or [[DataDownload]], [[DataCatalog]]), corresponding to the method used for measuring the corresponding variable(s) (for datasets, described using [[variableMeasured]]; for [[Observation]], a [[StatisticalVariable]]). Often but not necessarily each [[variableMeasured]] will have an explicit representation as (or mapping to) an property such as those defined in Schema.org, or other RDF vocabularies and 'knowledge graphs'. In that case the subproperty of [[variableMeasured]] called [[measuredProperty]] is applicable.
    
The [[measurementTechnique]] property helps when extra clarification is needed about how a [[measuredProperty]] was measured. This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but can often serve as a high level summary for dataset discovery. 

For example, if [[variableMeasured]] is: molecule concentration, [[measurementTechnique]] could be: 'mass spectrometry' or 'nmr spectroscopy' or 'colorimetry' or 'immunofluorescence'. If the [[variableMeasured]] is 'depression rating', the [[measurementTechnique]] could be 'Zung Scale' or 'HAM-D' or 'Beck Depression Inventory'. 

If there are several [[variableMeasured]] properties recorded for some given data object, use a [[PropertyValue]] for each [[variableMeasured]] and attach the corresponding [[measurementTechnique]]. The value can also be from an enumeration, organized as a [[MeasurementMetholdEnumeration]].";

    property name="observationAbout" hint="The [[observationAbout]] property identifies an entity, often a [[Place]], associated with an [[Observation]].";

    property name="observationDate" hint="The observationDate of an [[Observation]].";

    property name="observationPeriod" hint="The length of time an Observation took place over. The format follows `P[0-9]*[Y|M|D|h|m|s]`. For example, P1Y is Period 1 Year, P3M is Period 3 Months, P3h is Period 3 hours.";

    property name="variableMeasured" hint="The variableMeasured property can indicate (repeated as necessary) the  variables that are measured in some dataset, either described as text or as pairs of identifier and description using PropertyValue, or more explicitly as a [[StatisticalVariable]].";


    variables[ "@type" ] = "Observation";

    variables._mappers[ "_abstract" ] = "abstract";

}
