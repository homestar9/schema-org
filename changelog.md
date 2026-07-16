# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

----

## [Unreleased]

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
