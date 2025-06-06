// --------------------------------------------------------
// AUTO-GENERATED: CookAction.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreateAction" accessors="true" {

    property name="foodEstablishment" hint="A sub property of location. The specific food establishment where the action occurred.";

    property name="foodEvent" hint="A sub property of location. The specific food event where the action occurred.";

    property name="recipe" hint="A sub property of instrument. The recipe/instructions used to perform the action.";


    variables[ "@type" ] = "CookAction";

    variables._mappers[ "_abstract" ] = "abstract";

}
