# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

----

## [Unreleased]

## [1.2.0] - 2026-08-06

### Fixed

* Types with more than one schema.org parent lost every property from the extra parents. CFML has
  single inheritance, so the generator kept the first `rdfs:subClassOf` parent and discarded the
  rest. `LocalBusiness` is a subclass of both `Organization` and `Place`, so `geo`,
  `openingHoursSpecification`, `latitude`, `longitude` and 28 other `Place` properties were missing
  from `LocalBusiness` and from every local business subtype, `Plumber` included. Those properties
  are now flattened into the type that needs them, without being redeclared by its subtypes.
  163 types gain properties.
* Reserved-keyword mappers leaked between types. The generator built its `mappers` struct once and
  never reset it, so 650 of 923 files carried an `_abstract` mapper for a property they never
  declared. Only the types that declare the property carry the mapper now. This was harmless at
  runtime — `getMemento()` only transforms keys that are present — but the output was wrong.
* The generator matched vocabulary nodes by short name and ignored the namespace prefix, so classes
  from other ontologies could overwrite same-named schema.org types. Classes, parents and
  `domainIncludes` are now restricted to schema.org's own namespace.
* Property hints built from a `rdfs:comment` that arrives as a language-tagged object read
  `{@language={en}, @value={...}}` instead of the description. Affected `collectionSize`,
  `holdingArchive`, `itemLocation` and `archiveHeld`.
* The test suite's per-type instantiation check resolved `types/` with `expandPath()`, which
  resolves against the running template rather than the spec file. It found nothing and contributed
  zero specs, so no generated type was ever actually compiled by the suite. It now covers all 937.

### Added

* Regression specs for multi-parent property access, for per-type mapper isolation, and a check
  that no type declares the same property twice anywhere in its inheritance chain.
* The generator reports files in `types/` that no longer match a class in the vocabulary.

### Changed

* The bundled schema.org vocabulary is refreshed to the current release. 923 types become 937; no
  type was removed. New types: `AuthenticateAction`, `ConferenceEvent`, `Credential`,
  `DENonprofitType`, `Error`, `ITNonprofitType`, `InstantaneousEvent`, `LoginAction`,
  `OnlineMarketplace`, `OperatingSystem`, `PerformingArtsEvent`, `ResetPasswordAction`,
  `RuntimePlatform`, `SequentialArt`.
* 26 types now extend a different parent, following upstream vocabulary changes — for example
  `Dentist` moves from `MedicalOrganization` to `LocalBusiness`, and `TVSeries` from
  `CreativeWorkSeries` to `CreativeWork`. No type loses a property as a result, because every
  parent's properties are flattened into the child. Only `isInstanceOf()` checks against a specific
  ancestor can tell the difference.
* `Quantity` is now modeled upstream as a `DataType` rather than a subclass of `Intangible`, so
  `Quantity`, `Distance`, `Duration`, `Energy` and `Mass` no longer carry `Thing` properties such as
  `name`, `url` and `description`. `DataType` itself no longer extends `Class`; it only did so
  because `rdfs:Class` and `schema:Class` shorten to the same name.

## [1.1.0] => 2026-JUL-16

### Added

* `SchemaBuilder.addNode( node )` (alias `raw( node )`): append a pre-built node struct to the graph verbatim, so schema fragments produced elsewhere (e.g. by a CMS) can be merged into a page graph.

### Fixed

* `toJsonLd()` now escapes `</` as `<\/` (still valid JSON) so content containing a closing script tag cannot break out of the surrounding `<script>` element.
* `toGraph()` and `getMemento()` now build ordered structs, so `@context` reliably precedes `@graph` and `@type` leads each node — deterministic output across engines.
* `when()` declared a bogus `QueryBuilder` return type (a leftover from QB) and threw the moment it was called; it now returns the builder as intended.
* `getMemento()` no longer mutates its result struct while iterating it when applying reserved-keyword mappers (a latent ConcurrentModificationException risk).

## [1.0.0] => 2021-JAN-01

* First iteration of this module
