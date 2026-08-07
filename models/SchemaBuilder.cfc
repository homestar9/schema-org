component 
    hint="SchemaBuilder for creating schema.org types in a chainable manner."
{

    /**
     * Initializes the builder with an empty list of Schema.org nodes.
     */
    function init() {
        variables.schemas = [];
        return this;
    }
    
    /**
     * Treats an unknown method name as a Schema.org type name.
     *
     * A matching type is created and added to the graph. A MethodNotFound error is thrown when
     * no generated type has that name.
     *
     * @missingMethodName The possible Schema.org type name.
     * @missingMethodArguments The values used to initialize the generated type.
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
     * Creates a generated Schema.org type and passes the provided arguments to its init method.
     *
     * Returns null when no generated component has the requested type name. Other errors are rethrown.
     *
     * @type The Schema.org type name, such as "WebPage" or "Organization".
     * @args The arguments passed to the generated type's init method.
     */
    function tryCreatingObject( required string type, struct args = {} ) {
        try {
            return createObject( "component", "schema-org.types.#type#" ).init( argumentCollection = args );
        } catch ( expression e ) {
            
            if ( e.message CONTAINS "Invalid component definition" ) {
                return;
            }

            rethrow;
            
        }
    }

    /**
     * Adds a completed schema node struct to the graph without changing it.
     *
     * Use this method when another library or service already created the Schema.org data.
     *
     * @node A complete Schema.org node struct, such as { "@type": "FAQPage", ... }.
     */
    function addNode( required struct node ) {
        variables.schemas.append( arguments.node );
        return this;
    }

    /**
     * Adds a completed schema node by calling addNode().
     *
     * @node A complete Schema.org node struct.
     */
    function raw( required struct node ) {
        return addNode( arguments.node );
    }

    /**
     * Runs one of two callbacks and keeps the builder chain active.
     *
     * A true condition runs onTrue. A false condition runs onFalse when that callback is provided.
     * This method is based on the when() helper in ColdBox QB.
     *
     * @condition The value that selects which callback runs.
     * @onTrue    The callback to run when condition is true.
     * @onFalse   The optional callback to run when condition is false.
     */
    public function when(
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
     * Returns the current Schema.org graph as a struct.
     */
    struct function get() {
        return this.toGraph();
    }

    /**
     * Returns an HTML script element containing the JSON-LD graph.
     */
    string function render() {
        return this.toScript();
    }
    
    /**
     * Returns every graph node as plain data that can be serialized.
     *
     * A generated type becomes a memento, which is its plain struct form. Raw node structs added
     * through addNode() or raw() stay unchanged.
     */
    array function toArray() {
        return schemas.map( function( schema ) {
            // Generated types inherit getMemento() from BaseType, while raw structs do not. Check
            // for that method instead of using isObject(). BoxLang may not report a component as an
            // object here, which would leave an unserialized component in the graph.
            return ( !isSimpleValue( schema ) && structKeyExists( schema, "getMemento" ) )
                ? schema.getMemento()
                : schema;
        } );
    }

    /**
     * Returns an ordered JSON-LD graph containing @context and the node array.
     *
     * The ordered struct ensures that @context is serialized before @graph on every engine.
     */
    struct function toGraph() {
        var graph = structNew( "ordered" );
        graph[ "@context" ] = "https://schema.org";
        graph[ "@graph" ] = this.toArray();
        return graph;
    }

    /**
     * Serializes the graph as JSON-LD that is safe to place inside an HTML script element.
     *
     * Every less-than sign becomes the JSON Unicode escape \u003c. The parsed JSON value stays the
     * same, but user data cannot create </script>, <!--, or <script text that changes the surrounding
     * HTML. Greater-than signs and ampersands are safe inside a script element and stay readable.
     * Escaping only </ would not block a <!--<script sequence.
     *
     * @return The serialized JSON-LD graph.
     */
    string function toJsonLd() {
        // CFML does not treat a backslash as an escape character inside a string. Build \u003c from
        // the backslash character code so the serialized JSON contains the required Unicode escape.
        var bs = chr( 92 );
        return replace( serializeJson( this.toGraph() ), "<", bs & "u003c", "all" );
    }

    /**
     * Wraps the serialized JSON-LD in an HTML script element.
     * @return The HTML script element containing the JSON-LD graph.
     */
    string function toScript() {
        return '<script type="application/ld+json">' & toJsonLd() & '</script>';
    }   

}
