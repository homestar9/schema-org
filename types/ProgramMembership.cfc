// --------------------------------------------------------
// AUTO-GENERATED: ProgramMembership.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="hostingOrganization" hint="The Organization (airline, travelers' club, retailer, etc.) the membership is made with or which offers the  MemberProgram.";

    property name="member" hint="A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.";

    property name="members" hint="A member of this organization.";

    property name="membershipNumber" hint="A unique identifier for the membership.";

    property name="membershipPointsEarned" hint="The number of membership points earned by the member. If necessary, the unitText can be used to express the units the points are issued in. (E.g. stars, miles, etc.)";

    property name="program" hint="The [MemberProgram](https://schema.org/MemberProgram) associated with a [ProgramMembership](https://schema.org/ProgramMembership).";

    property name="programName" hint="The program providing the membership. It is preferable to use [:program](https://schema.org/program) instead.";


    variables[ "@type" ] = "ProgramMembership";

    variables._mappers[ "_abstract" ] = "abstract";

}
