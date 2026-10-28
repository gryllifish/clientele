import 'package:clients_app/core/utils/demo_dates.dart';
import 'package:clients_app/features/clients/data/datasources/clients_local_data_source.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Guards the shipped mock data: the DTOs must parse the real asset.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final dataSource = ClientsLocalDataSource(
    bundle: rootBundle,
    now: DemoDates.authoredAt,
  );

  test('every bundled client parses', () async {
    final clients = await dataSource.fetchClients();

    expect(clients, hasLength(6));
    expect(clients.map((c) => c.id), [1, 2, 3, 4, 5, 6]);
  });

  test('every bundled client has a parsable profile', () async {
    for (var id = 1; id <= 6; id++) {
      final profile = await dataSource.fetchClientProfile(id);
      expect(profile.location, isNotEmpty);
    }
  });
}
