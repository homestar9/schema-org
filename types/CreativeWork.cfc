// --------------------------------------------------------
// AUTO-GENERATED: CreativeWork.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="about" hint="The subject matter of the content.";

    property name="_abstract" hint="An abstract is a short description that summarizes a [[CreativeWork]].";

    property name="accessibilityAPI" hint="Indicates that the resource is compatible with the referenced accessibility API. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/##accessibilityAPI-vocabulary).";

    property name="accessibilityControl" hint="Identifies input methods that are sufficient to fully control the described resource. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/##accessibilityControl-vocabulary).";

    property name="accessibilityFeature" hint="Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/##accessibilityFeature-vocabulary).";

    property name="accessibilityHazard" hint="A characteristic of the described resource that is physiologically dangerous to some users. Related to WCAG 2.0 guideline 2.3. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/##accessibilityHazard-vocabulary).";

    property name="accessibilitySummary" hint="A human-readable summary of specific accessibility features or deficiencies, consistent with the other accessibility metadata but expressing subtleties such as 'short descriptions are present but long descriptions will be needed for non-visual users' or 'short descriptions are present and no long descriptions are needed'.";

    property name="accessMode" hint="The human sensory perceptual system or cognitive faculty through which a person may process or perceive information. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/##accessMode-vocabulary).";

    property name="accessModeSufficient" hint="A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource. Values should be drawn from the [approved vocabulary](https://www.w3.org/2021/a11y-discov-vocab/latest/##accessModeSufficient-vocabulary).";

    property name="accountablePerson" hint="Specifies the Person that is legally accountable for the CreativeWork.";

    property name="acquireLicensePage" hint="Indicates a page documenting how licenses can be purchased or otherwise acquired, for the current item.";

    property name="aggregateRating" hint="The overall rating, based on a collection of reviews or ratings, of the item.";

    property name="alternativeHeadline" hint="A secondary title of the CreativeWork.";

    property name="archivedAt" hint="Indicates a page or other link involved in archival of a [[CreativeWork]]. In the case of [[MediaReview]], the items in a [[MediaReviewItem]] may often become inaccessible, but be archived by archival, journalistic, activist, or law enforcement organizations. In such cases, the referenced page may not directly publish the content.";

    property name="assesses" hint="The item being described is intended to assess the competency or learning outcome defined by the referenced term.";

    property name="associatedMedia" hint="A media object that encodes this CreativeWork. This property is a synonym for encoding.";

    property name="audience" hint="An intended audience, i.e. a group for whom something was created.";

    property name="audio" hint="An embedded audio object.";

    property name="author" hint="The author of this content or rating. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.";

    property name="award" hint="An award won by or for this item.";

    property name="awards" hint="Awards won by or for this item.";

    property name="character" hint="Fictional person connected with a creative work.";

    property name="citation" hint="A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.";

    property name="comment" hint="Comments, typically from users.";

    property name="commentCount" hint="The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.";

    property name="conditionsOfAccess" hint="Conditions that affect the availability of, or method(s) of access to, an item. Typically used for real world items such as an [[ArchiveComponent]] held by an [[ArchiveOrganization]]. This property is not suitable for use as a general Web access control mechanism. It is expressed only in natural language.\n\nFor example 'Available by appointment from the Reading Room' or 'Accessible only from logged-in accounts '. ";

    property name="contentLocation" hint="The location depicted or described in the content. For example, the location in a photograph or painting.";

    property name="contentRating" hint="Official rating of a piece of content&##x2014;for example, 'MPAA PG-13'.";

    property name="contentReferenceTime" hint="The specific time described by a creative work, for works (e.g. articles, video objects etc.) that emphasise a particular moment within an Event.";

    property name="contributor" hint="A secondary contributor to the CreativeWork or Event.";

    property name="copyrightHolder" hint="The party holding the legal copyright to the CreativeWork.";

    property name="copyrightNotice" hint="Text of a notice appropriate for describing the copyright aspects of this Creative Work, ideally indicating the owner of the copyright for the Work.";

    property name="copyrightYear" hint="The year during which the claimed copyright for the CreativeWork was first asserted.";

    property name="correction" hint="Indicates a correction to a [[CreativeWork]], either via a [[CorrectionComment]], textually or in another document.";

    property name="countryOfOrigin" hint="The country of origin of something, including products as well as creative  works such as movie and TV content.

