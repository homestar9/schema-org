// --------------------------------------------------------
// AUTO-GENERATED: ExerciseAction.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.PlayAction" accessors="true" {

    property name="course" hint="A sub property of location. The course where this action was taken.";

    property name="diet" hint="A sub property of instrument. The diet used in this action.";

    property name="distance" hint="The distance travelled, e.g. exercising or travelling.";

    property name="exerciseCourse" hint="A sub property of location. The course where this action was taken.";

    property name="exercisePlan" hint="A sub property of instrument. The exercise plan used on this action.";

    property name="exerciseRelatedDiet" hint="A sub property of instrument. The diet used in this action.";

    property name="exerciseType" hint="Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.";

    property name="fromLocation" hint="A sub property of location. The original location of the object or the agent before the action.";

    property name="opponent" hint="A sub property of participant. The opponent on this action.";

    property name="sportsActivityLocation" hint="A sub property of location. The sports activity location where this action occurred.";

    property name="sportsEvent" hint="A sub property of location. The sports event where this action occurred.";

    property name="sportsTeam" hint="A sub property of participant. The sports team that participated on this action.";

    property name="toLocation" hint="A sub property of location. The final location of the object or the agent after the action.";


    variables[ "@type" ] = "ExerciseAction";

    variables._mappers[ "_abstract" ] = "abstract";

}
