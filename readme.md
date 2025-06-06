# Schema-org

<img src="https://github.com/homestar9/schema-org/blob/master/schema-org.svg?raw=true" width="250" alt="Schema-Org ColdBox Module Logo" />

**Schema-org** is a ColdBox module for building structured JSON-LD data using [Schema.org](https://schema.org) in a flexible, fluent, and framework-friendly way. This module helps you compose valid JSON-LD schema for SEO and rich results—without resorting to manual JSON.

## What is Schema.org?

Schema.org is a collaborative vocabulary standard (initiated by Google, Microsoft, Yahoo, and Yandex) that helps search engines understand webpage content.

## What is JSON-LD?

JSON-LD (JavaScript Object Notation for Linked Data) is a lightweight Linked Data format that allows you to express structured data in a way that is easy for both humans and machines to read. It uses JSON syntax to provide context and meaning to data, making it ideal for embedding structured information in web pages.

## Why Should I Use Structred JSON-LD Data in My Coldbox App?

Using Schema.org structured data can improve your website's visibility in search results by allowing search engines to understand your content more effectively. It also enables rich snippets, which can display additional information like ratings, reviews, and product details directly in search results. Bottom line: it's an **essential part of modern SEO and web development**.

## Requirements

- **ColdBox**: 7.0+
- **CFML Engines**:
  - Adobe ColdFusion 2021+
  - Lucee 5.3+
  - BoxLang 1.0.0+

## Features

- ✅ Easy, fluent API for creating schema types
- 🔁 Supports multiple schemas per page
- 🔗 Automatic `@context` and `@graph` wrapping
- 💡 Outputs valid [JSON-LD](https://json-ld.org/)

## Installation

Install via CommandBox:

```bash
box install schema-org
```

## Configuration

Woah, what? Nothing to configure? That's awesome!

## Quick Start

1. Inject the `SchemaBuilder` into your handler/layout/component or alternatively, instantiate an instance of `SchemaBuilder` via wirebox. **Important**: `SchemaBuilder` is a transient, so make sure to use the `provider:` method when using property inection.

```cfc
// automatic injetcion
property name="sb" inject="provider:SchemaBuilder@schema-org";

// or manual instantiation
var sb = getInstance( "SchemaBuilder@schema-org" );
```


2. Build your schema objects. The method names match the Schema.org object types. You can use either a closure or a struct to define properties for each schema type.

```cfc
// In your handler method
prc.schema = sb
    // Organization Schema
    .organization( function( o ) {
        o.id( "https://startrek.com/##organization" ) // must be unique
            .name( "United Federation of Planets" )
            .url( "https://startrek.com/" )
            // ... rest of schema properties
    } )
    
    // Webpage Schema
    .webpage( function( o ) {
        o.id( https://startrek.com/##webpage" ) // must be unique
            .name( "Starfleet Command" )
            .description( "Official website of Starfleet Command" )
            .url( "https://startrek.com/" )
            // ... rest of schema properties
    } )
```

3. Render the JSON-LD in your view:

```cfc
<cfoutput>
    #prc.schema.render()#
</cfoutput>
```

## API Overview

### Main `SchemaBuilder` Methods

 - `get()`: Returns a struct representation of the full schema graph.

 - `render()`: Returns the serialized JSON-LD string wrapped in `<script type="application/ld+json">` tags for easy embedding in HTML.

 - `toArray()`: Returns an array of all schema objects created.

 - `toJsonLd()`: Returns serialized JSON-LD schema graph (without the script tags).

 - `[type]()` methods: Create specific schema types like `organization()`, `webpage()`, `product()`, etc. The method accepts a closure or a struct to define properties (see below).

### Available Schema Types

Each supported type is accessible via method call on the builder. Examples include:
- `organization()`
- `webpage()`
- `product()`
- `localBusiness()`
etc...

[All core Schema.org types](https://schema.org/docs/full.html) are supported. If you discover a missing one, please open an issue.

### Main Schema Object Methods

Each schema object type has methods to set properties and instantiate new objects. Common methods include:

- `id(value)`: Sets the unique identifier for the schema object. Note: The actual property name is `@id`, but you can use `id()` or `setId()` for convenience.

- `[property](value)`: Sets a property for the schema object. The method name corresponds to the Schema.org property name (e.g., `name(value)`, `url(value)`, `description(value)`, etc.).

- `new(type, closure or struct)`: Creates a new nested schema object of the specified type. The `type` is the Schema.org type name (e.g., "PostalAddress"), and the `closure` is a function or a struct to define its properties.

### Populating Schema Properties

You can define properties using a closure or a struct. The closure approach allows for fluent chaining, while the struct approach is more explicit. The methods available for each type are based on the properties available for that particular type.

#### Using a Closure

The below examples assume `sb` is an instance of `SchemaBuilder`.

```cfc
sb.organization( function( o ) {
    o.id( "https://example.com/##organization" )
        .name( "Example Organization" )
        .url( "https://example.com/" )
        // ... other properties
} )
```

#### Using a Struct

```cfc
sb.organization( {
    id: "https://example.com/##organization",
    name: "Example Organization",
    url: "https://example.com/"
    // ... other properties
} )
```

### Nested Schema Objects

You can nest schema objects within each other. You can quickly create a new instance of a schema type by calling `new()` on the closure argument. For example, if you have a `localBusiness` that has an `address`, you can define it like this:

```cfc
sb.localBusiness( function( lb ) {
    lb.id( "https://example.com/##localBusiness" )
        .name( "Example Local Business" )
        // Address needs a nested schema object
        .address( 
            // Create a new PostalAddress instance by calling new() on the schema object
            lb.new( "PostalAddress", function( a ) {
                a.streetAddress( "123 Example St" )
                    .addressLocality( "Example City" )
                    .addressRegion( "EX" )
                    .postalCode( "12345" )
                    .addressCountry( "US" );
            } ) 
        );
} )
```

### Example Usage in a Coldbox App

Here's a complete example of how you might use the `SchemaBuilder` in a ColdBox app. You can also check out the test-harness folder in this repo for the more fun.

#### In Your Layout
```cfc
// /layouts/Main.cfc

<script type="application/ld+json">
#runEvent(
    event = "schemas.index",
    eventArguments = {
        <!--- Pass along important event arguments for schema generation --->
        <!--- Tip: If you use event caching, the cache key is determined by these arguments, so make them unique per page/schema --->
        eventName = event.getCurrentEvent(), <!--- example: "posts.show" --->
        routedUrl = event.getCurrentRoutedUrl() <!--- example: "/posts/why-captain-picard-is-the-goat" --->
    }
)#
</script>
```

#### In Your Handler

Note that when building the `webpage` schema, we use `prc.canonicalUrl`, `prc.pageTitle`, and `prc.pageDescription` to dynamically set the schema properties based on the current page context. This allows for flexible schema generation across different pages without hardcoding values. All your pages should have these properties which is a best-practice for any modern website.

```cfc
// /handlers/Schemas.cfc

// Inject the SchemaBuilder into your handler
property name="schemaBuilder" inject="provider:SchemaBuilder@schema-org";

function index( event, rc, prc, eventName, routedUrl ) {
    // Build the schema objects
    prc.schema = schemaBuilder
        // add the organization schema based on Coldbox config settings
        .organization( getSetting( "schema" ).organization )
        // add the webpage schema based on Coldbox config settings
        .website( getSetting( "schema" ).website )
        // Dynamically build the webpage schema based on the current event and routed URL
        .webpage( function( o ) {
            o.id( prc.canonicalUrl & "$##webpage" )
                .name( prc.pageTitle )
                .description( prc.pageDescription )
                .url( prc.canonicalUrl );
        } );

    // Return the schema as JSON-LD 
    return prc.schema.toJsonLd();
}
```

## Opinionated Best Practices

- Use the canonical URL for url, not the current browser path.
- Include an `Organization` on every main page (for branding/trust).
- Use stable `@id` values (especially for shared entities like authors or logos).
- Use `WebPage` on all routable pages.

## Known Issues

If you're using Adobe ColdFusion (ACF), you may encounter issues when setting a property that is a reserved word in ACF, such as `abstract`, which is found in the [Schema.org `CreativeWork` type](https://schema.org/CreativeWork). To work around this limitation, you can populate the property using a struct or prepend an underscore `_` to the method call, like this:

```cfc
// MyHandler.cfc

// Closure workaround 1
prc.schema = schemaBuilder.creativeWork( function( cw ) {
    cw.id( "https://example.com/##creativeWork" )
        .name( "Example Creative Work" )
        ._abstract( "This is an example abstract." ); 
} );

// Closure workaround 2
prc.schema = schemaBuilder.creativeWork( function( cw ) {
    cw.id( "https://example.com/##creativeWork" )
        .name( "Example Creative Work" )
        .set_abstract( "This is an example abstract." ); 
} );

// Struct workaround
prc.schema = schemaBuilder.creativeWork( {
    id: "https://example.com/##creativeWork",
    name: "Example Creative Work",
    abstract: "This is an example abstract." // no need for underscore
} );
```

## Contributing

Ideas? Bugs? Pull requests welcome! Please include tests when submitting PRs.

## About the Author

This module was forged by [Angry Sam Productions, a California-based web development company](https://www.angrysam.com). We love ColdBox and believe structured data is critical for modern SEO.

## Running Tests

To run the tests, simply run the following command from the root of the project in Commandbox:
`start server-lucee@5.json` (or whichever server JSON you want to use)
`server open` (to open the server in your browser)
navigate to `/tests/runner.cfm` in your browser.

## Disclaimer

This module is provided "as is" without warranty of any kind. Use at your own risk. The author is not responsible for any issues that may arise from using this module in your applications.