In the case of TV and movie, this would be the country of the principle offices of the production company or individual responsible for the movie. For other kinds of [[CreativeWork]] it is difficult to provide fully general guidance, and properties such as [[contentLocation]] and [[locationCreated]] may be more applicable.

In the case of products, the country of origin of the product. The exact interpretation of this may vary by context and product type, and cannot be fully enumerated here.";

    property name="creativeWorkStatus" hint="The status of a creative work in terms of its stage in a lifecycle. Example terms include Incomplete, Draft, Published, Obsolete. Some organizations define a set of terms for the stages of their publication lifecycle.";

    property name="creator" hint="The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.";

    property name="creditText" hint="Text that can be used to credit person(s) and/or organization(s) associated with a published Creative Work.";

    property name="dateCreated" hint="The date on which the CreativeWork was created or the item was added to a DataFeed.";

    property name="dateModified" hint="The date on which the CreativeWork was most recently modified or when the item's entry was modified within a DataFeed.";

    property name="datePublished" hint="Date of first publication or broadcast. For example the date a [[CreativeWork]] was broadcast or a [[Certification]] was issued.";

    property name="digitalSourceType" hint="Indicates an IPTCDigitalSourceEnumeration code indicating the nature of the digital source(s) for some [[CreativeWork]].";

    property name="discussionUrl" hint="A link to the page containing the comments of the CreativeWork.";

    property name="editEIDR" hint="An [EIDR](https://eidr.org/) (Entertainment Identifier Registry) [[identifier]] representing a specific edit / edition for a work of film or television.

For example, the motion picture known as 'Ghostbusters' whose [[titleEIDR]] is '10.5240/7EC7-228A-510A-053E-CBB8-J' has several edits, e.g. '10.5240/1F2A-E1C5-680A-14C6-E76B-I' and '10.5240/8A35-3BEE-6497-5D12-9E4F-3'.

Since schema.org types like [[Movie]] and [[TVEpisode]] can be used for both works and their multiple expressions, it is possible to use [[titleEIDR]] alone (for a general description), or alongside [[editEIDR]] for a more edit-specific description.
";

    property name="editor" hint="Specifies the Person who edited the CreativeWork.";

    property name="educationalAlignment" hint="An alignment to an established educational framework.

This property should not be used where the nature of the alignment can be described using a simple property, for example to express that a resource [[teaches]] or [[assesses]] a competency.";

    property name="educationalLevel" hint="The level in terms of progression through an educational or training context. Examples of educational levels include 'beginner', 'intermediate' or 'advanced', and formal sets of level indicators.";

    property name="educationalUse" hint="The purpose of a work in the context of education; for example, 'assignment', 'group work'.";

    property name="encoding" hint="A media object that encodes this CreativeWork. This property is a synonym for associatedMedia.";

    property name="encodingFormat" hint="Media type typically expressed using a MIME format (see [IANA site](http://www.iana.org/assignments/media-types/media-types.xhtml) and [MDN reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types)), e.g. application/zip for a SoftwareApplication binary, audio/mpeg for .mp3 etc.

In cases where a [[CreativeWork]] has several media type representations, [[encoding]] can be used to indicate each [[MediaObject]] alongside particular [[encodingFormat]] information.

