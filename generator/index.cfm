<cfscript>
/*
========================================================================
  BUILD-TIME CODEGEN: Schema.org → CFML CFCs (with inheritance)

  - Reads schemaorg-all-https.jsonld
  - Finds rdfs:Class → typeName + parents via rdfs:subClassOf
  - Finds rdf:Property → propName + schema:domainIncludes + rdfs:comment
  - For each typeName, writes types/typeName.cfc:
      • “extends” the first parent (if that parent is in typesMap),
        otherwise extends BaseType
      • explicit property declarations (no setters), including the properties
        that only reach this type through a second or third parent
      • variables[ "@type" ] and any reserved-keyword mappers
  - NO allowedProps array—BaseType.onMissingMethod() uses getMetaData().
========================================================================
*/

inputFile  = expandPath( "./schemaorg-all-https.jsonld" );
outputDir  = expandPath( "../types/" );

// Only nodes in schema.org's own namespace become types. The vocabulary file also carries classes
// and properties from external ontologies (unece, snomed, gs1, fibo, vcard, foaf, ...) that exist
// so schema.org can state equivalences. Their short names collide with real schema.org types —
// "fibo-fnd-org-org:Organization" also shortens to "Organization" — so without this filter they
// overwrite real types and add junk files such as "50731006.cfc".
schemaNs    = "schema:";
schemaNsLen = len( schemaNs );

reservedKeywords = [ "abstract" ];

// 1) Read & parse JSON-LD
jsonText = fileRead( inputFile );
data     = deserializeJson( jsonText );

// 2) Build lookups
typesMap       = {}; // typesMap[typeName] = { id, label, parent, parents }
propertyDomain = {}; // propertyDomain[typeName] = [ propName, ... ]
propDetails    = {}; // propDetails[propName] = { id, description, rangeIncludes }

// Memo caches for the inheritance walk. See declaredProps() below.
declaredCache  = {};
inheritedCache = {};


/**
 * True when an @id belongs to schema.org's own namespace.
 *
 * @id The raw "@id" of a JSON-LD node, e.g. "schema:Organization".
 */
boolean function isSchemaId( required string id ) {
    return left( arguments.id, schemaNsLen ) eq schemaNs;
}


/**
 * Every ancestor reachable through ANY parent, walked transitively.
 *
 * This has to be both multi-parent aware and transitive. Dentist has three parents, and one of
 * them (LocalBusiness) is itself multi-parent, so looking one level up is not enough.
 *
 * @typeName The type whose ancestors are wanted. Not included in the result.
 */
array function allAncestors( required string typeName ) {
    var seen    = {};
    var stack   = [];
    var current = "";
    var parent  = "";

    for ( parent in typesMap[ arguments.typeName ].parents ) {
        arrayAppend( stack, parent );
    }

    while ( arrayLen( stack ) ) {
        current = stack[ arrayLen( stack ) ];
        arrayDeleteAt( stack, arrayLen( stack ) );

        if (
            current eq arguments.typeName
            or !structKeyExists( typesMap, current )
            or structKeyExists( seen, current )
        ) {
            continue;
        }

        seen[ current ] = true;

        for ( parent in typesMap[ current ].parents ) {
            arrayAppend( stack, parent );
        }
    }

    return structKeyArray( seen );
}


/**
 * Everything the generated "extends" chain already declares for this type.
 *
 * Follows only the primary parent, because that single chain is all CFML inheritance gives us.
 * Returns a struct used as a set: keys are property names.
 *
 * @typeName The type to look up.
 * @visiting Recursion guard shared with declaredProps(). Do not pass this yourself.
 */
struct function inheritedProps( required string typeName, struct visiting = {} ) {
    if ( structKeyExists( inheritedCache, arguments.typeName ) ) {
        return inheritedCache[ arguments.typeName ];
    }

    var guardKey = "inherited:" & arguments.typeName;
    if ( structKeyExists( arguments.visiting, guardKey ) ) {
        return {};
    }
    arguments.visiting[ guardKey ] = true;

    var result = {};
    var parent = typesMap[ arguments.typeName ].parent;

    if ( len( parent ) and structKeyExists( typesMap, parent ) ) {
        structAppend( result, declaredProps( parent, arguments.visiting ) );
        structAppend( result, inheritedProps( parent, arguments.visiting ) );
    }

    structDelete( arguments.visiting, guardKey );

    inheritedCache[ arguments.typeName ] = result;
    return result;
}


