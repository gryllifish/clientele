import 'package:intl/intl.dart';

/// Pure, locale-aware display formatters. Widgets may call these directly.
abstract final class Formatters {
  /// Long date, e.g. "Friday, May 24" or "viernes, 24 de mayo".
  static String longDate(DateTime date, String locale) =>
      DateFormat.MMMMEEEEd(locale).format(date);

  /// Short date, e.g. "Mon, 27 May" or "lun, 27 may".
  static String shortDate(DateTime date, String locale) =>
      DateFormat('EEE, d MMM', locale).format(date);

  /// Time of day, e.g. "10:30 AM" or "10:30".
  static String time(DateTime date, String locale) =>
      DateFormat.jm(locale).format(date);

  /// Compact US dollars, e.g. 18400 -> "$18.4K".
  static String compactUsd(int amount, String locale) =>
      NumberFormat.compactSimpleCurrency(
        locale: locale,
        name: 'USD',
      ).format(amount);

  /// One-decimal score, e.g. 4.9 -> "4.9" or "4,9".
  static String rating(double value, String locale) =>
      NumberFormat('0.0', locale).format(value);

  /// Zero-padded two-digit counter, e.g. 6 -> "06".
  static String twoDigits(int value) => value.toString().padLeft(2, '0');
}
