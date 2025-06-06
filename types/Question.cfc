// --------------------------------------------------------
// AUTO-GENERATED: Question.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Comment" accessors="true" {

    property name="acceptedAnswer" hint="The answer(s) that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.";

    property name="answerCount" hint="The number of answers this question has received.";

    property name="eduQuestionType" hint="For questions that are part of learning resources (e.g. Quiz), eduQuestionType indicates the format of question being given. Example: 'Multiple choice', 'Open ended', 'Flashcard'.";

    property name="parentItem" hint="The parent of a question, answer or item in general. Typically used for Q/A discussion threads e.g. a chain of comments with the first comment being an [[Article]] or other [[CreativeWork]]. See also [[comment]] which points from something to a comment about it.";

    property name="suggestedAnswer" hint="An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.";


    variables[ "@type" ] = "Question";

    variables._mappers[ "_abstract" ] = "abstract";

}
