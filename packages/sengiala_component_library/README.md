# Sengiala Component Library

Official Flutter component package for the M5 SengialaSuite ecosystem.

## Version

`0.3.0` — Core Component Foundation.

## Included components

- `SdcButton`
- `SdcIconButton`
- `SdcTextField`
- `SdcSurface`
- `SdcCard`
- `SdcAvatar`
- `SdcBadge`
- `SdcChip`
- `SdcProgressIndicator`

## Usage

```dart
import 'package:sengiala_component_library/sengiala_component_library.dart';

MaterialApp(
  theme: SdcTheme.light(),
  darkTheme: SdcTheme.dark(),
  home: SdcButton(
    label: 'Simpan',
    onPressed: () {},
  ),
);
```

## Engineering contract

Components are token-driven, theme-aware, accessible by default and domain-neutral. Application code should use the public barrel export rather than importing files under `src/`.
