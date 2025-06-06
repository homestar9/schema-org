// --------------------------------------------------------
// AUTO-GENERATED: UserComments.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.UserInteraction" accessors="true" {

    property name="commentText" hint="The text of the UserComment.";

    property name="commentTime" hint="The time at which the UserComment was made.";

    property name="creator" hint="The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.";

    property name="discusses" hint="Specifies the CreativeWork associated with the UserComment.";

    property name="replyToUrl" hint="The URL at which a reply may be posted to the specified UserComment.";


    variables[ "@type" ] = "UserComments";

    variables._mappers[ "_abstract" ] = "abstract";

}