Unregistered or niche encoding and file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia/Wikidata entry.";

    property name="encodings" hint="A media object that encodes this CreativeWork.";

    property name="exampleOfWork" hint="A creative work that this work is an example/instance/realization/derivation of.";

    property name="expires" hint="Date the content expires and is no longer useful or available. For example a [[VideoObject]] or [[NewsArticle]] whose availability or relevance is time-limited, a [[ClaimReview]] fact check whose publisher wants to indicate that it may no longer be relevant (or helpful to highlight) after some date, or a [[Certification]] the validity has expired.";

    property name="fileFormat" hint="Media type, typically MIME format (see [IANA site](http://www.iana.org/assignments/media-types/media-types.xhtml)) of the content, e.g. application/zip of a SoftwareApplication binary. In cases where a CreativeWork has several media type representations, 'encoding' can be used to indicate each MediaObject alongside particular fileFormat information. Unregistered or niche file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia entry.";

    property name="funder" hint="A person or organization that supports (sponsors) something through some kind of financial contribution.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="genre" hint="Genre of the creative work, broadcast channel or group.";

    property name="hasPart" hint="Indicates an item or CreativeWork that is part of this item, or CreativeWork (in some sense).";

    property name="headline" hint="Headline of the article.";

    property name="inLanguage" hint="The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].";

    property name="interactionStatistic" hint="The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.";

    property name="interactivityType" hint="The predominant mode of learning supported by the learning resource. Acceptable values are 'active', 'expositive', or 'mixed'.";

    property name="interpretedAsClaim" hint="Used to indicate a specific claim contained, implied, translated or refined from the content of a [[MediaObject]] or other [[CreativeWork]]. The interpreting party can be indicated using [[claimInterpreter]].";

    property name="isAccessibleForFree" hint="A flag to signal that the item, event, or place is accessible for free.";

    property name="isBasedOn" hint="A resource from which this work is derived or from which it is a modification or adaptation.";

    property name="isBasedOnUrl" hint="A resource that was used in the creation of this resource. This term can be repeated for multiple sources. For example, http://example.com/great-multiplication-intro.html.";

    property name="isFamilyFriendly" hint="Indicates whether this content is family friendly.";

    property name="isPartOf" hint="Indicates an item or CreativeWork that this item, or CreativeWork (in some sense), is part of.";

    property name="keywords" hint="Keywords or tags used to describe some item. Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property.";

    property name="learningResourceType" hint="The predominant type or kind characterizing the learning resource. For example, 'presentation', 'handout'.";

    property name="license" hint="A license document that applies to this content, typically indicated by URL.";

    property name="locationCreated" hint="The location where the CreativeWork was created, which may not be the same as the location depicted in the CreativeWork.";

    property name="mainEntity" hint="Indicates the primary entity described in some page or other CreativeWork.";

    property name="maintainer" hint="A maintainer of a [[Dataset]], software package ([[SoftwareApplication]]), or other [[Project]]. A maintainer is a [[Person]] or [[Organization]] that manages contributions to, and/or publication of, some (typically complex) artifact. It is common for distributions of software and data to be based on 'upstream' sources. When [[maintainer]] is applied to a specific version of something e.g. a particular version or packaging of a [[Dataset]], it is always  possible that the upstream source has a different maintainer. The [[isBasedOn]] property can be used to indicate such relationships between datasets to make the different maintenance roles clear. Similarly in the case of software, a package may have dedicated maintainers working on integration into software distributions such as Ubuntu, as well as upstream maintainers of the underlying work.
      ";

    property name="material" hint="A material that something is made from, e.g. leather, wool, cotton, paper.";

    property name="materialExtent" hint="{@language={en}, @value={The quantity of the materials being described or an expression of the physical space they occupy.}}";

    property name="mentions" hint="Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.";

    property name="offers" hint="An offer to provide this item&##x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.
      ";

    property name="pattern" hint="A pattern that something has, for example 'polka dot', 'striped', 'Canadian flag'. Values are typically expressed as text, although links to controlled value schemes are also supported.";

    property name="position" hint="The position of an item in a series or sequence of items.";

    property name="producer" hint="The person or organization who produced the work (e.g. music album, movie, TV/radio series etc.).";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="publication" hint="A publication event associated with the item.";

    property name="publisher" hint="The publisher of the article in question.";

    property name="publisherImprint" hint="The publishing division which published the comic.";

    property name="publishingPrinciples" hint="The publishingPrinciples property indicates (typically via [[URL]]) a document describing the editorial principles of an [[Organization]] (or individual, e.g. a [[Person]] writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a [[CreativeWork]] (e.g. [[NewsArticle]]) the principles are those of the party primarily responsible for the creation of the [[CreativeWork]].

While such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a [[funder]]) can be expressed using schema.org terminology.
";

    property name="recordedAt" hint="The Event where the CreativeWork was recorded. The CreativeWork may capture all or part of the event.";

    property name="releasedEvent" hint="The place and time the release was issued, expressed as a PublicationEvent.";

    property name="review" hint="A review of the item.";

    property name="reviews" hint="Review of the item.";

    property name="schemaVersion" hint="Indicates (by URL or string) a particular version of a schema used in some CreativeWork. This property was created primarily to
    indicate the use of a specific schema.org release, e.g. ```10.0``` as a simple string, or more explicitly via URL, ```https://schema.org/docs/releases.html##v10.0```. There may be situations in which other schemas might usefully be referenced this way, e.g. ```http://dublincore.org/specifications/dublin-core/dces/1999-07-02/``` but this has not been carefully explored in the community.";

    property name="sdDatePublished" hint="Indicates the date on which the current structured data was generated / published. Typically used alongside [[sdPublisher]].";

    property name="sdLicense" hint="A license document that applies to this structured data, typically indicated by URL.";

    property name="sdPublisher" hint="Indicates the party responsible for generating and publishing the current structured data markup, typically in cases where the structured data is derived automatically from existing published content but published on a different site. For example, student projects and open data initiatives often re-publish existing content with more explicitly structured metadata. The
