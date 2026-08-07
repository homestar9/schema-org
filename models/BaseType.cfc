component 
    accessors="true"
    hint="Base type for all schema.org types."
{

    property name="@type";
    property name="@id";


    variables._mappers = {}; // Maps safe CFML property names back to reserved Schema.org names.
    
    /**
     * Initializes this Schema.org type from a callback or a struct of property values.
     * 
     * @data A closure, custom function, or struct used to set the initial property values.
     */
    BaseType function init( any data={} ) {
        // A callback receives this type so the caller can set properties with chained methods.
        if( isClosure( data ) || isCustomFunction( data ) ) {
            data( this );
        } else if( isStruct( data ) ) {
            populate( data );
        } else {
            throw( "unexpected argument passed to init" );
        }
        
        return this;
    }

    /**
     * Sets the Schema.org @id value without requiring a method name that contains @.
     * 
     * @value The Schema.org identifier to store in @id.
     */
    function setId( required string value ) {
        variables["@id"] = value;
        return this;
    }

    /**
     * Returns the Schema.org @id value without requiring a method name that contains @.
     */
    function getId() {
        return variables["@id"];
    }


    function populate( struct data ) {
        for ( var key in data ) {
            invoke( this, key, [ data[ key ] ] );
        }
        return this;
    }


    /**
     * Creates and initializes a Schema.org type for use as a nested object.
     *
     * SchemaBuilder adds objects to the top-level graph. This method creates a child object without
     * adding the child to that graph.
     *
     * @typeName The Schema.org type name, such as "Thing" or "Person".
     * @data A closure, custom function, or struct used to set the initial property values.
     */
    BaseType function new( required string typeName, any data={} ) {
        return createObject( "component", "schema-org.types.#typeName#" ).init( arguments.data );
    }


    /**
     * Treats an unknown method as a fluent property setter when a matching setter exists.
     *
     * A missing method whose name starts with "set" is not retried. This rule prevents an unknown
     * setter from being treated as a property name.
     */
    function onMissingMethod( required missingMethodName, required missingMethodArguments ) {
        
        var result = tryAttributeSetter( arguments.missingMethodName, arguments.missingMethodArguments );
		if ( !isNull( result ) ) {
			return result;
		}
        
        // BaseType does not set @type. Reading the missing value would throw another error and hide
        // the intended MethodNotFound error, so use the component name as a fallback.
        var typeName = variables[ "@type" ] ?: "BaseType";
        throw( type="MethodNotFound", message="Method '#arguments.missingMethodName#' not found in '#typeName#', nor could I find a matching setter. This could mean there is no property by that name." );
        
    }

    /**
	 * Calls the matching generated property setter for an unknown fluent method.
	 *
	 * @missingMethodName       The possible property name.
	 * @missingMethodArguments  The values passed to the unknown method.
	 */
	private any function tryAttributeSetter( required string missingMethodName, struct missingMethodArgs = {} ) {
		
        // Do not reinterpret an unknown explicit setter as a property name.
        if ( left( arguments.missingMethodName, 3 ) == "set" ) {
			return;
		}

        if ( structKeyExists( this, "set" & arguments.missingMethodName ) ) {
            invoke( this, "set" & arguments.missingMethodName, arguments.missingMethodArgs );
            return this;

        // Generated setters add an underscore before names that are reserved words in CFML.
        } else if ( structKeyExists( this, "set_" & arguments.missingMethodName ) ) {
            invoke( this, "set_" & arguments.missingMethodName, arguments.missingMethodArgs );
            return this;
        }
		
		return;

	}



    /**
	 * Returns property metadata from this component and every parent component.
	 *
	 * Parent properties are returned first. This method is based on Mementifier.
	 *
	 * @metaData The component metadata where the search starts. The default is this component.
	 *
	 * @return Property metadata from the complete inheritance chain.
	 */
	private array function $getDeepProperties( struct metaData = getMetadata( this ) ){
		var properties = [];

		// Read parent metadata first so inherited properties keep their declaration order.
		if (
			structKeyExists( arguments.metaData, "extends" ) &&
			structKeyExists( arguments.metaData.extends, "properties" )
		) {
			properties.append( $getDeepProperties( arguments.metaData.extends ), true );
		}

		if ( structKeyExists( arguments.metaData, "properties" ) ) {
			properties.append( arguments.metadata.properties, true );
		}

		return properties;
	}

    /**
     * Returns the property names declared by this component and its parent components.
     *
     * @return Property names from the complete inheritance chain.
     */
    private array function getProperties() {
        return $getDeepProperties().map( function( item ) {
            return item.name;
        } );
    }

    /**
	 * Converts this component into a plain struct that can be serialized as JSON-LD.
	 *
	 * A memento is the plain data form of a component. Nested Schema.org components are converted
	 * into mementos too. Simple values and existing structs keep their current values.
	 *
	 * @excludeEmpty Exclude properties whose value is null. When false, include them as JSON null.
	 */
	struct function getMemento( excludeEmpty = true ){
		
        var includes = getProperties();
        // An ordered struct keeps @type first and produces the same property order on every engine.
		var result = structNew( "ordered" );

		// Use a standard loop here. Closures can retain references and run slowly on some CFML engines.
		for ( var item in includes ) {
			
			var thisValue = invoke( this, "get#item#" );

			if ( isNull( thisValue ) ) {
				
                if ( arguments.excludeEmpty ) {
                    continue;
                }

                result[ item ] = javacast( "null", "" );
			} 
            
            else if ( isSimpleValue( thisValue ) ) {
                result[ item ] = thisValue;
                continue;
            }

			else if ( isArray( thisValue ) ) {
				result[ item ] = [];
				// Use a standard loop to avoid the closure cost described above.
				for ( var thisIndex = 1; thisIndex <= arrayLen( thisValue ); thisIndex++ ) {
					// Convert nested components, but keep array items that are already plain data.
					if (
						!isSimpleValue( thisValue[ thisIndex ] ) && structKeyExists(
							thisValue[ thisIndex ],
							"getMemento"
						)
					) {
						result[ item ][ thisIndex ] = thisValue[ thisIndex ].getMemento( arguments.excludeEmpty );
					} else {
						result[ item ][ thisIndex ] = thisValue[ thisIndex ];
					}
				}
			}

			else if ( isValid( "component", thisValue ) && structKeyExists( thisValue, "getMemento" ) ) {
				result[ item ] = thisValue.getMemento( arguments.excludeEmpty );
			}

			// Keep values that are not simple values, arrays, or supported Schema.org components.
			else {
				result[ item ] = thisValue;
			}
		}

        // Mappers restore Schema.org names that are reserved words in CFML. Iterate over a copy
        // of the keys because changing an ordered struct during direct iteration fails on some engines.
        if ( !variables._mappers.isEmpty() ) {
            for ( var key in result.keyArray() ) {
                if ( hasMapper( key ) ) {
                    result[ variables._mappers[ key ] ] = result[ key ];
                    result.delete( key );
                }
            }
        }
		

		return result;
	}

    private boolean function hasMapper( string key ) {
        return variables._mappers.keyExists( key );
    }

}
