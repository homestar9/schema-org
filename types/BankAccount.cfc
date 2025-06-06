// --------------------------------------------------------
// AUTO-GENERATED: BankAccount.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.FinancialProduct" accessors="true" {

    property name="accountMinimumInflow" hint="A minimum amount that has to be paid in every month.";

    property name="accountOverdraftLimit" hint="An overdraft is an extension of credit from a lending institution when an account reaches zero. An overdraft allows the individual to continue withdrawing money even if the account has no funds in it. Basically the bank allows people to borrow a set amount of money.";

    property name="bankAccountType" hint="The type of a bank account.";


    variables[ "@type" ] = "BankAccount";

    variables._mappers[ "_abstract" ] = "abstract";

}
