// --------------------------------------------------------
// AUTO-GENERATED: LearningResource.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="assesses" hint="The item being described is intended to assess the competency or learning outcome defined by the referenced term.";

    property name="competencyRequired" hint="Knowledge, skill, ability or personal attribute that must be demonstrated by a person or other entity in order to do something such as earn an Educational Occupational Credential or understand a LearningResource.";

    property name="educationalAlignment" hint="An alignment to an established educational framework.

This property should not be used where the nature of the alignment can be described using a simple property, for example to express that a resource [[teaches]] or [[assesses]] a competency.";

    property name="educationalLevel" hint="The level in terms of progression through an educational or training context. Examples of educational levels include 'beginner', 'intermediate' or 'advanced', and formal sets of level indicators.";

    property name="educationalUse" hint="The purpose of a work in the context of education; for example, 'assignment', 'group work'.";

    property name="learningResourceType" hint="The predominant type or kind characterizing the learning resource. For example, 'presentation', 'handout'.";

    property name="teaches" hint="The item being described is intended to help a person learn the competency or learning outcome defined by the referenced term.";


    variables[ "@type" ] = "LearningResource";

    variables._mappers[ "_abstract" ] = "abstract";

}
