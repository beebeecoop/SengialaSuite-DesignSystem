# SDP-001 — Sengiala Design Platform Architecture

## Status
Approved for Foundation Release v0.1.0.

## Architecture

Sengiala Design Platform (SDP) is the parent architecture that coordinates SDS, SDT and SDC.

```text
SDS — standards and principles
  ↓
SDT — reusable design values
  ↓
SDC — reusable components
  ↓
Web, Mobile, Dashboard and Mission Control
```

## Rules

- SDC components shall consume SDT values.
- SDT values shall conform to SDS standards.
- Product-specific exceptions require a documented design decision.
- Accessibility is a platform requirement, not an optional enhancement.