/**
 * The property set this type should declare in its own CFC:
 *
 *     declared(T) = ( own(T) ∪ own(every ancestor of T) ) − inherited(T)
 *
 * The union pulls in properties that CFML's single "extends" clause cannot reach. A class with
 * several parents extends only the first one, so without this every property from the second and
 * third parents would be missing — that is why LocalBusiness (Organization + Place) had no "geo".
 *
 * The subtraction uses what the extends chain DECLARES, not merely what those ancestors own.
 * That distinction is the whole point: once LocalBusiness declares Place's 32 properties, every
 * LocalBusiness subtype reaches Place as an ancestor too. Subtracting only the ancestors' own
 * properties would make all 127 subtypes repeat the same 32 declarations.
 *
 * Memoized, so the answer does not depend on the order typesMap happens to iterate in.
 *
 * @typeName The type to compute declarations for.
 * @visiting Recursion guard shared with inheritedProps(). Do not pass this yourself.
 */
struct function declaredProps( required string typeName, struct visiting = {} ) {
    if ( structKeyExists( declaredCache, arguments.typeName ) ) {
        return declaredCache[ arguments.typeName ];
    }

    // The vocabulary is acyclic today, but do not assume a future release stays that way.
    if ( structKeyExists( arguments.visiting, arguments.typeName ) ) {
        return {};
    }
    arguments.visiting[ arguments.typeName ] = true;

    var inherited = inheritedProps( arguments.typeName, arguments.visiting );
    var result    = {};
    var propName  = "";
    var ancestor  = "";

    for ( propName in ( propertyDomain[ arguments.typeName ] ?: [] ) ) {
        if ( !structKeyExists( inherited, propName ) ) {
            result[ propName ] = true;
        }
    }

    for ( ancestor in allAncestors( arguments.typeName ) ) {
        for ( propName in ( propertyDomain[ ancestor ] ?: [] ) ) {
            if ( !structKeyExists( inherited, propName ) ) {
                result[ propName ] = true;
            }
        }
    }

    structDelete( arguments.visiting, arguments.typeName );

    declaredCache[ arguments.typeName ] = result;
    return result;
}


// Pass 1: Collect each rdfs:Class with all of its rdfs:subClassOf parents, and each rdf:Property
for ( node in data["@graph"] ) {

    // Ignore anything outside schema.org's own namespace (see schemaNs above)
    if ( not structKeyExists(node, "@id") or not isSchemaId( node["@id"] ) ) {
        continue;
    }

    // 2a) Identify rdfs:Class nodes
    if (
        structKeyExists(node, "@type")
        and
        (
            ( isArray(node["@type"]) and node["@type"].findNoCase("rdfs:Class") )
            or
            ( not isArray(node["@type"]) and node["@type"] eq "rdfs:Class" )
        )
    ) {
        rawId    = node["@id"];              // e.g. "schema:Organization"
        typeName = listLast(rawId, ":");     // e.g. "Organization"
        label    = node["rdfs:label"] ?: typeName;

        // Keep EVERY parent. parents[1] becomes the "extends" target and the rest are flattened
        // into declared properties by declaredProps(), because CFML has single inheritance.
        parents = [];
        if ( structKeyExists(node, "rdfs:subClassOf") ) {
            parentNodes = isArray( node["rdfs:subClassOf"] )
                ? node["rdfs:subClassOf"]
                : [ node["rdfs:subClassOf"] ];

            for ( parentNode in parentNodes ) {
                // Some classes are declared a subclass of an external ontology class as well —
                // Error extends both sarif:Result and schema:InstantaneousEvent — and only the
                // schema.org one is a type we generate.
                if ( isSchemaId( parentNode["@id"] ) ) {
                    arrayAppend( parents, listLast( parentNode["@id"], ":" ) );
                }
            }
        }

        typesMap[typeName] = {
            id      = rawId,
            label   = label,
            parent  = ( arrayLen( parents ) ? parents[ 1 ] : "" ), // blank if no schema.org parent
            parents = parents
        };

        continue;
    }

    // 2b) Identify rdf:Property nodes
    if (
        structKeyExists(node, "@type")
        and
        (
            ( isArray(node["@type"]) and node["@type"].findNoCase("rdf:Property") )
            or
            ( not isArray(node["@type"]) and node["@type"] eq "rdf:Property" )
        )
    ) {
        rawPropId = node["@id"];              // e.g. "schema:name"
        propName  = listLast(rawPropId, ":"); // e.g. "name"
        desc      = node["rdfs:comment"] ?: "";

        // Only grab rangeIncludes if it actually exists; otherwise default to []
        rangeInc = [];
        if ( structKeyExists( node, "schema:rangeIncludes") ) {
            rangeInc = isArray( node["schema:rangeIncludes"] )
                ? node["schema:rangeIncludes"]
                : [ node["schema:rangeIncludes"] ];
        }

        propDetails[propName] = {
            id          = rawPropId,
            description = desc,
            rangeIncludes = rangeInc // if needed later
        };

        // Collect domainIncludes→which types this property belongs to
        domains = [];
        if ( structKeyExists(node, "schema:domainIncludes") ) {
            domainNodes = isArray( node["schema:domainIncludes"] )
                ? node["schema:domainIncludes"]
                : [ node["schema:domainIncludes"] ];

            for ( d in domainNodes ) {
                if ( isSchemaId( d["@id"] ) ) {
                    arrayAppend(domains, listLast(d["@id"], ":"));
                }
            }
        }

        for ( dom in domains ) {
            if ( not structKeyExists(propertyDomain, dom) ) {
                propertyDomain[dom] = [];
            }
            arrayAppend(propertyDomain[dom], propName);
        }
    }
}

