// --------------------------------------------------------
// AUTO-GENERATED: Organization.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="acceptedPaymentMethod" hint="The payment method(s) that are accepted in general by an organization, or for some specific demand or offer.";

    property name="actionableFeedbackPolicy" hint="For a [[NewsMediaOrganization]] or other news-related [[Organization]], a statement about public engagement activities (for news media, the newsroom’s), including involving the public - digitally or otherwise -- in coverage decisions, reporting and activities after publication.";

    property name="address" hint="Physical address of the item.";

    property name="agentInteractionStatistic" hint="The number of completed interactions for this entity, in a particular role (the 'agent'), in a particular action (indicated in the statistic), and in a particular context (i.e. interactionService).";

    property name="aggregateRating" hint="The overall rating, based on a collection of reviews or ratings, of the item.";

    property name="alumni" hint="Alumni of an organization.";

    property name="areaServed" hint="The geographic area where a service or offered item is provided.";

    property name="award" hint="An award won by or for this item.";

    property name="awards" hint="Awards won by or for this item.";

    property name="brand" hint="The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.";

    property name="companyRegistration" hint="The official registration number of a business including the organization that issued it such as Company House or Chamber of Commerce.";

    property name="contactPoint" hint="A contact point for a person or organization.";

    property name="contactPoints" hint="A contact point for a person or organization.";

    property name="correctionsPolicy" hint="For an [[Organization]] (e.g. [[NewsMediaOrganization]]), a statement describing (in news media, the newsroom’s) disclosure and correction policy for errors.";

    property name="department" hint="A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.";

    property name="dissolutionDate" hint="The date that this organization was dissolved.";

    property name="diversityPolicy" hint="Statement on diversity policy by an [[Organization]] e.g. a [[NewsMediaOrganization]]. For a [[NewsMediaOrganization]], a statement describing the newsroom’s diversity policy on both staffing and sources, typically providing staffing data.";

    property name="diversityStaffingReport" hint="For an [[Organization]] (often but not necessarily a [[NewsMediaOrganization]]), a report on staffing diversity issues. In a news context this might be for example ASNE or RTDNA (US) reports, or self-reported.";

    property name="duns" hint="The Dun & Bradstreet DUNS number for identifying an organization or business person.";

    property name="email" hint="Email address.";

    property name="employee" hint="Someone working for this organization.";

    property name="employees" hint="People working for this organization.";

    property name="ethicsPolicy" hint="Statement about ethics policy, e.g. of a [[NewsMediaOrganization]] regarding journalistic and publishing practices, or of a [[Restaurant]], a page describing food source policies. In the case of a [[NewsMediaOrganization]], an ethicsPolicy is typically a statement describing the personal, organizational, and corporate standards of behavior expected by the organization.";

    property name="event" hint="Upcoming or past event associated with this place, organization, or action.";

    property name="events" hint="Upcoming or past events associated with this place or organization.";

    property name="faxNumber" hint="The fax number.";

    property name="founder" hint="A person or organization who founded this organization.";

    property name="founders" hint="A person who founded this organization.";

    property name="foundingDate" hint="The date that this organization was founded.";

    property name="foundingLocation" hint="The place where the Organization was founded.";

    property name="funder" hint="A person or organization that supports (sponsors) something through some kind of financial contribution.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="globalLocationNumber" hint="The [Global Location Number](http://www.gs1.org/gln) (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.";

    property name="hasCertification" hint="Certification information about a product, organization, service, place, or person.";

    property name="hasCredential" hint="A credential awarded to the Person or Organization.";

    property name="hasGS1DigitalLink" hint="The <a href='https://www.gs1.org/standards/gs1-digital-link'>GS1 digital link</a> associated with the object. This URL should conform to the particular requirements of digital links. The link should only contain the Application Identifiers (AIs) that are relevant for the entity being annotated, for instance a [[Product]] or an [[Organization]], and for the correct granularity. In particular, for products:<ul><li>A Digital Link that contains a serial number (AI <code>21</code>) should only be present on instances of [[IndividualProduct]]</li><li>A Digital Link that contains a lot number (AI <code>10</code>) should be annotated as [[SomeProduct]] if only products from that lot are sold, or [[IndividualProduct]] if there is only a specific product.</li><li>A Digital Link that contains a global model number (AI <code>8013</code>)  should be attached to a [[Product]] or a [[ProductModel]].</li></ul> Other item types should be adapted similarly.";

    property name="hasMemberProgram" hint="MemberProgram offered by an Organization, for example an eCommerce merchant or an airline.";

    property name="hasMerchantReturnPolicy" hint="Specifies a MerchantReturnPolicy that may be applicable.";

    property name="hasOfferCatalog" hint="Indicates an OfferCatalog listing for this Organization, Person, or Service.";

    property name="hasPOS" hint="Points-of-Sales operated by the organization or person.";

    property name="hasProductReturnPolicy" hint="Indicates a ProductReturnPolicy that may be applicable.";

    property name="hasShippingService" hint="Specification of a shipping service offered by the organization.";

    property name="interactionStatistic" hint="The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.";

    property name="isicV4" hint="The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.";

    property name="iso6523Code" hint="An organization identifier as defined in [ISO 6523(-1)](https://en.wikipedia.org/wiki/ISO/IEC_6523). The identifier should be in the `XXXX:YYYYYY:ZZZ` or `XXXX:YYYYYY`format. Where `XXXX` is a 4 digit _ICD_ (International Code Designator), `YYYYYY` is an _OID_ (Organization Identifier) with all formatting characters (dots, dashes, spaces) removed with a maximal length of 35 characters, and `ZZZ` is an optional OPI (Organization Part Identifier) with a maximum length of 35 characters. The various components (ICD, OID, OPI) are joined with a colon character (ASCII `0x3a`). Note that many existing organization identifiers defined as attributes like [leiCode](https://schema.org/leiCode) (`0199`), [duns](https://schema.org/duns) (`0060`) or [GLN](https://schema.org/globalLocationNumber) (`0088`) can be expressed using ISO-6523. If possible, ISO-6523 codes should be preferred to populating [vatID](https://schema.org/vatID) or [taxID](https://schema.org/taxID), as ISO identifiers are less ambiguous.";

    property name="keywords" hint="Keywords or tags used to describe some item. Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property.";

    property name="knowsAbout" hint="Of a [[Person]], and less typically of an [[Organization]], to indicate a topic that is known about - suggesting possible expertise but not implying it. We do not distinguish skill levels here, or relate this to educational content, events, objectives or [[JobPosting]] descriptions.";

    property name="knowsLanguage" hint="Of a [[Person]], and less typically of an [[Organization]], to indicate a known language. We do not distinguish skill levels or reading/writing/speaking/signing here. Use language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47).";

    property name="legalAddress" hint="The legal address of an organization which acts as the officially registered address used for legal and tax purposes. The legal address can be different from the place of operations of a business and other addresses can be part of an organization.";

    property name="legalName" hint="The official name of the organization, e.g. the registered company name.";

    property name="legalRepresentative" hint="One or multiple persons who represent this organization legally such as CEO or sole administrator.";

    property name="leiCode" hint="An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.";

    property name="location" hint="The location of, for example, where an event is happening, where an organization is located, or where an action takes place.";

    property name="logo" hint="An associated logo.";

    property name="makesOffer" hint="A pointer to products or services offered by the organization or person.";

    property name="member" hint="A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.";

    property name="memberOf" hint="An Organization (or ProgramMembership) to which this Person or Organization belongs.";

    property name="members" hint="A member of this organization.";

    property name="naics" hint="The North American Industry Classification System (NAICS) code for a particular organization or business person.";

    property name="nonprofitStatus" hint="nonprofitStatus indicates the legal status of a non-profit organization in its primary place of business.";

    property name="numberOfEmployees" hint="The number of employees in an organization, e.g. business.";

    property name="ownershipFundingInfo" hint="For an [[Organization]] (often but not necessarily a [[NewsMediaOrganization]]), a description of organizational ownership structure; funding and grants. In a news/media setting, this is with particular reference to editorial independence.   Note that the [[funder]] is also available and can be used to make basic funder information machine-readable.";

    property name="owns" hint="Products owned by the organization or person.";

    property name="parentOrganization" hint="The larger organization that this organization is a [[subOrganization]] of, if any.";

    property name="publishingPrinciples" hint="The publishingPrinciples property indicates (typically via [[URL]]) a document describing the editorial principles of an [[Organization]] (or individual, e.g. a [[Person]] writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a [[CreativeWork]] (e.g. [[NewsArticle]]) the principles are those of the party primarily responsible for the creation of the [[CreativeWork]].

While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a [[funder]]) can be expressed using schema.org terminology.
";

    property name="review" hint="A review of the item.";

    property name="reviews" hint="Review of the item.";

    property name="seeks" hint="A pointer to products or services sought by the organization or person (demand).";

    property name="serviceArea" hint="The geographic area where the service is provided.";

    property name="skills" hint="A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is either claimed by a person, an organization or desired or required to fulfill a role or to work in an occupation.";

    property name="slogan" hint="A slogan or motto associated with the item.";

    property name="sponsor" hint="A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.";

    property name="subOrganization" hint="A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific 'department' property.";

    property name="taxID" hint="The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.";

    property name="telephone" hint="The telephone number.";

    property name="unnamedSourcesPolicy" hint="For an [[Organization]] (typically a [[NewsMediaOrganization]]), a statement about policy on use of unnamed sources and the decision process required.";

    property name="vatID" hint="The Value-added Tax ID of the organization or person.";


    variables[ "@type" ] = "Organization";

}
