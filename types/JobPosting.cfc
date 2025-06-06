// --------------------------------------------------------
// AUTO-GENERATED: JobPosting.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="applicantLocationRequirements" hint="The location(s) applicants can apply from. This is usually used for telecommuting jobs where the applicant does not need to be in a physical office. Note: This should not be used for citizenship or work visa requirements.";

    property name="applicationContact" hint="Contact details for further information relevant to this job posting.";

    property name="baseSalary" hint="The base salary of the job or of an employee in an EmployeeRole.";

    property name="benefits" hint="Description of benefits associated with the job.";

    property name="datePosted" hint="Publication date of an online listing.";

    property name="directApply" hint="Indicates whether an [[url]] that is associated with a [[JobPosting]] enables direct application for the job, via the posting website. A job posting is considered to have directApply of [[True]] if an application process for the specified job can be directly initiated via the url(s) given (noting that e.g. multiple internet domains might nevertheless be involved at an implementation level). A value of [[False]] is appropriate if there is no clear path to applying directly online for the specified job, navigating directly from the JobPosting url(s) supplied.";

    property name="educationRequirements" hint="Educational background needed for the position or Occupation.";

    property name="eligibilityToWorkRequirement" hint="The legal requirements such as citizenship, visa and other documentation required for an applicant to this job.";

    property name="employerOverview" hint="A description of the employer, career opportunities and work environment for this position.";

    property name="employmentType" hint="Type of employment (e.g. full-time, part-time, contract, temporary, seasonal, internship).";

    property name="employmentUnit" hint="Indicates the department, unit and/or facility where the employee reports and/or in which the job is to be performed.";

    property name="estimatedSalary" hint="An estimated salary for a job posting or occupation, based on a variety of variables including, but not limited to industry, job title, and location. Estimated salaries  are often computed by outside organizations rather than the hiring organization, who may not have committed to the estimated value.";

    property name="experienceInPlaceOfEducation" hint="Indicates whether a [[JobPosting]] will accept experience (as indicated by [[OccupationalExperienceRequirements]]) in place of its formal educational qualifications (as indicated by [[educationRequirements]]). If true, indicates that satisfying one of these requirements is sufficient.";

    property name="experienceRequirements" hint="Description of skills and experience needed for the position or Occupation.";

    property name="hiringOrganization" hint="Organization or Person offering the job position.";

    property name="incentiveCompensation" hint="Description of bonus and commission compensation aspects of the job.";

    property name="incentives" hint="Description of bonus and commission compensation aspects of the job.";

    property name="industry" hint="The industry associated with the job position.";

    property name="jobBenefits" hint="Description of benefits associated with the job.";

    property name="jobImmediateStart" hint="An indicator as to whether a position is available for an immediate start.";

    property name="jobLocation" hint="A (typically single) geographic location associated with the job position.";

    property name="jobLocationType" hint="A description of the job location (e.g. TELECOMMUTE for telecommute jobs).";

    property name="jobStartDate" hint="The date on which a successful applicant for this job would be expected to start work. Choose a specific date in the future or use the jobImmediateStart property to indicate the position is to be filled as soon as possible.";

    property name="occupationalCategory" hint="A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\n
Note: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.";

    property name="physicalRequirement" hint="A description of the types of physical activity associated with the job. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.";

    property name="qualifications" hint="Specific qualifications required for this role or Occupation.";

    property name="relevantOccupation" hint="The Occupation for the JobPosting.";

    property name="responsibilities" hint="Responsibilities associated with this role or Occupation.";

    property name="salaryCurrency" hint="The currency (coded using [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217)) used for the main salary information in this job posting or for this employee.";

    property name="securityClearanceRequirement" hint="A description of any security clearance requirements of the job.";

    property name="sensoryRequirement" hint="A description of any sensory requirements and levels necessary to function on the job, including hearing and vision. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.";

    property name="skills" hint="A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is either claimed by a person, an organization or desired or required to fulfill a role or to work in an occupation.";

    property name="specialCommitments" hint="Any special commitments associated with this job posting. Valid entries include VeteranCommit, MilitarySpouseCommit, etc.";

    property name="title" hint="The title of the job.";

    property name="totalJobOpenings" hint="The number of positions open for this job posting. Use a positive integer. Do not use if the number of positions is unclear or not known.";

    property name="validThrough" hint="The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.";

    property name="workHours" hint="The typical working hours for this job (e.g. 1st shift, night shift, 8am-5pm).";


    variables[ "@type" ] = "JobPosting";

    variables._mappers[ "_abstract" ] = "abstract";

}
