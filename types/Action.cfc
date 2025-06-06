// --------------------------------------------------------
// AUTO-GENERATED: Action.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Thing" accessors="true" {

    property name="actionProcess" hint="Description of the process by which the action was performed.";

    property name="actionStatus" hint="Indicates the current disposition of the Action.";

    property name="agent" hint="The direct performer or driver of the action (animate or inanimate). E.g. *John* wrote a book.";

    property name="endTime" hint="The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. E.g. John wrote a book from January to *December*. For media, including audio and video, it's the time offset of the end of a clip within a larger file.\n\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.";

    property name="error" hint="For failed actions, more information on the cause of the failure.";

    property name="instrument" hint="The object that helped the agent perform the action. E.g. John wrote a book with *a pen*.";

    property name="location" hint="The location of, for example, where an event is happening, where an organization is located, or where an action takes place.";

    property name="object" hint="The object upon which the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn't). E.g. John read *a book*.";

    property name="participant" hint="Other co-agents that participated in the action indirectly. E.g. John wrote a book with *Steve*.";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="result" hint="The result produced in the action. E.g. John wrote *a book*.";

    property name="startTime" hint="The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. E.g. John wrote a book from *January* to December. For media, including audio and video, it's the time offset of the start of a clip within a larger file.\n\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.";

    property name="target" hint="Indicates a target EntryPoint, or url, for an Action.";


    variables[ "@type" ] = "Action";

    variables._mappers[ "_abstract" ] = "abstract";

}
