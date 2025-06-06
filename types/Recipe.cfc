// --------------------------------------------------------
// AUTO-GENERATED: Recipe.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.HowTo" accessors="true" {

    property name="cookingMethod" hint="The method of cooking, such as Frying, Steaming, ...";

    property name="cookTime" hint="The time it takes to actually cook the dish, in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="ingredients" hint="A single ingredient used in the recipe, e.g. sugar, flour or garlic.";

    property name="nutrition" hint="Nutrition information about the recipe or menu item.";

    property name="recipeCategory" hint="The category of the recipe—for example, appetizer, entree, etc.";

    property name="recipeCuisine" hint="The cuisine of the recipe (for example, French or Ethiopian).";

    property name="recipeIngredient" hint="A single ingredient used in the recipe, e.g. sugar, flour or garlic.";

    property name="recipeInstructions" hint="A step in making the recipe, in the form of a single item (document, video, etc.) or an ordered list with HowToStep and/or HowToSection items.";

    property name="recipeYield" hint="The quantity produced by the recipe (for example, number of people served, number of servings, etc).";

    property name="suitableForDiet" hint="Indicates a dietary restriction or guideline for which this recipe or menu item is suitable, e.g. diabetic, halal etc.";


    variables[ "@type" ] = "Recipe";

    variables._mappers[ "_abstract" ] = "abstract";

}
