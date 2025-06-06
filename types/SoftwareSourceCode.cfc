// --------------------------------------------------------
// AUTO-GENERATED: SoftwareSourceCode.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="codeRepository" hint="Link to the repository where the un-compiled, human readable code and related code is located (SVN, GitHub, CodePlex).";

    property name="codeSampleType" hint="What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.";

    property name="programmingLanguage" hint="The computer programming language.";

    property name="runtime" hint="Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).";

    property name="runtimePlatform" hint="Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).";

    property name="sampleType" hint="What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.";

    property name="targetProduct" hint="Target Operating System / Product to which the code applies.  If applies to several versions, just the product name can be used.";


    variables[ "@type" ] = "SoftwareSourceCode";

}
