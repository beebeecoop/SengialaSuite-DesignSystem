"""SDT-002: canonical tokens, deterministic web and Flutter output."""
from pathlib import Path
import json
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]

class TypographyContractTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tokens = json.loads((ROOT / "tokens/typography.json").read_text(encoding="utf-8"))

    def test_approved_option_c(self):
        d = self.tokens
        self.assertEqual(d["contract"], "SDT-002")
        self.assertEqual(d["status"], "approved")
        self.assertTrue(d["governance"]["production_deployment_separate"])
        self.assertEqual(d["families"]["sans"]["name"], "Inter")
        self.assertEqual(d["families"]["display"]["name"], "Plus Jakarta Sans")
        self.assertEqual(d["semantic"]["financial"], "sans")
        self.assertEqual(d["components"]["financial_amount"]["numeric"], "tabular-nums")

    def test_legacy_weight_and_scale_contract(self):
        d = self.tokens
        self.assertEqual(d["weights"], {"regular":400,"medium":500,"semibold":600,"bold":700})
        self.assertEqual(d["sizes"]["md"], "1rem")
        self.assertEqual(d["sizes"]["4xl"], "2.25rem")
        self.assertEqual(d["line_heights"]["normal"], 1.5)

    def test_generated_exports_have_no_drift(self):
        proc = subprocess.run([sys.executable, "scripts/export_typography.py", "--check"],
                              cwd=ROOT, capture_output=True, text=True)
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)

    def test_web_and_flutter_mappings(self):
        css = (ROOT/"exports/web/sengiala-typography-tokens.css").read_text(encoding="utf-8")
        dart = (ROOT/"packages/sengiala_component_library/lib/src/foundation/sdc_typography.dart").read_text(encoding="utf-8")
        barrel = (ROOT/"packages/sengiala_component_library/lib/sengiala_component_library.dart").read_text(encoding="utf-8")
        self.assertIn("--sdt-font-body: var(--sdt-font-family-sans)", css)
        self.assertIn("--sdt-font-display: var(--sdt-font-family-display)", css)
        self.assertIn("--sdt-font-financial-numeric: tabular-nums", css)
        self.assertIn("familyDisplay = 'Plus Jakarta Sans'", dart)
        self.assertIn("financialNumerals", dart)
        self.assertIn("src/foundation/sdc_typography.dart", barrel)
        self.assertNotIn("fonts.googleapis.com", css)

if __name__ == "__main__":
    unittest.main()
