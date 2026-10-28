import 'package:flutter/animation.dart';

/// Shared animation durations so motion feels consistent across the app.
abstract final class AppDurations {
  /// Color and state changes on small controls.
  static const fast = Duration(milliseconds: 250);

  /// Element fade and scale transitions.
  static const medium = Duration(milliseconds: 350);

  /// Page transitions and card entrances.
  static const page = Duration(milliseconds: 480);

  /// Layout changes such as items moving across a grid.
  static const slow = Duration(milliseconds: 550);

  /// Numbers counting up to their value.
  static const countUp = Duration(milliseconds: 900);
}

/// Shared easing curves.
abstract final class AppCurves {
  /// Fast start, long soft landing. Used for entrances and page transitions.
  static const emphasized = Cubic(0.2, 0.8, 0.2, 1);
}
