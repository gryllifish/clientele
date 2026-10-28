import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/utils/demo_dates.dart';
import 'package:clients_app/features/clients/data/datasources/clients_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/fake_asset_bundle.dart';

const _validJson = '''
[{"id": 1, "name": "Maya", "role": "Designer", "photo_asset": "a.jpg",
  "onboarded_at": "2024-05-20T09:00:00", "hot_score": 8,
  "profile": {"location": "Brooklyn, NY", "total_value": 18400,
    "project_count": 12, "rating": 4.9,
    "next_session_at": "2024-05-27T10:30:00", "next_session_minutes": 60,
    "latest_note": "Approved."}}]
''';

void main() {
  final authoredAt = DemoDates.authoredAt;

  ClientsLocalDataSource buildDataSource(String? content, {DateTime? now}) =>
      ClientsLocalDataSource(
        bundle: FakeAssetBundle(content),
        now: now ?? authoredAt,
      );

  group('fetchClients', () {
    test('parses snake_case JSON into DTOs', () async {
      final clients = await buildDataSource(_validJson).fetchClients();

      expect(clients, hasLength(1));
      expect(clients.single.photoAsset, 'a.jpg');
      expect(clients.single.hotScore, 8);
    });

    test('shifts dates by whole days, keeping the time of day', () async {
      final now = authoredAt.add(const Duration(days: 10, hours: 7));

      final clients = await buildDataSource(
        _validJson,
        now: now,
      ).fetchClients();

      expect(clients.single.onboardedAt, DateTime(2024, 5, 30, 9));
    });

    test('throws StorageException when the asset is missing', () {
      expect(
        buildDataSource(null).fetchClients(),
        throwsA(isA<StorageException>()),
      );
    });

    test('throws ParsingException on malformed JSON', () {
      expect(
        buildDataSource('{not json').fetchClients(),
        throwsA(isA<ParsingException>()),
      );
    });
  });

  group('fetchClientProfile', () {
    test('parses the nested profile and shifts the session date', () async {
      final now = authoredAt.add(const Duration(days: 3));

      final profile = await buildDataSource(
        _validJson,
        now: now,
      ).fetchClientProfile(1);

      expect(profile.location, 'Brooklyn, NY');
      expect(profile.nextSessionMinutes, 60);
      expect(profile.nextSessionAt, DateTime(2024, 5, 30, 10, 30));
    });

    test('throws NotFoundException for unknown ids', () {
      expect(
        buildDataSource(_validJson).fetchClientProfile(99),
        throwsA(isA<NotFoundException>()),
      );
    });
  });
}
