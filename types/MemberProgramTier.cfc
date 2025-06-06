// --------------------------------------------------------
// AUTO-GENERATED: MemberProgramTier.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="hasTierBenefit" hint="A member benefit for a particular tier of a loyalty program.";

    property name="hasTierRequirement" hint="A requirement for a user to join a membership tier, for example: a CreditCard if the tier requires sign up for a credit card, A UnitPriceSpecification if the user is required to pay a (periodic) fee, or a MonetaryAmount if the user needs to spend a minimum amount to join the tier. If a tier is free to join then this property does not need to be specified.";

    property name="isTierOf" hint="The member program this tier is a part of.";

    property name="membershipPointsEarned" hint="The number of membership points earned by the member. If necessary, the unitText can be used to express the units the points are issued in. (E.g. stars, miles, etc.)";


    variables[ "@type" ] = "MemberProgramTier";

}
