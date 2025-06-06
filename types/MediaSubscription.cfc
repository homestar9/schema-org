// --------------------------------------------------------
// AUTO-GENERATED: MediaSubscription.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="authenticator" hint="The Organization responsible for authenticating the user's subscription. For example, many media apps require a cable/satellite provider to authenticate your subscription before playing media.";

    property name="expectsAcceptanceOf" hint="An Offer which must be accepted before the user can perform the Action. For example, the user may need to buy a movie before being able to watch it.";


    variables[ "@type" ] = "MediaSubscription";

    variables._mappers[ "_abstract" ] = "abstract";

}
