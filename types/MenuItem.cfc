// --------------------------------------------------------
// AUTO-GENERATED: MenuItem.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="menuAddOn" hint="Additional menu item(s) such as a side dish of salad or side order of fries that can be added to this menu item. Additionally it can be a menu section containing allowed add-on menu items for this menu item.";

    property name="nutrition" hint="Nutrition information about the recipe or menu item.";

    property name="offers" hint="An offer to provide this item&##x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.
      ";

    property name="suitableForDiet" hint="Indicates a dietary restriction or guideline for which this recipe or menu item is suitable, e.g. diabetic, halal etc.";


    variables[ "@type" ] = "MenuItem";

    variables._mappers[ "_abstract" ] = "abstract";

}
