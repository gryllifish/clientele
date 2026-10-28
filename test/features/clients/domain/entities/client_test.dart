import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/client_fixtures.dart';

void main() {
  final client = sampleClients.first.copyWith(
    name: 'Maya Chen',
    role: 'Brand designer',
  );

  group('matches', () {
    test('finds the query in the name or role, ignoring case', () {
      expect(client.matches('maya'), isTrue);
      expect(client.matches('DESIGN'), isTrue);
    });

    test('ignores surrounding spaces and matches everything when blank', () {
      expect(client.matches('  chen '), isTrue);
      expect(client.matches('   '), isTrue);
    });

    test('rejects text found in neither field', () {
      expect(client.matches('photographer'), isFalse);
    });
  });
}
