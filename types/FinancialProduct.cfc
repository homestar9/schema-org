// --------------------------------------------------------
// AUTO-GENERATED: FinancialProduct.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Service" accessors="true" {

    property name="annualPercentageRate" hint="The annual rate that is charged for borrowing (or made by investing), expressed as a single percentage number that represents the actual yearly cost of funds over the term of a loan. This includes any fees or additional costs associated with the transaction.";

    property name="feesAndCommissionsSpecification" hint="Description of fees, commissions, and other terms applied either to a class of financial product, or by a financial service organization.";

    property name="interestRate" hint="The interest rate, charged or paid, applicable to the financial product. Note: This is different from the calculated annualPercentageRate.";


    variables[ "@type" ] = "FinancialProduct";

    variables._mappers[ "_abstract" ] = "abstract";

}
