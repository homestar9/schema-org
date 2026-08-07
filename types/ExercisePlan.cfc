// --------------------------------------------------------
// AUTO-GENERATED: ExercisePlan.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="activityDuration" hint="Length of time to engage in the activity.";

    property name="activityFrequency" hint="How often one should engage in the activity.";

    property name="additionalVariable" hint="Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.";

    property name="associatedAnatomy" hint="The anatomy of the underlying organ system or structures associated with this entity.";

    property name="category" hint="A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.";

    property name="code" hint="A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.";

    property name="epidemiology" hint="The characteristics of associated patients, such as age, gender, race etc.";

    property name="exerciseType" hint="Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.";

    property name="guideline" hint="A medical guideline related to this entity.";

    property name="intensity" hint="Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.";

    property name="legalStatus" hint="The drug or supplement's legal status, including any controlled substance schedules that apply.";

    property name="medicineSystem" hint="The system of medicine that includes this MedicalEntity, for example 'evidence-based', 'homeopathic', 'chiropractic', etc.";

    property name="pathophysiology" hint="Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.";

    property name="recognizingAuthority" hint="If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.";

    property name="relevantSpecialty" hint="If applicable, a medical specialty in which this entity is relevant.";

    property name="repetitions" hint="Number of times one should repeat the activity.";

    property name="restPeriods" hint="How often one should break from the activity.";

    property name="study" hint="A medical study or trial related to this entity.";

    property name="workload" hint="Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.";


    variables[ "@type" ] = "ExercisePlan";

}
