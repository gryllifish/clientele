import 'package:flutter/widgets.dart';

/// Corner radius scale.
abstract final class AppRadius {
  static const double sm = 12;
  static const double md = 20;
  static const double lg = 26;
  static const double xl = 28;
  static const double sheet = 36;

  /// Fully rounded ends for chips and badges.
  static const double pill = 999;

  static final BorderRadius pillBorder = BorderRadius.circular(pill);
}
