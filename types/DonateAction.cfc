// --------------------------------------------------------
// AUTO-GENERATED: DonateAction.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.TransferAction" accessors="true" {

    property name="price" hint="The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.\n\nUsage guidelines:\n\n* Use the [[priceCurrency]] property (with standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR') instead of including [ambiguous symbols](http://en.wikipedia.org/wiki/Dollar_sign##Currencies_that_use_the_dollar_or_peso_sign) such as '$' in the value.\n* Use '.' (Unicode 'FULL STOP' (U+002E)) rather than ',' to indicate a decimal point. Avoid using these symbols as a readability separator.\n* Note that both [RDFa](http://www.w3.org/TR/xhtml-rdfa-primer/##using-the-content-attribute) and Microdata syntax allow the use of a 'content=' attribute for publishing simple machine-readable values alongside more human-friendly formatting.\n* Use values from 0123456789 (Unicode 'DIGIT ZERO' (U+0030) to 'DIGIT NINE' (U+0039)) rather than superficially similar Unicode symbols.
      ";

    property name="priceCurrency" hint="The currency of the price, or a price component when attached to [[PriceSpecification]] and its subtypes.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="priceSpecification" hint="One or more detailed price specifications, indicating the unit price and delivery or payment charges.";

    property name="recipient" hint="A sub property of participant. The participant who is at the receiving end of the action.";


    variables[ "@type" ] = "DonateAction";

    variables._mappers[ "_abstract" ] = "abstract";

}
