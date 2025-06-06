// --------------------------------------------------------
// AUTO-GENERATED: RepaymentSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="downPayment" hint="a type of payment made in cash during the onset of the purchase of an expensive good/service. The payment typically represents only a percentage of the full purchase price.";

    property name="earlyPrepaymentPenalty" hint="The amount to be paid as a penalty in the event of early payment of the loan.";

    property name="loanPaymentAmount" hint="The amount of money to pay in a single payment.";

    property name="loanPaymentFrequency" hint="Frequency of payments due, i.e. number of months between payments. This is defined as a frequency, i.e. the reciprocal of a period of time.";

    property name="numberOfLoanPayments" hint="The number of payments contractually required at origination to repay the loan. For monthly paying loans this is the number of months from the contractual first payment date to the maturity date.";


    variables[ "@type" ] = "RepaymentSpecification";

}
