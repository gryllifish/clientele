import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/retry_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('never retries typed failures', () {
    expect(retryPolicy(0, const ParsingFailure()), isNull);
  });

  test('never retries programming errors', () {
    expect(retryPolicy(0, StateError('bug')), isNull);
  });

  test('backs off exponentially, then gives up', () {
    final error = Exception('flaky');

    expect(retryPolicy(0, error), const Duration(milliseconds: 200));
    expect(retryPolicy(1, error), const Duration(milliseconds: 400));
    expect(retryPolicy(2, error), const Duration(milliseconds: 800));
    expect(retryPolicy(3, error), isNull);
  });
}
