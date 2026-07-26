# SDP-004 — Package Architecture

## Planned packages

- Flutter package for SengialaSuite-Mobile.
- Web package for SengialaSuite Web and Mission Control.
- Platform-neutral token distribution.

## Principles

- Packages consume generated tokens from one governed source.
- Public APIs use stable Sengiala naming.
- Platform adaptations may differ internally while preserving shared semantics.
- Components shall support theming, accessibility and localisation.
- Package releases follow semantic versioning and publish migration notes for breaking changes.
