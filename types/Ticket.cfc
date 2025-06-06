// --------------------------------------------------------
// AUTO-GENERATED: Ticket.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="dateIssued" hint="The date the ticket was issued.";

    property name="issuedBy" hint="The organization issuing the item, for example a [[Permit]], [[Ticket]], or [[Certification]].";

    property name="priceCurrency" hint="The currency of the price, or a price component when attached to [[PriceSpecification]] and its subtypes.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="ticketedSeat" hint="The seat associated with the ticket.";

    property name="ticketNumber" hint="The unique identifier for the ticket.";

    property name="ticketToken" hint="Reference to an asset (e.g., Barcode, QR code image or PDF) usable for entrance.";

    property name="totalPrice" hint="The total price for the reservation or ticket, including applicable taxes, shipping, etc.\n\nUsage guidelines:\n\n* Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similar Unicode symbols.\n* Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.";

    property name="underName" hint="The person or organization the reservation or ticket is for.";


    variables[ "@type" ] = "Ticket";

}
