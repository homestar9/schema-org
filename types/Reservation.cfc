// --------------------------------------------------------
// AUTO-GENERATED: Reservation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="bookingAgent" hint="'bookingAgent' is an out-dated term indicating a 'broker' that serves as a booking agent.";

    property name="bookingTime" hint="The date and time the reservation was booked.";

    property name="broker" hint="An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.";

    property name="modifiedTime" hint="The date and time the reservation was modified.";

    property name="priceCurrency" hint="The currency of the price, or a price component when attached to [[PriceSpecification]] and its subtypes.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="programMembershipUsed" hint="Any membership in a frequent flyer, hotel loyalty program, etc. being applied to the reservation.";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="reservationFor" hint="The thing -- flight, event, restaurant, etc. being reserved.";

    property name="reservationId" hint="A unique identifier for the reservation.";

    property name="reservationStatus" hint="The current status of the reservation.";

    property name="reservedTicket" hint="A ticket associated with the reservation.";

    property name="totalPrice" hint="The total price for the reservation or ticket, including applicable taxes, shipping, etc.\n\nUsage guidelines:\n\n* Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similar Unicode symbols.\n* Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.";

    property name="underName" hint="The person or organization the reservation or ticket is for.";


    variables[ "@type" ] = "Reservation";

    variables._mappers[ "_abstract" ] = "abstract";

}
