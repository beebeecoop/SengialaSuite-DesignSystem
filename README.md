# SengialaSuite Design System

> Official Design Platform for the M5 SengialaSuite ecosystem.

SengialaSuite Design System provides the shared design language, design tokens and reusable components used across SengialaSuite Web, Mobile, Dashboard, Mission Control and future products.

## Architecture

- **SDP — Sengiala Design Platform:** platform architecture, governance, packaging and release model.
- **SDS — Sengiala Design System:** principles, philosophy, standards and design governance.
- **SDT — Sengiala Design Tokens:** platform-neutral visual and interaction values.
- **SDC — Sengiala Design Components:** reusable user-interface components and patterns.

## Releases

- **v0.1.0 — Foundation Stone:** design platform architecture and governance baseline.
- **v0.2.0 — Design Tokens Foundation:** approved token architecture and platform mapping.
- **v0.3.0 — Sengiala Component Library:** first executable Flutter core-component package.
- **SDT-002 v1.0.0 — Official Sengiala Typography:** Inter Variable for UI + Plus Jakarta Sans for headings; owner approved 15 Nov 2026, product rollout separately gated.

The v0.3.0 component library is located at `packages/sengiala_component_library/`.

## Official typography

The canonical typography contract is `tokens/typography.json`. See [SDT-002](docs/sdt/SDT-002-Official-Sengiala-Typography-Standard.md). Run `python scripts/export_typography.py` to regenerate Web and Flutter exports from the same source. Historical releases are not overwritten.

Documentation is located under `docs/`.

## Guiding statement

**One Design Language. One Design Platform. Multiple Sengiala Products.**

## Status

The Foundation and Design Token baselines are established. Core Sengiala Design Components are in prototype validation before production certification. SDT-002 is an owner-approved standard; individual implementations still require their own rollout certification.
