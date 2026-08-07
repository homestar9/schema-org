// --------------------------------------------------------
// AUTO-GENERATED: VideoGame.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.Game" accessors="true" {

    property name="actor" hint="An actor (individual or a group), e.g. in TV, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.";

    property name="actors" hint="An actor, e.g. in TV, radio, movie, video games etc. Actors can be associated with individual items or with a series, episode, clip.";

    property name="applicationCategory" hint="Type of software application, e.g. 'Game, Multimedia'.";

    property name="applicationSubCategory" hint="Subcategory of the application, e.g. 'Arcade Game'.";

    property name="applicationSuite" hint="The name of the application suite to which the application belongs (e.g. Excel belongs to Office).";

    property name="availableOnDevice" hint="Device required to run the application. Used in cases where a specific make/model is required to run the application.";

    property name="cheatCode" hint="Cheat codes to the game.";

    property name="countriesNotSupported" hint="Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.";

    property name="countriesSupported" hint="Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.";

    property name="device" hint="Device required to run the application. Used in cases where a specific make/model is required to run the application.";

    property name="director" hint="A director of e.g. TV, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.";

    property name="directors" hint="A director of e.g. TV, radio, movie, video games etc. content. Directors can be associated with individual items or with a series, episode, clip.";

    property name="downloadUrl" hint="If the file can be downloaded, URL to download the binary.";

    property name="featureList" hint="Features or modules provided by this application (and possibly required by other applications).";

    property name="fileSize" hint="Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.";

    property name="gameEdition" hint="The edition of a video game.";

    property name="gamePlatform" hint="The electronic systems used to play <a href='http://en.wikipedia.org/wiki/Category:Video_game_platforms'>video games</a>.";

    property name="gameServer" hint="The server on which  it is possible to play the game.";

    property name="gameTip" hint="Links to tips, tactics, etc.";

    property name="installUrl" hint="URL at which the app may be installed, if different from the URL of the item.";

    property name="memoryRequirements" hint="Minimum memory requirements.";

    property name="musicBy" hint="The composer of the soundtrack.";

    property name="operatingSystem" hint="Operating systems supported (Windows 7, OS X 10.6, Android 1.6).";

    property name="permissions" hint="Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).";

    property name="playMode" hint="Indicates whether this game is multi-player, co-op or single-player.  The game can be marked as multi-player, co-op and single-player at the same time.";

    property name="processorRequirements" hint="Processor architecture required to run the application (e.g. IA64).";

    property name="releaseNotes" hint="Description of what changed in this version.";

    property name="requirements" hint="Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (examples: DirectX, Java or .NET runtime).";

    property name="runtimePlatform" hint="Runtime platform or script interpreter dependencies (example: Java v1, Python 2.3, .NET Framework 3.0).";

    property name="screenshot" hint="A link to a screenshot image of the app.";

    property name="softwareAddOn" hint="Additional content for a software application.";

    property name="softwareHelp" hint="Software application help.";

    property name="softwareRequirements" hint="Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (examples: DirectX, Java or .NET runtime).";

    property name="softwareVersion" hint="Version of the software instance.";

    property name="storageRequirements" hint="Storage requirements (free space required).";

    property name="supportingData" hint="Supporting data for a SoftwareApplication.";

    property name="trailer" hint="The trailer of a movie or TV/radio series, season, episode, etc.";


    variables[ "@type" ] = "VideoGame";

}
