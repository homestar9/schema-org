// --------------------------------------------------------
// AUTO-GENERATED: TVSeason.cfc
// Do not hand-edit; re-run generator to update.
// --------------------------------------------------------

component extends="schema-org.types.CreativeWork" accessors="true" {

    property name="actor" hint="An actor (individual or a group), e.g. in TV, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.";

    property name="director" hint="A director of e.g. TV, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.";

    property name="endDate" hint="The end date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="episode" hint="An episode of a TV, radio or game media within a series or season.";

    property name="episodes" hint="An episode of a TV/radio series or season.";

    property name="numberOfEpisodes" hint="The number of episodes in this season or series.";

    property name="partOfSeries" hint="The series to which this episode or season belongs.";

    property name="partOfTVSeries" hint="The TV series to which this episode or season belongs.";

    property name="productionCompany" hint="The production company or studio responsible for the item, e.g. series, video game, episode etc.";

    property name="seasonNumber" hint="Position of the season within an ordered group of seasons.";

    property name="startDate" hint="The start date and time of the item (in [ISO 8601 date format](http://en.wikipedia.org/wiki/ISO_8601)).";

    property name="titleEIDR" hint="An [EIDR](https://eidr.org/) (Entertainment Identifier Registry) [[identifier]] representing at the most general/abstract level, a work of film or television.

For example, the motion picture known as 'Ghostbusters' has a titleEIDR of  '10.5240/7EC7-228A-510A-053E-CBB8-J'. This title (or work) may have several variants, which EIDR calls 'edits'. See [[editEIDR]].

Since schema.org types like [[Movie]], [[TVEpisode]], [[TVSeason]], and [[TVSeries]] can be used for both works and their multiple expressions, it is possible to use [[titleEIDR]] alone (for a general description), or alongside [[editEIDR]] for a more edit-specific description.
";

    property name="trailer" hint="The trailer of a movie or TV/radio series, season, episode, etc.";


    variables[ "@type" ] = "TVSeason";

}
