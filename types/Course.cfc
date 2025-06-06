// --------------------------------------------------------
// AUTO-GENERATED: Course.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.LearningResource" accessors="true" {

    property name="availableLanguage" hint="A language someone may use with or at the item, service or place. Please use one of the language codes from the [IETF BCP 47 standard](http://tools.ietf.org/html/bcp47). See also [[inLanguage]].";

    property name="courseCode" hint="The identifier for the [[Course]] used by the course [[provider]] (e.g. CS101 or 6.001).";

    property name="coursePrerequisites" hint="Requirements for taking the Course. May be completion of another [[Course]] or a textual description like 'permission of instructor'. Requirements may be a pre-requisite competency, referenced using [[AlignmentObject]].";

    property name="educationalCredentialAwarded" hint="A description of the qualification, award, certificate, diploma or other educational credential awarded as a consequence of successful completion of this course or program.";

    property name="financialAidEligible" hint="A financial aid type or program which students may use to pay for tuition or fees associated with the program.";

    property name="hasCourseInstance" hint="An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.";

    property name="numberOfCredits" hint="The number of credits or units awarded by a Course or required to complete an EducationalOccupationalProgram.";

    property name="occupationalCredentialAwarded" hint="A description of the qualification, award, certificate, diploma or other occupational credential awarded as a consequence of successful completion of this course or program.";

    property name="syllabusSections" hint="Indicates (typically several) Syllabus entities that lay out what each section of the overall course will cover.";

    property name="totalHistoricalEnrollment" hint="The total number of students that have enrolled in the history of the course.";


    variables[ "@type" ] = "Course";

}
