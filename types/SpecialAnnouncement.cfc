// --------------------------------------------------------
// AUTO-GENERATED: SpecialAnnouncement.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="announcementLocation" hint="Indicates a specific [[CivicStructure]] or [[LocalBusiness]] associated with the SpecialAnnouncement. For example, a specific testing facility or business with special opening hours. For a larger geographic region like a quarantine of an entire region, use [[spatialCoverage]].";

    property name="category" hint="A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.";

    property name="datePosted" hint="Publication date of an online listing.";

    property name="diseasePreventionInfo" hint="Information about disease prevention.";

    property name="diseaseSpreadStatistics" hint="Statistical information about the spread of a disease, either as [[WebContent]], or
  described directly as a [[Dataset]], or the specific [[Observation]]s in the dataset. When a [[WebContent]] URL is
  provided, the page indicated might also contain more such markup.";

    property name="gettingTestedInfo" hint="Information about getting tested (for a [[MedicalCondition]]), e.g. in the context of a pandemic.";

    property name="governmentBenefitsInfo" hint="governmentBenefitsInfo provides information about government benefits associated with a SpecialAnnouncement.";

    property name="newsUpdatesAndGuidelines" hint="Indicates a page with news updates and guidelines. This could often be (but is not required to be) the main page containing [[SpecialAnnouncement]] markup on a site.";

    property name="publicTransportClosuresInfo" hint="Information about public transport closures.";

    property name="quarantineGuidelines" hint="Guidelines about quarantine rules, e.g. in the context of a pandemic.";

    property name="schoolClosuresInfo" hint="Information about school closures.";

    property name="travelBans" hint="Information about travel bans, e.g. in the context of a pandemic.";

    property name="webFeed" hint="The URL for a feed, e.g. associated with a podcast series, blog, or series of date-stamped updates. This is usually RSS or Atom.";


    variables[ "@type" ] = "SpecialAnnouncement";

}
