// --------------------------------------------------------
// AUTO-GENERATED: Physician.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.MedicalBusiness" accessors="true" {

    property name="availableService" hint="A medical service available from this provider.";

    property name="hospitalAffiliation" hint="A hospital with which the physician or office is affiliated.";

    property name="medicalSpecialty" hint="A medical specialty of the provider.";

    property name="occupationalCategory" hint="A category describing the job, preferably using a term from a taxonomy such as [BLS O*NET-SOC](http://www.onetcenter.org/taxonomy.html), [ISCO-08](https://www.ilo.org/public/english/bureau/stat/isco/isco08/) or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.\n
Note: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.";

    property name="usNPI" hint="A <a href='https://en.wikipedia.org/wiki/National_Provider_Identifier'>National Provider Identifier</a> (NPI) 
    is a unique 10-digit identification number issued to health care providers in the United States by the Centers for Medicare and Medicaid Services.";


    variables[ "@type" ] = "Physician";

    variables._mappers[ "_abstract" ] = "abstract";

}
