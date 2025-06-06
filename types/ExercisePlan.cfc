// --------------------------------------------------------
// AUTO-GENERATED: ExercisePlan.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PhysicalActivity" accessors="true" {

    property name="activityDuration" hint="Length of time to engage in the activity.";

    property name="activityFrequency" hint="How often one should engage in the activity.";

    property name="additionalVariable" hint="Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.";

    property name="exerciseType" hint="Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.";

    property name="intensity" hint="Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.";

    property name="repetitions" hint="Number of times one should repeat the activity.";

    property name="restPeriods" hint="How often one should break from the activity.";

    property name="workload" hint="Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.";


    variables[ "@type" ] = "ExercisePlan";

}
