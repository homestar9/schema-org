// --------------------------------------------------------
// AUTO-GENERATED: OpeningHoursSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.StructuredValue" accessors="true" {

    property name="closes" hint="The closing hour of the place or service on the given day(s) of the week.";

    property name="dayOfWeek" hint="The day of the week for which these opening hours are valid.";

    property name="opens" hint="The opening hour of the place or service on the given day(s) of the week.";

    property name="validFrom" hint="The date when the item becomes valid.";

    property name="validThrough" hint="The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.";


    variables[ "@type" ] = "OpeningHoursSpecification";

    variables._mappers[ "_abstract" ] = "abstract";

}
