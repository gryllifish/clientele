import 'package:intl/intl.dart';

/// Pure, locale-aware display formatters. Widgets may call these directly.
abstract final class Formatters {
  /// Long date, e.g. "Friday, May 24" or "viernes, 24 de mayo".
  static String longDate(DateTime date, String locale) =>
      DateFormat.MMMMEEEEd(locale).format(date);

  /// Short date, e.g. "Mon, 27 May" or "lun, 27 may".
  static String shortDate(DateTime date, String locale) =>
      DateFormat('EEE, d MMM', locale).format(date);

  /// Month and day, e.g. "May 22" or "22 may".
  static String monthDay(DateTime date, String locale) =>
      DateFormat.MMMd(locale).format(date);

  /// Time of day, e.g. "10:30 AM" or "10:30".
  static String time(DateTime date, String locale) =>
      DateFormat.jm(locale).format(date);

  /// Compact US dollars, e.g. 18400 -> "$18.4K".
  static String compactUsd(int amount, String locale) =>
      NumberFormat.compactSimpleCurrency(
        locale: locale,
        name: 'USD',
      ).format(amount);

  /// Whole US dollars, e.g. 24820 -> "$24,820".
  static String usd(int amount, String locale) => NumberFormat.simpleCurrency(
    locale: locale,
    name: 'USD',
    decimalDigits: 0,
  ).format(amount);

  /// Incoming whole US dollars, e.g. 4200 -> "+$4,200".
  static String incomeUsd(int amount, String locale) =>
      '+${usd(amount, locale)}';

  /// Unsigned one-decimal percentage, e.g. 0.126 -> "12.6%".
  static String percent(double ratio, String locale) =>
      NumberFormat('0.0%', locale).format(ratio.abs());

  /// One-decimal score, e.g. 4.9 -> "4.9" or "4,9".
  static String rating(double value, String locale) =>
      NumberFormat('0.0', locale).format(value);

  /// Zero-padded two-digit counter, e.g. 6 -> "06".
  static String twoDigits(int value) => value.toString().padLeft(2, '0');
}
