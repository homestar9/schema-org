// --------------------------------------------------------
// AUTO-GENERATED: Person.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="additionalName" hint="An additional name for a Person, can be used for a middle name.";

    property name="address" hint="Physical address of the item.";

    property name="affiliation" hint="An organization that this person is affiliated with. For example, a school/university, a club, or a team.";

    property name="agentInteractionStatistic" hint="The number of completed interactions for this entity, in a particular role (the 'agent'), in a particular action (indicated in the statistic), and in a particular context (i.e. interactionService).";

    property name="alumniOf" hint="An organization that the person is an alumni of.";

    property name="award" hint="An award won by or for this item.";

    property name="awards" hint="Awards won by or for this item.";

    property name="birthDate" hint="Date of birth.";

    property name="birthPlace" hint="The place where the person was born.";

    property name="brand" hint="The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.";

    property name="callSign" hint="A [callsign](https://en.wikipedia.org/wiki/Call_sign), as used in broadcasting and radio communications to identify people, radio and TV stations, or vehicles.";

    property name="children" hint="A child of the person.";

    property name="colleague" hint="A colleague of the person.";

    property name="colleagues" hint="A colleague of the person.";

    property name="contactPoint" hint="A contact point for a person or organization.";

    property name="contactPoints" hint="A contact point for a person or organization.";

    property name="deathDate" hint="Date of death.";

    property name="deathPlace" hint="The place where the person died.";

    property name="duns" hint="The Dun & Bradstreet DUNS number for identifying an organization or business person.";

    property name="email" hint="Email address.";

    property name="familyName" hint="Family name. In the U.S., the last name of a Person.";

    property name="faxNumber" hint="The fax number.";

    property name="follows" hint="The most generic uni-directional social relation.";

    property name="funder" hint="A person or organization that supports (sponsors) something through some kind of financial contribution.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="gender" hint="Gender of something, typically a [[Person]], but possibly also fictional characters, animals, etc. While https://schema.org/Male and https://schema.org/Female may be used, text strings are also acceptable for people who are not a binary gender. The [[gender]] property can also be used in an extended sense to cover e.g. the gender of sports teams. As with the gender of individuals, we do not try to enumerate all possibilities. A mixed-gender [[SportsTeam]] can be indicated with a text value of 'Mixed'.";

    property name="givenName" hint="Given name. In the U.S., the first name of a Person.";

    property name="globalLocationNumber" hint="The [Global Location Number](http://www.gs1.org/gln) (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.";

    property name="hasCertification" hint="Certification information about a product, organization, service, place, or person.";

    property name="hasCredential" hint="A credential awarded to the Person or Organization.";

    property name="hasOccupation" hint="The Person's occupation. For past professions, use Role for expressing dates.";

    property name="hasOfferCatalog" hint="Indicates an OfferCatalog listing for this Organization, Person, or Service.";

    property name="hasPOS" hint="Points-of-Sales operated by the organization or person.";

    property name="height" hint="The height of the item.";

    property name="homeLocation" hint="A contact location for a person's residence.";

    property name="honorificPrefix" hint="An honorific prefix preceding a Person's name such as Dr/Mrs/Mr.";

    property name="honorificSuffix" hint="An honorific suffix following a Person's name such as M.D./PhD/MSCSW.";

    property name="interactionStatistic" hint="The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.";

    property name="isicV4" hint="The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.";

    property name="jobTitle" hint="The job title of the person (for example, Financial Manager).";

    property name="knows" hint="The most generic bi-directional social/work relation.";

    property name="knowsAbout" hint="Of a [[Person]], and less typically of an [[Organization]], to indicate a topic that is known about - suggesting possible expertise but not implying it. We do not distinguish skill levels here, or relate this to educational content, events, objectives or [[JobPosting]] descriptions.";

    property name="knowsLanguage" hint="Of a [[Person]], and less typically of an [[Organization]], to indicate a known language. We do not distinguish skill levels or reading/writing/speaking/signing here. Use language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47).";

    property name="makesOffer" hint="A pointer to products or services offered by the organization or person.";

    property name="memberOf" hint="An Organization (or ProgramMembership) to which this Person or Organization belongs.";

    property name="naics" hint="The North American Industry Classification System (NAICS) code for a particular organization or business person.";

    property name="nationality" hint="Nationality of the person.";

    property name="netWorth" hint="The total financial value of the person as calculated by subtracting the total value of liabilities from the total value of assets.";

    property name="owns" hint="Products owned by the organization or person.";

    property name="parent" hint="A parent of this person.";

    property name="parents" hint="A parents of the person.";

    property name="performerIn" hint="Event that this person is a performer or participant in.";

    property name="pronouns" hint="A short string listing or describing pronouns for a person. Typically the person concerned is the best authority as pronouns are a critical part of personal identity and expression. Publishers and consumers of this information are reminded to treat this data responsibly, take country-specific laws related to gender expression into account, and be wary of out-of-date data and drawing unwarranted inferences about the person being described.

In English, formulations such as 'they/them', 'she/her', and 'he/him' are commonly used online and can also be used here. We do not intend to enumerate all possible micro-syntaxes in all languages. More structured and well-defined external values for pronouns can be referenced using the [[StructuredValue]] or [[DefinedTerm]] values.
";

    property name="publishingPrinciples" hint="The publishingPrinciples property indicates (typically via [[URL]]) a document describing the editorial principles of an [[Organization]] (or individual, e.g. a [[Person]] writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a [[CreativeWork]] (e.g. [[NewsArticle]]) the principles are those of the party primarily responsible for the creation of the [[CreativeWork]].

While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a [[funder]]) can be expressed using schema.org terminology.
";

    property name="relatedTo" hint="The most generic familial relation.";

    property name="seeks" hint="A pointer to products or services sought by the organization or person (demand).";

    property name="sibling" hint="A sibling of the person.";

    property name="siblings" hint="A sibling of the person.";

    property name="skills" hint="A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is either claimed by a person, an organization or desired or required to fulfill a role or to work in an occupation.";

    property name="sponsor" hint="A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.";

    property name="spouse" hint="The person's spouse.";

    property name="taxID" hint="The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.";

    property name="telephone" hint="The telephone number.";

    property name="vatID" hint="The Value-added Tax ID of the organization or person.";

    property name="weight" hint="The weight of the product or person.";

    property name="workLocation" hint="A contact location for a person's place of work.";

    property name="worksFor" hint="Organizations that the person works for.";


    variables[ "@type" ] = "Person";

}
