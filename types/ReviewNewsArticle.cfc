// --------------------------------------------------------
// AUTO-GENERATED: ReviewNewsArticle.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CriticReview" accessors="true" {

    property name="articleBody" hint="The actual body of the article.";

    property name="articleSection" hint="Articles may belong to one or more 'sections' in a magazine or newspaper, such as Sports, Lifestyle, etc.";

    property name="backstory" hint="For an [[Article]], typically a [[NewsArticle]], the backstory property provides a textual summary giving a brief explanation of why and how an article was created. In a journalistic setting this could include information about reporting process, methods, interviews, data sources, etc.";

    property name="dateline" hint="A [dateline](https://en.wikipedia.org/wiki/Dateline) is a brief piece of text included in news articles that describes where and when the story was written or filed though the date is often omitted. Sometimes only a placename is provided.

Structured representations of dateline-related information can also be expressed more explicitly using [[locationCreated]] (which represents where a work was created, e.g. where a news report was written).  For location depicted or described in the content, use [[contentLocation]].

Dateline summaries are oriented more towards human readers than towards automated processing, and can vary substantially. Some examples: 'BEIRUT, Lebanon, June 2.', 'Paris, France', 'December 19, 2017 11:43AM Reporting from Washington', 'Beijing/Moscow', 'QUEZON CITY, Philippines'.
      ";

    property name="pageEnd" hint="The page on which the work ends; for example '138' or 'xvi'.";

    property name="pageStart" hint="The page on which the work starts; for example '135' or 'xiii'.";

    property name="pagination" hint="Any description of pages that is not separated into pageStart and pageEnd; for example, '1-6, 9, 55' or '10-12, 46-49'.";

    property name="printColumn" hint="The number of the column in which the NewsArticle appears in the print edition.";

    property name="printEdition" hint="The edition of the print product in which the NewsArticle appears.";

    property name="printPage" hint="If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).";

    property name="printSection" hint="If this NewsArticle appears in print, this field indicates the print section in which the article appeared.";

    property name="speakable" hint="Indicates sections of a Web page that are particularly 'speakable' in the sense of being highlighted as being especially appropriate for text-to-speech conversion. Other sections of a page may also be usefully spoken in particular circumstances; the 'speakable' property serves to indicate the parts most likely to be generally useful for speech.

The *speakable* property can be repeated an arbitrary number of times, with three kinds of possible 'content-locator' values:

1.) *id-value* URL references - uses *id-value* of an element in the page being annotated. The simplest use of *speakable* has (potentially relative) URL values, referencing identified sections of the document concerned.

2.) CSS Selectors - addresses content in the annotated page, e.g. via class attribute. Use the [[cssSelector]] property.

3.)  XPaths - addresses content via XPaths (assuming an XML view of the content). Use the [[xpath]] property.


For more sophisticated markup of speakable sections beyond simple ID references, either CSS selectors or XPath expressions to pick out document section(s) as speakable. For this
we define a supporting type, [[SpeakableSpecification]]  which is defined to be a possible value of the *speakable* property.
         ";


    variables[ "@type" ] = "ReviewNewsArticle";

}
