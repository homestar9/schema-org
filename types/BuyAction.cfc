// --------------------------------------------------------
// AUTO-GENERATED: BuyAction.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.TradeAction" accessors="true" {

    property name="seller" hint="An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.";

    property name="vendor" hint="'vendor' is an earlier term for 'seller'.";

    property name="warrantyPromise" hint="The warranty promise(s) included in the offer.";


    variables[ "@type" ] = "BuyAction";

    variables._mappers[ "_abstract" ] = "abstract";

}
