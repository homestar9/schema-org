component 
    accessors="true"
    hint="Base type for all schema.org types."
{

    property name="@type";
    property name="@id";
    
    /**
     * Init
     * Initializes the BaseType with data.
     * 
     * @data (optional) The data to initialize the BaseType with. This can be a closure, custom function, or a struct of properties.
     */
    BaseType function init( any data={} ) {
        // if the data is a closure or custom function, invoke it with this as the context
        if( isClosure( data ) || isCustomFunction( data ) ) {
            data( this );
        // else if it's a struct, populate this object with the data
        } else if( isStruct( data ) ) {
            populate( data );
        } else {
            throw( "unexpected argument passed to init" );
        }
        
        return this;
    }

    /**
     * Set Id (alias for set@id)
     * 
     * @value The value to set as the ID of the object.
     */
    function setId( required string value ) {
        invoke( this, "set@id", arguments );
        return this;
    }


    function populate( struct data ) {
        // Loop through the data struct and set properties
        for ( var key in data ) {
            invoke( this, key, [ data[ key ] ] );
        }
        return this;
    }


    /**
     * New
     * Instantiates a new type object, intitalizes, and returns it.
     * Use this when you need a nested child object of a type.
     * You don't want to use the builder for this because the builder is for creating the top-level schema chain 
     * itself, not for instantiating objects.
     * @typeName The name of the type to instantiate, e.g. "Thing", "Person", etc.
     * @data (optional) The data to initialize the type with. This can be a closure, custom function, or a struct of properties.
     */
    BaseType function new( required string typeName, any data={} ) {
        return createObject( "component", "schema-org.types.#typeName#" ).init( arguments.data );
    }


    /**
     * onMissingMethod
     * Handles missing methods by attempting to set an attribute with the same name as the missing method.
     * If the method name starts with "set", it will ignore it and not attempt to set an attribute.
     */
    function onMissingMethod( required missingMethodName, required missingMethodArgs ) {
        
        var result = tryAttributeSetter( arguments.missingMethodName, arguments.missingMethodArgs );
		if ( !isNull( result ) ) {
			return result;
		}
        
        throw( type="MethodNotFound", message="Method '#arguments.missingMethodName#'' not found in '#variables[ '@type' ]#', nor could I find a matching setter. This could mean there is no property by that name." );
        
    }

    /**
	 * Attempts to set the missing method arguments as the value of an attribute.
	 *
	 * @missingMethodName       The potential attribute name.
	 * @missingMethodArguments  Any arguments to pass to set for the potential attribute.
	 */
	private any function tryAttributeSetter( required string missingMethodName, struct missingMethodArgs = {} ) {
		
        // if the method name starts with "set", we assume it's a setter and ignore it
        if ( left( arguments.missingMethodName, 3 ) == "set" ) {
			return;
		}

        // if the setter method doesn't exist, we can't set it
        if ( !structKeyExists( this, "set" & arguments.missingMethodName ) ) {
            return;
        }

        // invoke the setter method with the provided arguments
        invoke( this, "set" & arguments.missingMethodName, arguments.missingMethodArgs );
		
		return this;
	}



    /**
	 * Get Deep Properties
	 * Returns an array of an objects properties including those inherited by base classes.
     * Credit: Mementifier
	 *
	 * @metaData (optional) The starting CFML metadata of the entity object. Defaults to the current object.
	 *
	 * @return an array of object properties
	 */
	private array function $getDeepProperties( struct metaData = getMetadata( this ) ){
		var properties = [];

		// if this object extends another object, append any inherited properties.
		if (
			structKeyExists( arguments.metaData, "extends" ) &&
			structKeyExists( arguments.metaData.extends, "properties" )
		) {
			properties.append( $getDeepProperties( arguments.metaData.extends ), true );
		}

		// if this object has properties, append them.
		if ( structKeyExists( arguments.metaData, "properties" ) ) {
			properties.append( arguments.metadata.properties, true );
		}

		return properties;
	}

    /**
     * Get Properties
     * Returns an array of the names of the properties of this object, including those inherited by base classes.
     * @return an array of property names
     */
    private array function getProperties() {
        return $getDeepProperties().map( function( item ) {
            return item.name;
        } );
    }

    /**
	 * Construct a memento representation from an entity according to it's defined this.memento properties.
	 * You can also override those properties defined in a class by using the arguments in this method.
	 *
	 * @includes         The properties array or list to build the memento with alongside the default includes
	 * @excludes         The properties array or list to exclude from the memento alongside the default excludes
	 * @mappers          A struct of key-function pairs that will map properties to closures/lambadas to process the item value.  The closure will transform the item value.
	 * @defaults         A struct of key-value pairs that denotes the default values for properties if they are null, defaults for everything are a blank string.
	 * @ignoreDefaults   If set to true, default includes and excludes will be ignored and only the incoming `includes` and `excludes` list will be used.
	 * @trustedGetters   If set to true, getters will not be checked for in the `this` scope before trying to invoke them.
	 * @iso8601Format    If set to true, will use the ISO 8601 standard for formatting dates
	 * @dateMask         The date mask to use when formatting datetimes. Only used if iso8601Format is false.
	 * @timeMask         The time mask to use when formatting datetimes. Only used if iso8601Format is false.
	 * @profile          The profile to use instead of the defaults
	 * @autoCastBooleans Auto cast boolean values if they are not numeric and isBoolean().
	 */
	struct function getMemento( excludeEmpty = true ){
		
        var includes = getProperties();
		var result = {};

		// Process Includes
		// Please keep at a traditional LOOP to avoid closure reference memory leaks and slowness on some engines.
		for ( var item in includes ) {
			
			var thisValue = invoke( this, "get#item#" );

			if ( isNull( thisValue ) ) {
				
                if ( arguments.excludeEmpty ) {
                    continue;
                }

                result[ item ] = javacast( "null", "" );
			} 
            
            // if simple value, just assign it
            else if ( isSimpleValue( thisValue ) ) {
                result[ item ] = thisValue;
                continue;
            }

			// Array Collections
			else if ( isArray( thisValue ) ) {
				// Map Items into result object
				result[ item ] = [];
				// Again we use traditional loops to avoid closure references and slowness on some engines
				for ( var thisIndex = 1; thisIndex <= arrayLen( thisValue ); thisIndex++ ) {
					// only get mementos from relationships that have mementos, in the event that we have an already-serialized array of structs
					if (
						!isSimpleValue( thisValue[ thisIndex ] ) && structKeyExists(
							thisValue[ thisIndex ],
							"getMemento"
						)
					) {
						// Process the item memento
						result[ item ][ thisIndex ] = thisValue[ thisIndex ].getMemento( arguments.excludeEmpty );
					} else {
						result[ item ][ thisIndex ] = thisValue[ thisIndex ];
					}
				}
			}

			// Single Object Relationships
			else if ( isValid( "component", thisValue ) && structKeyExists( thisValue, "getMemento" ) ) {
				// Process the item memento
				result[ item ] = thisValue.getMemento( arguments.excludeEmpty );
			}

			// we don't know what to do with this item so we return as-is
			else {
				result[ item ] = thisValue;
			}
		}

		// Return memento
		return result;
	}

}