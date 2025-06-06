// --------------------------------------------------------
// AUTO-GENERATED: Event.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="about" hint="The subject matter of the content.";

    property name="actor" hint="An actor (individual or a group), e.g. in TV, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.";

    property name="aggregateRating" hint="The overall rating, based on a collection of reviews or ratings, of the item.";

    property name="attendee" hint="A person or organization attending the event.";

    property name="attendees" hint="A person attending the event.";

    property name="audience" hint="An intended audience, i.e. a group for whom something was created.";

    property name="composer" hint="The person or organization who wrote a composition, or who is the composer of a work performed at some event.";

    property name="contributor" hint="A secondary contributor to the CreativeWork or Event.";

    property name="director" hint="A director of e.g. TV, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.";

    property name="doorTime" hint="The time admission will commence.";

    property name="duration" hint="The duration of the item (movie, audio recording, event, etc.) in [ISO 8601 duration format](http://en.wikipedia.org/wiki/ISO_8601).";

    property name="endDate" hint="The end date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="eventAttendanceMode" hint="The eventAttendanceMode of an event indicates whether it occurs online, offline, or a mix.";

    property name="eventSchedule" hint="Associates an [[Event]] with a [[Schedule]]. There are circumstances where it is preferable to share a schedule for a series of
      repeating events rather than data on the individual events themselves. For example, a website or application might prefer to publish a schedule for a weekly
      gym class rather than provide data on every event. A schedule could be processed by applications to add forthcoming events to a calendar. An [[Event]] that
      is associated with a [[Schedule]] using this property should not have [[startDate]] or [[endDate]] properties. These are instead defined within the associated
      [[Schedule]], this avoids any ambiguity for clients using the data. The property might have repeated values to specify different schedules, e.g. for different months
      or seasons.";

    property name="eventStatus" hint="An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.";

    property name="funder" hint="A person or organization that supports (sponsors) something through some kind of financial contribution.";

    property name="funding" hint="A [[Grant]] that directly or indirectly provide funding or sponsorship for this item. See also [[ownershipFundingInfo]].";

    property name="inLanguage" hint="The language of the content or performance or used in an action. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[availableLanguage]].";

    property name="isAccessibleForFree" hint="A flag to signal that the item, event, or place is accessible for free.";

    property name="keywords" hint="Keywords or tags used to describe some item. Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property.";

    property name="location" hint="The location of, for example, where an event is happening, where an organization is located, or where an action takes place.";

    property name="maximumAttendeeCapacity" hint="The total number of individuals that may attend an event or venue.";

    property name="maximumPhysicalAttendeeCapacity" hint="The maximum physical attendee capacity of an [[Event]] whose [[eventAttendanceMode]] is [[OfflineEventAttendanceMode]] (or the offline aspects, in the case of a [[MixedEventAttendanceMode]]). ";

    property name="maximumVirtualAttendeeCapacity" hint="The maximum virtual attendee capacity of an [[Event]] whose [[eventAttendanceMode]] is [[OnlineEventAttendanceMode]] (or the online aspects, in the case of a [[MixedEventAttendanceMode]]). ";

    property name="offers" hint="An offer to provide this item&##x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.
      ";

    property name="organizer" hint="An organizer of an Event.";

    property name="performer" hint="A performer at the event&##x2014;for example, a presenter, musician, musical group or actor.";

    property name="performers" hint="The main performer or performers of the event&##x2014;for example, a presenter, musician, or actor.";

    property name="previousStartDate" hint="Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.";

    property name="recordedIn" hint="The CreativeWork that captured all or part of this Event.";

    property name="remainingAttendeeCapacity" hint="The number of attendee places for an event that remain unallocated.";

    property name="review" hint="A review of the item.";

    property name="sponsor" hint="A person or organization that supports a thing through a pledge, promise, or financial contribution. E.g. a sponsor of a Medical Study or a corporate sponsor of an event.";

    property name="startDate" hint="The start date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="subEvent" hint="An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference.";

    property name="subEvents" hint="Events that are a part of this event. For example, a conference event includes many presentations, each subEvents of the conference.";

    property name="superEvent" hint="An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.";

    property name="translator" hint="Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.";

    property name="typicalAgeRange" hint="The typical expected age range, e.g. '7-9', '11-'.";

    property name="workFeatured" hint="A work featured in some event, e.g. exhibited in an ExhibitionEvent.
       Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).";

    property name="workPerformed" hint="A work performed in some event, for example a play performed in a TheaterEvent.";


    variables[ "@type" ] = "Event";

    variables._mappers[ "_abstract" ] = "abstract";

}
