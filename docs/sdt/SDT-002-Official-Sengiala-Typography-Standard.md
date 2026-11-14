# SDT-002 — Official Sengiala Typography Standard

**Status:** Approved design decision (15 November 2026, MYT)
**Standard:** SDT-002 v1.0.0, Option C
**Scope:** SengialaSuite, Sengiala Horizon, Dashboard Sengiala, Sengiala Living Lab and planned WebPortal.
**Approval authority:** Product owner has approved Inter + Plus Jakarta Sans for Sengiala Horizon; source integration and production deployment remain separate release gates.

## 1. Decision and intent

Use **Inter Variable** as the primary UI font and **Plus Jakarta Sans** for major headings and Dashboard headings. Use Inter with tabular numerals for financial data. A calmer, more legible UI supports the cooperative and Living Lab workflows described by SDS-001 and SDS-002; it must remain accessible, professional and easy to read in Bahasa Melayu and English.

The canonical machine-readable source is `tokens/typography.json`. `scripts/export_typography.py` generates Web CSS and Flutter token constants from that source. Do not hand-edit generated exports or duplicate canonical values in product repositories. Product adapters may define selectors but must consume semantic tokens.

## 2. Primitive font families

| Token | Family | Purpose |
|---|---|---|
| `font.family.sans` | Inter Variable | Native UI, body, menus, forms, tables |
| `font.family.display` | Plus Jakarta Sans | Page headings, section headings, Dashboard cards |
| `font.family.mono` | Consolas with standard monospace fallbacks | Code, technical paths, identifiers |

Both primary families use weight 400–700 and are distributed under the **SIL Open Font License**. Self-host web font subsets for Latin and Latin Extended with font-display swap; package license notices. Do not require a remote CDN, particularly on field/offline-aware products. For Flutter, token names are exported but app-level font assets/registration must be verified separately before rendering can be claimed.

## 3. Semantic token assignments

| Token | Maps to | Guidance |
|---|---|---|
| `font.body`, `font.navigation`, `font.form`, `font.table` | Inter | Normal text and interaction |
| `font.display` | Plus Jakarta Sans | Major headings only; keep compact menu labels Inter |
| `font.financial` | Inter + `tabular-nums` | Monetary columns, totals, accounting values |
| `font.code` | Monospace | Code editors, commands, paths |

Use weights 400 regular, 500 medium, 600 semibold, 700 bold. Existing size and line-height scale from `SengialaSuite/docs/branding/TYPOGRAPHY_TOKEN_SYSTEM.md` is preserved in the canonical JSON. Avoid broad font-size overrides in native Dolibarr: its established form geometry and lifecycle are authoritative.

## 4. Native Dolibarr / Sengiala Horizon mapping

- Apply `font.body` to page content and `font.navigation` to native top menu and visible Eldy-style rail.
- Apply `font.form` to inputs, labels, Select2, buttons and native form controls.
- Apply `font.display` to `h1/h2/h3` and approved Dashboard heading selectors; never change status meaning.
- Apply `font.financial` with `font-variant-numeric: tabular-nums` to amount cells only.
- Preserve Font Awesome icon glyphs, ACE/monospace editors, PDF print templates, Dolibarr native permissions, CSRF and Maker/Reviewer/Approver separation.
- Theme packaging: use a new versioned, deterministic `sengialahorizon` ZIP. Retain historical 0.4.3-rc1 checksum and release evidence. Do not copy the staged Custom CSS text verbatim into the theme, because CSS-001/002/003 already coexist in that staging database and would produce duplicate rules.

## 5. Accessibility, languages and validation

Validate actual English/Bahasa Melayu labels, long finance tables, keyboard focus, native dropdowns and Select2. Preserve minimum text contrast and native browser zoom; no color-only meaning or hidden permission-gated controls. Check at 390, 768, 1024, 1366 and 1596 CSS pixels. Inter's tabular numerals must align ringgit amounts and not alter rounding or GP23 calculations.

## 6. Governance and release

SDT-002 is an **owner-approved design standard**. Its generated exports are not retroactive changes to other released modules. Each product adopts it through a separately reviewed integration and test. Production/cPanel deployment remains gated by package integrity, authenticated role/visual checks, backup and rollback evidence. This follows SDS-003 and SDP-002.

References: SDT-001 Token Architecture; SDS-001 Design Principles; SDS-002 Design Philosophy; SDS-003 Design Governance; SengialaSuite ADR-022 and Typography Token System.
