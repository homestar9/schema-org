// --------------------------------------------------------
// AUTO-GENERATED: Vein.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Vessel" accessors="true" {

    property name="drainsTo" hint="The vasculature that the vein drains into.";

    property name="regionDrained" hint="The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.";

    property name="tributary" hint="The anatomical or organ system that the vein flows into; a larger structure that the vein connects to.";


    variables[ "@type" ] = "Vein";

    variables._mappers[ "_abstract" ] = "abstract";

}
