// --------------------------------------------------------
// AUTO-GENERATED: Answer.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Comment" accessors="true" {

    property name="answerExplanation" hint="A step-by-step or full explanation about Answer. Can outline how this Answer was achieved or contain more broad clarification or statement about it. ";

    property name="parentItem" hint="The parent of a question, answer or item in general. Typically used for Q/A discussion threads e.g. a chain of comments with the first comment being an [[Article]] or other [[CreativeWork]]. See also [[comment]] which points from something to a comment about it.";


    variables[ "@type" ] = "Answer";

    variables._mappers[ "_abstract" ] = "abstract";

}
