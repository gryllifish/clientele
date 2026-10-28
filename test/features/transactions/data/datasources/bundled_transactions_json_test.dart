import 'package:clients_app/core/utils/demo_dates.dart';
import 'package:clients_app/features/transactions/data/datasources/transactions_local_data_source.dart';
import 'package:clients_app/features/transactions/data/mappers/transaction_mapper.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction_statement.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Guards the shipped mock data: it must parse and match the design.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dataSource = TransactionsLocalDataSource(
    bundle: rootBundle,
    now: DemoDates.authoredAt,
  );

  test('every bundled transaction parses', () async {
    final transactions = await dataSource.fetchTransactions();

    expect(transactions, hasLength(11));
    expect(transactions.every((t) => t.participants.isNotEmpty), isTrue);
  });

  test('the bundled statement matches the design figures', () async {
    final transactions = await dataSource.fetchTransactions();

    final statement = TransactionStatement.of(
      [for (final dto in transactions) dto.toEntity()],
      now: DemoDates.authoredAt,
    );

    expect(statement.recent, hasLength(7));
    expect(statement.total, 24820);
    expect(statement.change, closeTo(0.126, 0.0005));
  });
}
