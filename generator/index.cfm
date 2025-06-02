<cfscript>
/*
========================================================================
  BUILD-TIME CODEGEN: Schema.org → CFML CFCs 

  - Reads schemaorg-all-https.jsonld
  - Finds rdfs:Class → typeName
  - Finds rdf:Property → propName + schema:domainIncludes + rdfs:comment
  - For each typeName with ≥1 prop, writes schemaTypes/typeName.cfc:
      • property name="propName" hint="(description)"
      • public function init() { super.init(typeName); return this; }
  - NO allowedProps array—BaseType.onMissingMethod() uses getMetaData().
========================================================================
*/

inputFile = expandPath( "./schemaorg-all-https.jsonld" );
outputDir = expandPath( "../types/" );

// 1) Read & parse JSON-LD
jsonText = fileRead( inputFile );
data = deserializeJson( jsonText );

// 2) Build lookups
typesMap       = {}; // typesMap[typeName] = { id = "schema:Organization", label = "Organization" }
propertyDomain = {}; // propertyDomain[typeName] = array of propNames
propDetails    = {}; // propDetails[propName] = { id, description, rangeIncludes }

row = 0;

for ( node in data["@graph"] ) {
    
    // 2a) rdfs:Class → typesMap
    // The node type could be an array of values or a simple string
    if ( 
        structKeyExists( node, "@type" ) &&
        (
            (
                isArray( node["@type"] ) && 
                node[ "@type" ].findNoCase( "rdfs:Class" )
            ) || 
            (
                isSimpleValue( node["@type"] ) && 
                node[ "@type" ] == "rdfs:Class"
            )
        )
    ) {
        rawId    = node["@id"];
        typeName = listLast( rawId, ":" );
        typesMap[ typeName ] = {
            id    = rawId,
            label = node[ "rdfs:label" ] ?: typeName
        };
        continue;
    }

    // 2b) rdf:Property → propName & domainIncludes
    if ( 
        structKeyExists( node, "@type" ) &&
        (
            (
                isArray( node["@type"] ) && 
                node[ "@type" ].findNoCase( "rdf:Property" )
            ) || 
            (
                isSimpleValue( node["@type"] ) && 
                node[ "@type" ] == "rdf:Property"
            )
        )
    ) {
        rawPropId = node["@id"];
        propName  = listLast( rawPropId, ":" );
        desc      = node[ "rdfs:comment" ] ?: "";

        propDetails[ propName ] = {
            id = rawPropId,
            description = desc
        };

        // domainIncludes can be a struct or an array of structs
        domains = [];
        if ( structKeyExists( node, "schema:domainIncludes" ) ) {
            if ( isArray( node[ "schema:domainIncludes" ] ) ) {
                for ( d in node[ "schema:domainIncludes" ] ) {
                    arrayAppend( domains, listLast( d["@id"], ":" ) );
                }
            } else {
                arrayAppend( domains, listLast( node[ "schema:domainIncludes" ]["@id"], ":" ) );
            }
        }

        for ( dom in domains ) {
            if ( !structKeyExists(propertyDomain, dom) ) {
                propertyDomain[dom] = [];
            }
            arrayAppend( propertyDomain[dom], propName );
        }
    }
}

// 3) Generate CFC per type
for ( typeName in typesMap ) {
    validProps = propertyDomain[typeName] ?: [];
    if ( arrayLen( validProps ) EQ 0 ) {
        continue; // skip types with no props
    }

    arraySort(validProps, "textnocase");

    cfcPath = outputDir & typeName & ".cfc";
    fh = fileOpen(cfcPath, "write");

    // Header
    fileWriteLine( fh, '// --------------------------------------------------------' );
    fileWriteLine( fh, '// AUTO-GENERATED: #typeName#.cfc' );
    fileWriteLine( fh, '// Do not hand-edit; re-run generator to update.' );
    fileWriteLine( fh, '// --------------------------------------------------------' );

    // Component declaration
    fileWriteLine( fh, 'component extends="schema-org.models.BaseType" accessors="true" output="false" {' );
    fileWriteLine( fh, '' );

    // Explicit property declarations
    for ( propName in validProps ) {
        hintText = propDetails[ propName ].description ?: "";

        // if the hint text is a struct, convert to string
        if ( isStruct( hintText ) ) {
            hintText = hintText.toString();
        }

        // escape pound signs in hint
        hintText = replace( hintText, '##', '####', "all" );

        // Escape double quotes in hint
        hintText = replace( hintText, '"', "'", "all");

        fileWriteLine( fh, 
            '    property name="#propName#" hint="#hintText#";' 
        );
        fileWriteLine( fh, "" );
    }

    // set the typeName variable
    fileWriteLine( fh, "" );
    fileWriteLine( fh, '    variables.typeName = "#typeName#";' );
    fileWriteLine( fh, "" );

    // Close component
    fileWriteLine( fh, "}" );
    fileClose( fh );

    writeOutput( 'Generated #typeName#.cfc<br>' );
}

writeOutput( "<hr>Generation complete. Check /types/ for generated CFCs." );
</cfscript>
