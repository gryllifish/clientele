import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/utils/demo_dates.dart';
import 'package:clients_app/features/transactions/data/datasources/transactions_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_asset_bundle.dart';

const _validJson = '''
[{"id": 1, "title": "Brand direction", "client_name": "Maya Chen",
  "amount": 4200, "occurred_at": "2024-05-24T09:40:00",
  "participants": [{"client_id": 1, "photo_asset": "a.jpg"}]}]
''';

void main() {
  final authoredAt = DemoDates.authoredAt;

  TransactionsLocalDataSource buildDataSource(
    String? content, {
    DateTime? now,
  }) => TransactionsLocalDataSource(
    bundle: FakeAssetBundle(content),
    now: now ?? authoredAt,
  );

  test('parses snake_case JSON into DTOs', () async {
    final transactions = await buildDataSource(_validJson).fetchTransactions();

    expect(transactions.single.clientName, 'Maya Chen');
    expect(transactions.single.participants.single.photoAsset, 'a.jpg');
  });

  test('shifts dates by whole days and keeps the time of day', () async {
    final now = authoredAt.add(const Duration(days: 10, hours: 7));

    final transactions = await buildDataSource(
      _validJson,
      now: now,
    ).fetchTransactions();

    expect(transactions.single.occurredAt, DateTime(2024, 6, 3, 9, 40));
  });

  test('throws StorageException when the asset is missing', () {
    expect(
      buildDataSource(null).fetchTransactions(),
      throwsA(isA<StorageException>()),
    );
  });

  test('throws ParsingException on malformed JSON', () {
    expect(
      buildDataSource('[{"id": "oops"}]').fetchTransactions(),
      throwsA(isA<ParsingException>()),
    );
  });
}
