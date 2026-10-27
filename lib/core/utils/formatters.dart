import 'package:intl/intl.dart';

/// Pure display formatters. Widgets may call these directly.
abstract final class Formatters {
  /// Locale-aware long date, e.g. "Tuesday, October 27" or
  /// "martes, 27 de octubre".
  static String longDate(DateTime date, String locale) =>
      DateFormat.MMMMEEEEd(locale).format(date);

  /// Zero-padded two-digit counter, e.g. 6 -> "06".
  static String twoDigits(int value) => value.toString().padLeft(2, '0');
}
