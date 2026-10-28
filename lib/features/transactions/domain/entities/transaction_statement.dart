import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_statement.freezed.dart';

/// Income over a rolling window, compared with the window before it.
@freezed
abstract class TransactionStatement with _$TransactionStatement {
  const factory TransactionStatement({
    /// Transactions in the current window, newest first.
    required List<Transaction> recent,

    /// Sum of [recent], in whole US dollars.
    required int total,

    /// Sum of the previous window, in whole US dollars.
    required int previousTotal,
  }) = _TransactionStatement;

  /// Splits [transactions] into the [windowDays] calendar days ending on
  /// [now] (today included) and the same span right before them.
  ///
  /// Days are compared by calendar date, so a payment later today still
  /// counts as today's.
  factory TransactionStatement.of(
    List<Transaction> transactions, {
    required DateTime now,
    int windowDays = defaultWindowDays,
  }) {
    final today = _dateOnly(now);
    final recent = <Transaction>[];
    var previousTotal = 0;

    for (final transaction in transactions) {
      final daysAgo = today
          .difference(_dateOnly(transaction.occurredAt))
          .inDays;
      if (daysAgo >= 0 && daysAgo < windowDays) {
        recent.add(transaction);
      } else if (daysAgo >= windowDays && daysAgo < windowDays * 2) {
        previousTotal += transaction.amount;
      }
    }
    recent.sort((a, b) => b.occurredAt.compareTo(a.occurredAt));

    return TransactionStatement(
      recent: List.unmodifiable(recent),
      total: recent.fold(0, (sum, transaction) => sum + transaction.amount),
      previousTotal: previousTotal,
    );
  }

  const TransactionStatement._();

  static const defaultWindowDays = 30;

  /// Relative change against the previous window, e.g. 0.126 for +12.6%.
  ///
  /// Null when there is nothing to compare against.
  double? get change => previousTotal == 0 ? null : total / previousTotal - 1;
}

/// Midnight in UTC, so DST shifts never turn a day into 23 or 25 hours.
DateTime _dateOnly(DateTime date) =>
    DateTime.utc(date.year, date.month, date.day);
