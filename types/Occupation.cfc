// --------------------------------------------------------
// AUTO-GENERATED: Occupation.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Intangible" accessors="true" {

    property name="educationRequirements" hint="Educational background needed for the position or Occupation.";

    property name="estimatedSalary" hint="An estimated salary for a job posting or occupation, based on a variety of variables including, but not limited to industry, job title, and location. Estimated salaries  are often computed by outside organizations rather than the hiring organization, who may not have committed to the estimated value.";

    property name="experienceRequirements" hint="Description of skills and experience needed for the position or Occupation.";

    property name="occupationalCategory" hint="A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\n
Note: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.";

    property name="occupationLocation" hint=" The region/country for which this occupational description is appropriate. Note that educational requirements and qualifications can vary between jurisdictions.";

    property name="qualifications" hint="Specific qualifications required for this role or Occupation.";

    property name="responsibilities" hint="Responsibilities associated with this role or Occupation.";

    property name="skills" hint="A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is either claimed by a person, an organization or desired or required to fulfill a role or to work in an occupation.";


    variables[ "@type" ] = "Occupation";

}
