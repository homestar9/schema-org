component 
    hint="SchemaBuilder for creating schema.org types in a chainable manner."
{

    /**
     * init
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
     */
    function onMissingMethod( required missingMethodName, required missingMethodArgs ) {
        
        var result = tryCreatingObject( missingMethodName, missingMethodArgs );
        if ( !isNull( result ) ) {
            variables.schemas.append( result );
            return this;
        }
        
        throw( type="MethodNotFound", message="Method #missingMethodName# not found in SchemaBuilder. Nor could I find a schema object with that name" );

    }

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


    function toArray() {
        return schemas.map( function( schema ) {
            return schema.getMemento();
        } );
    }

    function toStruct() {
        return {
            "@context": "https://schema.org",
            "@graph": toArray()
        };
    }

    function toJsonLd() {
        return serializeJson( toStruct() )
    };

}