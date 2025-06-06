// --------------------------------------------------------
// AUTO-GENERATED: SportsTeam.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.SportsOrganization" accessors="true" {

    property name="athlete" hint="A person that acts as performing member of a sports team; a player as opposed to a coach.";

    property name="coach" hint="A person that acts in a coaching role for a sports team.";

    property name="gender" hint="Gender of something, typically a [[Person]], but possibly also fictional characters, animals, etc. While https://schema.org/Male and https://schema.org/Female may be used, text strings are also acceptable for people who are not a binary gender. The [[gender]] property can also be used in an extended sense to cover e.g. the gender of sports teams. As with the gender of individuals, we do not try to enumerate all possibilities. A mixed-gender [[SportsTeam]] can be indicated with a text value of 'Mixed'.";


    variables[ "@type" ] = "SportsTeam";

    variables._mappers[ "_abstract" ] = "abstract";

}
