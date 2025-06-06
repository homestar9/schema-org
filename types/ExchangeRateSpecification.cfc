// --------------------------------------------------------
// AUTO-GENERATED: ExchangeRateSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="currency" hint="The currency in which the monetary amount is expressed.\n\nUse standard formats: [ISO 4217 currency format](http://en.wikipedia.org/wiki/ISO_4217), e.g. 'USD'; [Ticker symbol](https://en.wikipedia.org/wiki/List_of_cryptocurrencies) for cryptocurrencies, e.g. 'BTC'; well known names for [Local Exchange Trading Systems](https://en.wikipedia.org/wiki/Local_exchange_trading_system) (LETS) and other currency types, e.g. 'Ithaca HOUR'.";

    property name="currentExchangeRate" hint="The current price of a currency.";

    property name="exchangeRateSpread" hint="The difference between the price at which a broker or other intermediary buys and sells foreign currency.";


    variables[ "@type" ] = "ExchangeRateSpecification";

    variables._mappers[ "_abstract" ] = "abstract";

}
