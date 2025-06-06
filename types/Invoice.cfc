// --------------------------------------------------------
// AUTO-GENERATED: Invoice.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="accountId" hint="The identifier for the account the payment will be applied to.";

    property name="billingPeriod" hint="The time interval used to compute the invoice.";

    property name="broker" hint="An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.";

    property name="category" hint="A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.";

    property name="confirmationNumber" hint="A number that confirms the given order or payment has been received.";

    property name="customer" hint="Party placing the order or paying the invoice.";

    property name="minimumPaymentDue" hint="The minimum payment required at this time.";

    property name="paymentDue" hint="The date that payment is due.";

    property name="paymentDueDate" hint="The date that payment is due.";

    property name="paymentMethod" hint="The name of the credit card or other method of payment for the order.";

    property name="paymentMethodId" hint="An identifier for the method of payment used (e.g. the last 4 digits of the credit card).";

    property name="paymentStatus" hint="The status of payment; whether the invoice has been paid or not.";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="referencesOrder" hint="The Order(s) related to this Invoice. One or more Orders may be combined into a single Invoice.";

    property name="scheduledPaymentDate" hint="The date the invoice is scheduled to be paid.";

    property name="totalPaymentDue" hint="The total amount due.";


    variables[ "@type" ] = "Invoice";

    variables._mappers[ "_abstract" ] = "abstract";

}
