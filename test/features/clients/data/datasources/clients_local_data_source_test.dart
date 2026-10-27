import 'dart:convert';

import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/features/clients/data/datasources/clients_local_data_source.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeAssetBundle extends CachingAssetBundle {
  _FakeAssetBundle(this._content);

  /// Null simulates a missing asset.
  final String? _content;

  @override
  Future<ByteData> load(String key) async => switch (_content) {
    final String content => ByteData.sublistView(utf8.encode(content)),
    null => throw Exception('Asset not found: $key'),
  };
}

const _validJson = '''
[{"id": 1, "name": "Maya", "role": "Designer",
  "photo_asset": "a.jpg", "onboarded_at": "2026-05-20T10:00:00Z",
  "is_hot": true}]
''';

void main() {
  final authoredAt = ClientsLocalDataSource.authoredAt;

  ClientsLocalDataSource buildDataSource(String? content, {DateTime? now}) =>
      ClientsLocalDataSource(
        bundle: _FakeAssetBundle(content),
        now: now ?? authoredAt,
      );

  group('ClientsLocalDataSource.fetchClients', () {
    test('parses snake_case JSON into DTOs', () async {
      final clients = await buildDataSource(_validJson).fetchClients();

      expect(clients, hasLength(1));
      expect(clients.single.photoAsset, 'a.jpg');
      expect(clients.single.isHot, isTrue);
    });

    test('shifts dates by the time elapsed since the mock was authored', () {
      const elapsed = Duration(days: 10);

      expect(
        buildDataSource(
          _validJson,
          now: authoredAt.add(elapsed),
        ).fetchClients().then((c) => c.single.onboardedAt),
        completion(DateTime.utc(2026, 5, 20, 10).add(elapsed)),
      );
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
}
