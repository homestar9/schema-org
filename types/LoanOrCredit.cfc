// --------------------------------------------------------
// AUTO-GENERATED: LoanOrCredit.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.FinancialProduct" accessors="true" {

    property name="amount" hint="The amount of money.";

    property name="currency" hint="The currency in which the monetary amount is expressed.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="gracePeriod" hint="The period of time after any due date that the borrower has to fulfil its obligations before a default (failure to pay) is deemed to have occurred.";

    property name="loanRepaymentForm" hint="A form of paying back money previously borrowed from a lender. Repayment usually takes the form of periodic payments that normally include part principal plus interest in each payment.";

    property name="loanTerm" hint="The duration of the loan or credit agreement.";

    property name="loanType" hint="The type of a loan or credit.";

    property name="recourseLoan" hint="The only way you get the money back in the event of default is the security. Recourse is where you still have the opportunity to go back to the borrower for the rest of the money.";

    property name="renegotiableLoan" hint="Whether the terms for payment of interest can be renegotiated during the life of the loan.";

    property name="requiredCollateral" hint="Assets required to secure loan or credit repayments. It may take form of third party pledge, goods, financial instruments (cash, securities, etc.)";


    variables[ "@type" ] = "LoanOrCredit";

    variables._mappers[ "_abstract" ] = "abstract";

}
