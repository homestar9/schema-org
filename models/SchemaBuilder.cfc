component 
    hint="SchemaBuilder for creating schema.org types in a chainable manner."
{

    /**
     * constructor
     * Initializes the SchemaBuilder with an empty schemas array.
     */
    function init() {
        variables.schemas = [];
        return this;
    }
    
    /**
     * onMissingMethod
     * Handles calls to methods that do not exist in the SchemaBuilder.
     * It attempts to create a schema object with the given name and arguments.
     * If successful, it appends the created object to the schemas array.
     * If not, it throws a MethodNotFound exception
     * @missingMethodName The name of the missing method that was called.
     * @missingMethodArguments The arguments that were passed to the missing method.
     */
    function onMissingMethod( required missingMethodName, required missingMethodArguments ) {
        
        var result = tryCreatingObject( arguments.missingMethodName, arguments.missingMethodArguments );
        if ( !isNull( result ) ) {
            variables.schemas.append( result );
            return this;
        }
        
        throw( type="MethodNotFound", message="Method #arguments.missingMethodName# not found in SchemaBuilder. Nor could I find a schema object with that name" );

    }

    /**
     * tryCreatingObject
     * Attempts to create a schema object of the given type with the provided arguments.
     * If the type is invalid or the creation fails, it returns null.
     *
     * @type   The type of schema object to create (e.g., "WebPage", "Organization").
     * @args   A struct of arguments to pass to the object's init method.
     */
    function tryCreatingObject( required string type, struct args = {} ) {
        try {
            // Attempt to create the object with the given type and args
            return createObject( "component", "schema-org.types.#type#" ).init( argumentCollection = args );
        } catch ( expression e ) {
            
            if ( e.message CONTAINS "Invalid component definition" ) {
                return;
            }

            rethrow;
            
        }
    }

    /**
     * When is a useful helper method that introduces if / else control flow without breaking chainability.
     * When the `condition` is true, the `onTrue` callback is triggered.  
     * If the `condition` is false and an `onFalse` callback is passed, it is triggered.  Otherwise, the builder is returned.
     * Inspired and stolen from: Elpete's QB (https://github.com/coldbox-modules/qb/)
     *
     * @condition       A boolean condition that if true will trigger the `onTrue` callback. If not true, the `onFalse` callback will trigger if it was passed. Otherwise, the query is returned unmodified.
     * @onTrue          A closure that will be triggered if the `condition` is true.
     * @onFalse         A closure that will be triggered if the `condition` is false.
     */
    public QueryBuilder function when(
        required boolean condition,
        required function onTrue,
        function onFalse
    ) {
        var defaultCallback = function( sb ) {
            return sb;
        };
        arguments.onFalse = isNull( arguments.onFalse ) ? defaultCallback : arguments.onFalse;

        if ( arguments.condition ) {
            arguments.onTrue( this );
        } else {
            arguments.onFalse( this );
        }

        return this;
    }

    /**
     * get
     * Returns the current state of the SchemaBuilder as a graph.
     * This is the main method to retrieve the built schema.
     */
    struct function get() {
        return this.toGraph();
    }

    /**
     * render
     * Returns the schema as a script tag containing JSON-LD.
     * This is useful for embedding the schema in HTML pages.
     */
    string function render() {
        return this.toScript();
    }
    
    /**
     * toArray
     * Converts the schemas array to an array of mementos.
     * Each schema object is converted to its memento representation.
     */
    array function toArray() {
        return schemas.map( function( schema ) {
            return schema.getMemento();
        } );
    }

    /**
     * toGraph
     * Converts the schemas array to a graph format.
     * This is a struct with a context and an array of schemas.
     */
    struct function toGraph() {
        return {
            "@context": "https://schema.org",
            "@graph": this.toArray()
        };
    }

    /**
     * toJsonLd
     * Serializes the schema to JSON-LD format.
     * This is useful for embedding the schema in HTML pages.
     * @return A string containing the JSON-LD representation of the schema.
     */
    string function toJsonLd() {
        return serializeJson( this.toGraph() );
    }

    /**
     * toScript
     * Returns the schema as a script tag containing JSON-LD.
     * This is useful for embedding the schema in HTML pages.
     * @return A string containing the script tag with JSON-LD.
     */
    string function toScript() {
        return '<script type="application/ld+json">' & toJsonLd() & '</script>';
    }   

}