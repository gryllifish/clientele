/// Shared animation durations so motion feels consistent across the app.
abstract final class AppDurations {
  /// Color and state changes on small controls.
  static const fast = Duration(milliseconds: 250);

  /// Element fade and scale transitions.
  static const medium = Duration(milliseconds: 350);

  /// Layout changes such as items moving across a grid.
  static const slow = Duration(milliseconds: 550);
}
