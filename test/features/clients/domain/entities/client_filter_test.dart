import 'package:clients_app/features/clients/domain/entities/client_filter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/client_fixtures.dart';

void main() {
  List<int> idsAfter(ClientFilter filter) =>
      filter.apply(sampleClients).map((c) => c.id).toList();

  group('ClientFilter.apply', () {
    test('all keeps the original order', () {
      expect(idsAfter(ClientFilter.all), [1, 2, 3, 4, 5]);
    });

    test('oldest sorts by onboarding date ascending', () {
      expect(idsAfter(ClientFilter.oldest), [3, 1, 5, 4, 2]);
    });

    test('newest sorts by onboarding date descending', () {
      expect(idsAfter(ClientFilter.newest), [2, 4, 5, 1, 3]);
    });

    test('hot keeps the hottest clients, hottest first', () {
      expect(ClientFilter.hotLimit, 4);
      expect(idsAfter(ClientFilter.hot), [4, 2, 5, 1]);
    });

    test('never mutates the input', () {
      final input = [...sampleClients];
      ClientFilter.newest.apply(input);

      expect(input, sampleClients);
    });
  });
}
