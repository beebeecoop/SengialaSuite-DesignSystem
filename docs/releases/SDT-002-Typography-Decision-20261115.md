# SDT-002 — Typography Approval & Release Handoff

- **Owner decision date:** 2026-11-15 (Asia/Kuala_Lumpur)
- **Approved typography:** Option C — Inter Variable (UI), Plus Jakarta Sans (display), Inter tabular numerals (finance).
- **Affected canonical source:** `tokens/typography.json`.
- **Classification:** Additive typography standard aligned to SDT-001, SDS-001/002/003 and SDP-002. Existing Inter body token remains backward-compatible; display adds Plus Jakarta Sans.
- **Exports:** `exports/web/sengiala-typography-tokens.css` and `packages/sengiala_component_library/lib/src/foundation/sdc_typography.dart`, produced from the same JSON.
- **Proof:** Staging SHNT-005-CSS-004 verified Inter and Plus Jakarta Sans loaded; native Third Party and Dashboard visual smoke passed. Full authenticated role/responsive and production installation certification remain separate gates.
- **Historical compatibility:** No change to old release artifacts, historical hashes or existing product migrations.
- **Governed release rule:** Owner approval is recorded. Publication to `main` requires CI/test review; production use requires separately certified theme package and rollout.
