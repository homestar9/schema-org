// --------------------------------------------------------
// AUTO-GENERATED: LiveBlogPosting.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.BlogPosting" accessors="true" {

    property name="coverageEndTime" hint="The time when the live blog will stop covering the Event. Note that coverage may continue after the Event concludes.";

    property name="coverageStartTime" hint="The time when the live blog will begin covering the Event. Note that coverage may begin before the Event's start time. The LiveBlogPosting may also be created before coverage begins.";

    property name="liveBlogUpdate" hint="An update to the LiveBlog.";


    variables[ "@type" ] = "LiveBlogPosting";

}
