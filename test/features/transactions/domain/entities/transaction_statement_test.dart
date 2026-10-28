import 'package:clients_app/features/transactions/domain/entities/transaction_statement.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/client_fixtures.dart';
import '../../../../helpers/transaction_fixtures.dart';

void main() {
  final statement = TransactionStatement.of(sampleTransactions, now: fixedNow);

  test('keeps the last 30 calendar days, newest first', () {
    expect(statement.recent.map((t) => t.id), [1, 2, 3]);
  });

  test('counts a payment later today as today', () {
    expect(statement.recent.first.occurredAt.isAfter(fixedNow), isTrue);
  });

  test('sums the current and the previous window', () {
    expect(statement.total, 600);
    expect(statement.previousTotal, 500);
  });

  test('change is relative to the previous window', () {
    expect(statement.change, closeTo(0.2, 1e-9));
  });

  test('change is null without a previous window to compare', () {
    final onlyRecent = TransactionStatement.of(
      sampleTransactions.take(3).toList(),
      now: fixedNow,
    );

    expect(onlyRecent.change, isNull);
  });

  test('with a client, only their payments count', () {
    final forClient = TransactionStatement.of(
      sampleTransactions,
      now: fixedNow,
      clientId: 2,
    );

    expect(forClient.recent.map((t) => t.id), [2]);
    expect(forClient.total, 200);
    expect(forClient.change, isNull);
  });

  test('an empty list gives an empty statement', () {
    final empty = TransactionStatement.of(const [], now: fixedNow);

    expect(empty.recent, isEmpty);
    expect(empty.total, 0);
  });
}
