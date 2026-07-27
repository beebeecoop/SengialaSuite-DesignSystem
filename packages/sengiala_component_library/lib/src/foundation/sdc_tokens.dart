import 'package:flutter/material.dart';

abstract final class SdcSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

abstract final class SdcRadius {
  static const BorderRadius sm = BorderRadius.all(Radius.circular(4));
  static const BorderRadius md = BorderRadius.all(Radius.circular(8));
  static const BorderRadius lg = BorderRadius.all(Radius.circular(12));
  static const BorderRadius xl = BorderRadius.all(Radius.circular(16));
  static const BorderRadius full = BorderRadius.all(Radius.circular(9999));
}

abstract final class SdcDuration {
  static const Duration fast = Duration(milliseconds: 100);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
}

abstract final class SdcIconSize {
  static const double sm = 16;
  static const double md = 20;
  static const double lg = 24;
  static const double xl = 32;
}
