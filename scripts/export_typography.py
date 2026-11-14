#!/usr/bin/env python3
"""SDT-002: deterministic Web/Flutter typography token exports.

One source: tokens/typography.json. Run with --check to detect drift.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "tokens/typography.json"
WEB = ROOT / "exports/web/sengiala-typography-tokens.css"
FLUTTER = ROOT / "packages/sengiala_component_library/lib/src/foundation/sdc_typography.dart"


def quote_css(value: str) -> str:
    if any(c.isspace() for c in value):
        return '"' + value.replace('"', '\\"') + '"'
    return value


def produce() -> tuple[str, str]:
    raw = SOURCE.read_bytes()
    data = json.loads(raw)
    if data["contract"] != "SDT-002" or data["status"] != "approved":
        raise ValueError("Typography canonical contract not approved")
    if data["families"]["sans"]["name"] != "Inter" or data["families"]["display"]["name"] != "Plus Jakarta Sans":
        raise ValueError("Unexpected approved font family")
    digest = hashlib.sha256(raw).hexdigest()
    header = f"SDT-002 v{data['version']} | source SHA256 {digest}"
    css = [f"/* GENERATED — {header}. DO NOT EDIT. */", ":root {"]
    for name, spec in data["families"].items():
        stack = [spec["css_alias"], *spec["fallback"]]
        css.append(f"  --sdt-font-family-{name}: " + ", ".join(quote_css(x) for x in stack) + ";")
    for semantic, primitive in data["semantic"].items():
        css.append(f"  --sdt-font-{semantic}: var(--sdt-font-family-{primitive});")
    for name, weight in data["weights"].items():
        css.append(f"  --sdt-font-weight-{name}: {weight};")
    for name, size in data["sizes"].items():
        css.append(f"  --sdt-font-size-{name}: {size};")
    for name, height in data["line_heights"].items():
        css.append(f"  --sdt-font-line-{name}: {height};")
    for name, tracking in data["tracking"].items():
        css.append(f"  --sdt-font-tracking-{name}: {tracking};")
    css += ["  --sdt-font-financial-numeric: tabular-nums;", "}", ""]
    web = "\n".join(css)

    dart = [
        f"// GENERATED — {header}. DO NOT EDIT.",
        "import 'package:flutter/material.dart';",
        "",
        "/// SDT-002 tokens. Consuming Flutter apps must bundle/register the approved fonts.",
        "abstract final class SdcTypography {",
    ]
    for family, spec in data["families"].items():
        dart.append(f"  static const String family{family.title()} = '{spec['name']}';")
    dart.append("")
    for semantic, primitive in data["semantic"].items():
        dart.append(f"  static const String {semantic} = family{primitive.title()};")
    dart.append("")
    for name, value in data["weights"].items():
        dart.append(f"  static const FontWeight {name} = FontWeight.w{value};")
    dart.append("")
    for name, value in data["sizes"].items():
        dart.append(f"  static const double size{name.replace('2','Two').replace('3','Three').replace('4','Four').replace('5','Five').title()} = {float(value.rstrip('rem')) * 16:g};")
    dart.extend([
        "",
        "  static const List<FontFeature> financialNumerals = <FontFeature>[",
        "    FontFeature.tabularFigures()",
        "  ];",
        "}",
        "",
    ])
    return web, "\n".join(dart)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    output = produce()
    for target, value in zip((WEB, FLUTTER), output):
        if args.check:
            if not target.is_file() or target.read_text(encoding="utf-8") != value:
                raise SystemExit("GENERATED_EXPORT_DRIFT: " + str(target))
        else:
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(value, encoding="utf-8", newline="\n")
    print("SDT-002 " + ("EXPORT_CHECK_PASS" if args.check else "EXPORTED"))


if __name__ == "__main__":
    main()
