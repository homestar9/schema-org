// --------------------------------------------------------
// AUTO-GENERATED: CDCPMDRecord.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="cvdCollectionDate" hint="collectiondate - Date for which patient counts are reported.";

    property name="cvdFacilityCounty" hint="Name of the County of the NHSN facility that this data record applies to. Use [[cvdFacilityId]] to identify the facility. To provide other details, [[healthcareReportingData]] can be used on a [[Hospital]] entry.";

    property name="cvdFacilityId" hint="Identifier of the NHSN facility that this data record applies to. Use [[cvdFacilityCounty]] to indicate the county. To provide other details, [[healthcareReportingData]] can be used on a [[Hospital]] entry.";

    property name="cvdNumBeds" hint="numbeds - HOSPITAL INPATIENT BEDS: Inpatient beds, including all staffed, licensed, and overflow (surge) beds used for inpatients.";

    property name="cvdNumBedsOcc" hint="numbedsocc - HOSPITAL INPATIENT BED OCCUPANCY: Total number of staffed inpatient beds that are occupied.";

    property name="cvdNumC19Died" hint="numc19died - DEATHS: Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location.";

    property name="cvdNumC19HOPats" hint="numc19hopats - HOSPITAL ONSET: Patients hospitalized in an NHSN inpatient care location with onset of suspected or confirmed COVID-19 14 or more days after hospitalization.";

    property name="cvdNumC19HospPats" hint="numc19hosppats - HOSPITALIZED: Patients currently hospitalized in an inpatient care location who have suspected or confirmed COVID-19.";

    property name="cvdNumC19MechVentPats" hint="numc19mechventpats - HOSPITALIZED and VENTILATED: Patients hospitalized in an NHSN inpatient care location who have suspected or confirmed COVID-19 and are on a mechanical ventilator.";

    property name="cvdNumC19OFMechVentPats" hint="numc19ofmechventpats - ED/OVERFLOW and VENTILATED: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed and on a mechanical ventilator.";

    property name="cvdNumC19OverflowPats" hint="numc19overflowpats - ED/OVERFLOW: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed.";

    property name="cvdNumICUBeds" hint="numicubeds - ICU BEDS: Total number of staffed inpatient intensive care unit (ICU) beds.";

    property name="cvdNumICUBedsOcc" hint="numicubedsocc - ICU BED OCCUPANCY: Total number of staffed inpatient ICU beds that are occupied.";

    property name="cvdNumTotBeds" hint="numtotbeds - ALL HOSPITAL BEDS: Total number of all inpatient and outpatient beds, including all staffed, ICU, licensed, and overflow (surge) beds used for inpatients or outpatients.";

    property name="cvdNumVent" hint="numvent - MECHANICAL VENTILATORS: Total number of ventilators available.";

    property name="cvdNumVentUse" hint="numventuse - MECHANICAL VENTILATORS IN USE: Total number of ventilators in use.";

    property name="datePosted" hint="Publication date of an online listing.";


    variables[ "@type" ] = "CDCPMDRecord";

}
