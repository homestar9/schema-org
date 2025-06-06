// --------------------------------------------------------
// AUTO-GENERATED: Blog.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="blogPost" hint="A posting that is part of this blog.";

    property name="blogPosts" hint="Indicates a post that is part of a [[Blog]]. Note that historically, what we term a 'Blog' was once known as a 'weblog', and that what we term a 'BlogPosting' is now often colloquially referred to as a 'blog'.";

    property name="issn" hint="The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.";


    variables[ "@type" ] = "Blog";

    variables._mappers[ "_abstract" ] = "abstract";

}
