// --------------------------------------------------------
// AUTO-GENERATED: EnergyConsumptionDetails.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="energyEfficiencyScaleMax" hint="Specifies the most energy efficient class on the regulated EU energy consumption scale for the product category a product belongs to. For example, energy consumption for televisions placed on the market after January 1, 2020 is scaled from D to A+++.";

    property name="energyEfficiencyScaleMin" hint="Specifies the least energy efficient class on the regulated EU energy consumption scale for the product category a product belongs to. For example, energy consumption for televisions placed on the market after January 1, 2020 is scaled from D to A+++.";

    property name="hasEnergyEfficiencyCategory" hint="Defines the energy efficiency Category (which could be either a rating out of range of values or a yes/no certification) for a product according to an international energy efficiency standard.";


    variables[ "@type" ] = "EnergyConsumptionDetails";

    variables._mappers[ "_abstract" ] = "abstract";

}
