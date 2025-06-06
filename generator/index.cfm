<cfscript>
/*
========================================================================
  BUILD-TIME CODEGEN: Schema.org → CFML CFCs (with inheritance)

  - Reads schemaorg-all-https.jsonld
  - Finds rdfs:Class → typeName + immediate parent via rdfs:subClassOf
  - Finds rdf:Property → propName + schema:domainIncludes + rdfs:comment
  - For each typeName with ≥1 prop, writes schemaTypes/typeName.cfc:
      • “extends” correct parent (if that parent is in typesMap),
        otherwise extends BaseType
      • explicit property declarations (no setters)
      • public function init() { super.init(typeName); return this; }
  - NO allowedProps array—BaseType.onMissingMethod() uses getMetaData().
========================================================================
*/

inputFile  = expandPath( "./schemaorg-all-https.jsonld" );
outputDir  = expandPath( "../types/" );

reservedKeywords = [ "abstract" ];
mappers = {};

// 1) Read & parse JSON-LD
jsonText = fileRead( inputFile );
data     = deserializeJson( jsonText );

// 2) Build lookups
typesMap       = {}; // typesMap[typeName] = { id, label, parent }
propertyDomain = {}; // propertyDomain[typeName] = [ propName, ... ]
propDetails    = {}; // propDetails[propName] = { id, description, rangeIncludes }

// Pass 1: Collect each rdfs:Class and its immediate rdfs:subClassOf parent (if any)
for ( node in data["@graph"] ) {
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

        // Look for an immediate parent via rdfs:subClassOf
        parentName = ""; 
        if ( structKeyExists(node, "rdfs:subClassOf") ) {
            if ( isArray(node["rdfs:subClassOf"]) ) {
                // Take first parent if multiple
                parentRaw = node["rdfs:subClassOf"][1]["@id"];
            } else {
                parentRaw = node["rdfs:subClassOf"]["@id"];
            }
            parentName = listLast(parentRaw, ":");
        }

        typesMap[typeName] = {
            id     = rawId,
            label  = label,
            parent = parentName  // blank if no subClassOf
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
            if ( isArray(node["schema:domainIncludes"]) ) {
                for ( d in node["schema:domainIncludes"] ) {
                    arrayAppend(domains, listLast(d["@id"], ":"));
                }
            } else {
                arrayAppend(domains, listLast(node["schema:domainIncludes"]["@id"], ":"));
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
    validProps = propertyDomain[typeName] ?: [];

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

        if ( isStruct(hintText) ) {
            // Convert struct to string if needed
            hintText = hintText.toString();
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

    writeOutput('Generated ' & typeName & '.cfc (extends ' & (parentName ?: "BaseType") & ')<br>');
}

writeOutput('<hr>Generation complete. Check /types/ for generated CFCs.');
</cfscript>