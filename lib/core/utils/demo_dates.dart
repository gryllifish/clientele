/// Keeps the bundled mock data looking current.
///
/// Demo-only: the mock JSON files are written against the date shown in the
/// design. Data sources shift every date by the whole days elapsed since
/// then, so relative data ("This month", "Today") always makes sense while
/// times of day stay as authored.
abstract final class DemoDates {
  /// Date the mock JSON files were written against.
  static final authoredAt = DateTime(2024, 5, 24);

  /// Whole days between [authoredAt] and [now].
  static Duration offsetFor(DateTime now) =>
      Duration(days: now.difference(authoredAt).inDays);
}