[[sdPublisher]] property helps make such practices more explicit.";

    property name="size" hint="A standardized size of a product or creative work, specified either through a simple textual string (for example 'XL', '32Wx34L'), a  QuantitativeValue with a unitCode, or a comprehensive and structured [[SizeSpecification]]; in other cases, the [[width]], [[height]], [[depth]] and [[weight]] properties may be more applicable. ";

    property name="sourceOrganization" hint="The Organization on whose behalf the creator was working.";

    property name="spatial" hint="The 'spatial' property can be used in cases when more specific properties
(e.g. [[locationCreated]], [[spatialCoverage]], [[contentLocation]]) are not known to be appropriate.";

    property name="spatialCoverage" hint="The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of
      contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates
      areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.";

    property name="sponsor" hint="A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.";

    property name="teaches" hint="The item being described is intended to help a person learn the competency or learning outcome defined by the referenced term.";

    property name="temporal" hint="The 'temporal' property can be used in cases where more specific properties
(e.g. [[temporalCoverage]], [[dateCreated]], [[dateModified]], [[datePublished]]) are not known to be appropriate.";

    property name="temporalCoverage" hint="The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in [ISO 8601 time interval format](https://en.wikipedia.org/wiki/ISO_8601##Time_intervals). In
      the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written '2011/2012'). Other forms of content, e.g. ScholarlyArticle, Book, TVSeries or TVEpisode, may indicate their temporalCoverage in broader terms - textually or via well-known URL.
      Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via '1939/1945'.

Open-ended date ranges can be written with '..' in place of the end date. For example, '2015-11/..' indicates a range beginning in November 2015 and with no specified final date. This is tentative and might be updated in future when ISO 8601 is officially updated.";

    property name="text" hint="The textual content of this CreativeWork.";

    property name="thumbnail" hint="Thumbnail image for an image or video.";

    property name="thumbnailUrl" hint="A thumbnail image relevant to the Thing.";

    property name="timeRequired" hint="Approximate or typical time it usually takes to work with or through the content of this work for the typical or target audience.";

    property name="translationOfWork" hint="The work that this work has been translated from. E.g. ç‰©ç§?èµ·æº? is a translationOf â€œOn the Origin of Speciesâ€?.";

    property name="translator" hint="Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.";

    property name="typicalAgeRange" hint="The typical expected age range, e.g. '7-9', '11-'.";

    property name="usageInfo" hint="The schema.org [[usageInfo]] property indicates further information about a [[CreativeWork]]. This property is applicable both to works that are freely available and to those that require payment or other transactions. It can reference additional information, e.g. community expectations on preferred linking and citation conventions, as well as purchasing details. For something that can be commercially licensed, usageInfo can provide detailed, resource-specific information about licensing options.

This property can be used alongside the license property which indicates license(s) applicable to some piece of content. The usageInfo property can provide information about other licensing options, e.g. acquiring commercial usage rights for an image that is also available under non-commercial creative commons licenses.";

    property name="version" hint="The version of the CreativeWork embodied by a specified resource.";

    property name="video" hint="An embedded video object.";

    property name="wordCount" hint="The number of words in the text of the CreativeWork such as an Article, Book, etc.";

    property name="workExample" hint="Example/instance/realization/derivation of the concept of this creative work. E.g. the paperback edition, first edition, or e-book.";

    property name="workTranslation" hint="A work that is a translation of the content of this work. E.g. è¥¿é?Šè¨˜ has an English workTranslation â€œJourney to the Westâ€?, a German workTranslation â€œMonkeys Pilgerfahrtâ€? and a Vietnamese  translation TÃ¢y du kÃ½ bÃ¬nh kháº£o.";


    variables[ "@type" ] = "CreativeWork";

    variables._mappers[ "_abstract" ] = "abstract";

}
