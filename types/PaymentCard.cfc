// --------------------------------------------------------
// AUTO-GENERATED: PaymentCard.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PaymentMethod" accessors="true" {

    property name="cashBack" hint="A cardholder benefit that pays the cardholder a small percentage of their net expenditures.";

    property name="contactlessPayment" hint="A secure method for consumers to purchase products or services via debit, credit or smartcards by using RFID or NFC technology.";

    property name="floorLimit" hint="A floor limit is the amount of money above which credit card transactions must be authorized.";

    property name="monthlyMinimumRepaymentAmount" hint="The minimum payment is the lowest amount of money that one is required to pay on a credit card statement each month.";


    variables[ "@type" ] = "PaymentCard";

    variables._mappers[ "_abstract" ] = "abstract";

}
