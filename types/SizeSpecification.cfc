// --------------------------------------------------------
// AUTO-GENERATED: SizeSpecification.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.QualitativeValue" accessors="true" {

    property name="hasMeasurement" hint="A measurement of an item, For example, the inseam of pants, the wheel size of a bicycle, the gauge of a screw, or the carbon footprint measured for certification by an authority. Usually an exact measurement, but can also be a range of measurements for adjustable products, for example belts and ski bindings.";

    property name="sizeGroup" hint="The size group (also known as 'size type') for a product's size. Size groups are common in the fashion industry to define size segments and suggested audiences for wearable products. Multiple values can be combined, for example 'men's big and tall', 'petite maternity' or 'regular'.";

    property name="sizeSystem" hint="The size system used to identify a product's size. Typically either a standard (for example, 'GS1' or 'ISO-EN13402'), country code (for example 'US' or 'JP'), or a measuring system (for example 'Metric' or 'Imperial').";

    property name="suggestedAge" hint="The age or age range for the intended audience or person, for example 3-12 months for infants, 1-5 years for toddlers.";

    property name="suggestedGender" hint="The suggested gender of the intended person or audience, for example 'male', 'female', or 'unisex'.";

    property name="suggestedMeasurement" hint="A suggested range of body measurements for the intended audience or person, for example inseam between 32 and 34 inches or height between 170 and 190 cm. Typically found on a size chart for wearable products.";


    variables[ "@type" ] = "SizeSpecification";

}
