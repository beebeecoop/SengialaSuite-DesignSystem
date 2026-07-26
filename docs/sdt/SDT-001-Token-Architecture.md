# SDT-001 — Token Architecture

## Purpose

Sengiala Design Tokens provide platform-neutral names and values that connect SDS standards to SDC implementations.

## Token layers

1. **Primitive tokens** — raw colour, size, duration and font values.
2. **Semantic tokens** — purpose-based values such as surface, text, success and danger.
3. **Component tokens** — scoped values for specific components when necessary.

## Initial categories

Colour, typography, spacing, radius, elevation, motion, iconography and theme.

## Rules

- Components consume semantic tokens by default.
- Product code shall not duplicate governed values.
- Token names describe purpose rather than appearance.
- Light and dark themes preserve the same semantic contracts.
- Exports for Flutter and Web are generated from one canonical source.
