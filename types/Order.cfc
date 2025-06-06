// --------------------------------------------------------
// AUTO-GENERATED: Order.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="acceptedOffer" hint="The offer(s) -- e.g., product, quantity and price combinations -- included in the order.";

    property name="billingAddress" hint="The billing address for the order.";

    property name="broker" hint="An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.";

    property name="confirmationNumber" hint="A number that confirms the given order or payment has been received.";

    property name="customer" hint="Party placing the order or paying the invoice.";

    property name="discount" hint="Any discount applied (to an Order).";

    property name="discountCode" hint="Code used to redeem a discount.";

    property name="discountCurrency" hint="The currency of the discount.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="isGift" hint="Indicates whether the offer was accepted as a gift for someone other than the buyer.";

    property name="merchant" hint="'merchant' is an out-dated term for 'seller'.";

    property name="orderDate" hint="Date order was placed.";

    property name="orderDelivery" hint="The delivery of the parcel related to this order or order item.";

    property name="orderedItem" hint="The item ordered.";

    property name="orderNumber" hint="The identifier of the transaction.";

    property name="orderStatus" hint="The current status of the order.";

    property name="partOfInvoice" hint="The order is being paid as part of the referenced Invoice.";

    property name="paymentDue" hint="The date that payment is due.";

    property name="paymentDueDate" hint="The date that payment is due.";

    property name="paymentMethod" hint="The name of the credit card or other method of payment for the order.";

    property name="paymentMethodId" hint="An identifier for the method of payment used (e.g. the last 4 digits of the credit card).";

    property name="paymentUrl" hint="The URL for sending a payment.";

    property name="seller" hint="An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.";


    variables[ "@type" ] = "Order";

}
