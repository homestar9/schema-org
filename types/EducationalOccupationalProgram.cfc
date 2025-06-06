// --------------------------------------------------------
// AUTO-GENERATED: EducationalOccupationalProgram.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="applicationDeadline" hint="The date on which the program stops collecting applications for the next enrollment cycle. Flexible application deadlines (for example, a program with rolling admissions) can be described in a textual string, rather than as a DateTime.";

    property name="applicationStartDate" hint="The date at which the program begins collecting applications for the next enrollment cycle.";

    property name="dayOfWeek" hint="The day of the week for which these opening hours are valid.";

    property name="educationalCredentialAwarded" hint="A description of the qualification, award, certificate, diploma or other educational credential awarded as a consequence of successful completion of this course or program.";

    property name="educationalProgramMode" hint="Similar to courseMode, the medium or means of delivery of the program as a whole. The value may either be a text label (e.g. 'online', 'onsite' or 'blended'; 'synchronous' or 'asynchronous'; 'full-time' or 'part-time') or a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311##Asynchronous ).";

    property name="endDate" hint="The end date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="financialAidEligible" hint="A financial aid type or program which students may use to pay for tuition or fees associated with the program.";

    property name="hasCourse" hint="A course or class that is one of the learning opportunities that constitute an educational / occupational program. No information is implied about whether the course is mandatory or optional; no guarantee is implied about whether the course will be available to everyone on the program.";

    property name="maximumEnrollment" hint="The maximum number of students who may be enrolled in the program.";

    property name="numberOfCredits" hint="The number of credits or units awarded by a Course or required to complete an EducationalOccupationalProgram.";

    property name="occupationalCategory" hint="A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\n
Note: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.";

    property name="occupationalCredentialAwarded" hint="A description of the qualification, award, certificate, diploma or other occupational credential awarded as a consequence of successful completion of this course or program.";

    property name="offers" hint="An offer to provide this item&##x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use [[businessFunction]] to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a [[Demand]]. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.
      ";

    property name="programPrerequisites" hint="Prerequisites for enrolling in the program.";

    property name="programType" hint="The type of educational or occupational program. For example, classroom, internship, alternance, etc.";

    property name="provider" hint="The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.";

    property name="salaryUponCompletion" hint="The expected salary upon completing the training.";

    property name="startDate" hint="The start date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="termDuration" hint="The amount of time in a term as defined by the institution. A term is a length of time where students take one or more classes. Semesters and quarters are common units for term.";

    property name="termsPerYear" hint="The number of times terms of study are offered per year. Semesters and quarters are common units for term. For example, if the student can only take 2 semesters for the program in one year, then termsPerYear should be 2.";

    property name="timeOfDay" hint="The time of day the program normally runs. For example, 'evenings'.";

    property name="timeToComplete" hint="The expected length of time to complete the program if attending full-time.";

    property name="trainingSalary" hint="The estimated salary earned while in the program.";

    property name="typicalCreditsPerTerm" hint="The number of credits or units a full-time student would be expected to take in 1 term however 'term' is defined by the institution.";


    variables[ "@type" ] = "EducationalOccupationalProgram";

}
