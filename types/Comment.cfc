// --------------------------------------------------------
// AUTO-GENERATED: Comment.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="downvoteCount" hint="The number of downvotes this question, answer or comment has received from the community.";

    property name="parentItem" hint="The parent of a question, answer or item in general. Typically used for Q/A discussion threads e.g. a chain of comments with the first comment being an [[Article]] or other [[CreativeWork]]. See also [[comment]] which points from something to a comment about it.";

    property name="sharedContent" hint="A CreativeWork such as an image, video, or audio clip shared as part of this posting.";

    property name="upvoteCount" hint="The number of upvotes this question, answer or comment has received from the community.";


    variables[ "@type" ] = "Comment";

    variables._mappers[ "_abstract" ] = "abstract";

}
