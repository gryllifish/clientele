import 'package:clients_app/features/clients/domain/entities/client_filter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/client_fixtures.dart';

void main() {
  List<int> idsAfter(ClientFilter filter) =>
      filter.apply(sampleClients).map((c) => c.id).toList();

  group('ClientFilter.apply', () {
    test('all keeps the original order', () {
      expect(idsAfter(ClientFilter.all), [1, 2, 3, 4]);
    });

    test('oldest sorts by onboarding date ascending', () {
      expect(idsAfter(ClientFilter.oldest), [3, 1, 4, 2]);
    });

    test('newest sorts by onboarding date descending', () {
      expect(idsAfter(ClientFilter.newest), [2, 4, 1, 3]);
    });

    test('hot keeps only highlighted clients', () {
      expect(idsAfter(ClientFilter.hot), [1, 3]);
    });

    test('never mutates the input', () {
      final input = [...sampleClients];
      ClientFilter.newest.apply(input);

      expect(input, sampleClients);
    });
  });
}
