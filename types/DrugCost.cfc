// --------------------------------------------------------
// AUTO-GENERATED: DrugCost.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalEntity" accessors="true" {

    property name="applicableLocation" hint="The location in which the status applies.";

    property name="costCategory" hint="The category of cost, such as wholesale, retail, reimbursement cap, etc.";

    property name="costCurrency" hint="The currency (in 3-letter) of the drug cost. See: http://en.wikipedia.org/wiki/ISO_4217. ";

    property name="costOrigin" hint="Additional details to capture the origin of the cost data. For example, 'Medicare Part B'.";

    property name="costPerUnit" hint="The cost per unit of the drug.";

    property name="drugUnit" hint="The unit in which the drug is measured, e.g. '5 mg tablet'.";


    variables[ "@type" ] = "DrugCost";

}
