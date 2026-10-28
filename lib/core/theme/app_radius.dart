import 'package:flutter/widgets.dart';

/// Corner radius scale.
abstract final class AppRadius {
  static const double sm = 10;
  static const double md = 15;
  static const double lg = 20;
  static const double sheet = 28;

  /// Fully rounded ends for chips and badges.
  static const double pill = 999;

  static final BorderRadius pillBorder = BorderRadius.circular(pill);

  /// Rounded top corners of the white sheets under headers.
  static const BorderRadius sheetTop = BorderRadius.vertical(
    top: Radius.circular(sheet),
  );
}
