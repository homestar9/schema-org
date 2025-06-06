// --------------------------------------------------------
// AUTO-GENERATED: Permit.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="issuedBy" hint="The organization issuing the item, for example a [[Permit]], [[Ticket]], or [[Certification]].";

    property name="issuedThrough" hint="The service through which the permit was granted.";

    property name="permitAudience" hint="The target audience for this permit.";

    property name="validFor" hint="The duration of validity of a permit or similar thing.";

    property name="validFrom" hint="The date when the item becomes valid.";

    property name="validIn" hint="The geographic area where the item is valid. Applies for example to a [[Permit]], a [[Certification]], or an [[EducationalOccupationalCredential]]. ";

    property name="validUntil" hint="The date when the item is no longer valid.";


    variables[ "@type" ] = "Permit";

    variables._mappers[ "_abstract" ] = "abstract";

}
