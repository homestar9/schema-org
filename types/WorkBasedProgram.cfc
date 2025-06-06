// --------------------------------------------------------
// AUTO-GENERATED: WorkBasedProgram.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.EducationalOccupationalProgram" accessors="true" {

    property name="occupationalCategory" hint="A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\n
Note: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.";

    property name="trainingSalary" hint="The estimated salary earned while in the program.";


    variables[ "@type" ] = "WorkBasedProgram";

    variables._mappers[ "_abstract" ] = "abstract";

}