// 3) Pass 2: Generate one CFC per type, using the correct extends clause
for ( typeName in typesMap ) {

    // Reset per type. Declared once at file scope this accumulated across the whole run, so every
    // type generated after the first reserved-keyword hit carried a mapper it never needed.
    mappers = {};

    // A fresh array, not a reference into propertyDomain — arraySort() sorts in place.
    validProps = structKeyArray( declaredProps( typeName ) );

    // Determine the correct "extends" target
    parentName = typesMap[typeName].parent;
    if ( len(parentName) and structKeyExists(typesMap, parentName) ) {
        // Parent is another generated type:
        extendsLine = 'extends="schema-org.types.' & parentName & '"';
    } else {
        // No valid parent → extend BaseType
        extendsLine = 'extends="schema-org.models.BaseType"';
    }

    arraySort(validProps, "textnocase");

    cfcPath = outputDir & typeName & ".cfc";
    fh      = fileOpen(cfcPath, "write");

    // --- Header ---
    fileWriteLine(fh, '// --------------------------------------------------------');
    fileWriteLine(fh, '// AUTO-GENERATED: ' & typeName & '.cfc');
    fileWriteLine(fh, '// Do not hand-edit; re-run generator to update.');
    fileWriteLine(fh, '// --------------------------------------------------------');
    fileWriteLine(fh, '');

    // --- Component declaration with proper extends ---
    fileWriteLine(fh, 'component ' & extendsLine & ' accessors="true" {');
    fileWriteLine(fh, '');

    // --- Explicit property declarations ---
    for ( propName in validProps ) {
        hintText = propDetails[propName].description ?: "";

        // A few comments arrive as { "@language": "en", "@value": "..." } rather than a plain
        // string. Read the text out of them; toString() produced "{@language={en}, @value={...}}".
        if ( isStruct(hintText) ) {
            hintText = hintText[ "@value" ] ?: "";
        }
        // Escape any '##' for CFML interpolation
        hintText = replace(hintText, '##', '####', "all");
        // Escape double quotes
        hintText = replace(hintText, '"', "'", "all");

        // if this property is a reserved keyword, prefix it with an underscore
        if ( reservedKeywords.findNoCase( propName ) ) {
            mappers[ "_" & propName ] = propName; // add to mapper so _propname will output as propName
            propName = "_" & propName; // append underscore to property name
        }

        fileWriteLine(
            fh,
            '    property name="' & propName & '" hint="' & hintText & '";'
        );
        fileWriteLine(fh, "");
    }

    // set the typeName variable
    fileWriteLine( fh, "" );
    fileWriteLine( fh, '    variables[ "@type" ] = "#typeName#";' );
    fileWriteLine( fh, "" );

    // set mappers for reserved keywords
    if ( !mappers.isEmpty() ) {
        for( key in mappers ) {
            fileWriteLine( fh, '    variables._mappers[ "' & key & '" ] = "' & mappers[ key ] & '";' );
        }
        fileWriteLine( fh, "" );
    }

    // Close component
    fileWriteLine(fh, '}');
    fileClose(fh);

    writeOutput('Generated ' & typeName & '.cfc (extends ' & ( len(parentName) ? parentName : "BaseType" ) & ')<br>');
}

// 4) Report files in types/ that no longer match a class in the vocabulary. They are only listed,
// never deleted: types/ is tracked in git, and a stale file produces no diff to notice.
orphans = [];
for ( existingFile in directoryList( outputDir, false, "name", "*.cfc" ) ) {
    if ( not structKeyExists( typesMap, listFirst( existingFile, "." ) ) ) {
        arrayAppend( orphans, existingFile );
    }
}

writeOutput('<hr>Generated ' & structCount(typesMap) & ' types. Check /types/ for generated CFCs.<br>');

if ( arrayLen( orphans ) ) {
    writeOutput('<br><strong>Orphaned files (no matching class in the vocabulary — delete by hand):</strong><br>');
    writeOutput( arrayToList( orphans, "<br>" ) );
} else {
    writeOutput('No orphaned files.');
}
</cfscript>
