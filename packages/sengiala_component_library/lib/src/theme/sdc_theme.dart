import 'package:flutter/material.dart';

abstract final class SdcTheme {
  static ThemeData light({Color seed = const Color(0xFF006C4E)}) =>
      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seed), useMaterial3: true);

  static ThemeData dark({Color seed = const Color(0xFF006C4E)}) => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        useMaterial3: true,
      );

  static ThemeData highContrast({Color seed = const Color(0xFF006C4E)}) {
    final scheme = ColorScheme.fromSeed(seedColor: seed, contrastLevel: 1);
    return ThemeData(colorScheme: scheme, useMaterial3: true);
  }
}
