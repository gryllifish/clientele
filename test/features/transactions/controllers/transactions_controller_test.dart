import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/transactions/controllers/transactions_controller.dart';
import 'package:clients_app/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/client_fixtures.dart';
import '../../../helpers/transaction_fixtures.dart';

class _MockTransactionsRepository extends Mock
    implements TransactionsRepository {}

void main() {
  late _MockTransactionsRepository repository;

  setUp(() => repository = _MockTransactionsRepository());

  ProviderContainer createContainer() => ProviderContainer.test(
    overrides: [
      transactionsRepositoryProvider.overrideWithValue(repository),
      nowProvider.overrideWithValue(fixedNow),
    ],
    // Riverpod retries failed providers by default; tests want the raw error.
    retry: (_, _) => null,
  );

  void stubTransactions(Result<List<Transaction>> result) =>
      when(repository.getTransactions).thenAnswer((_) async => result);

  group('TransactionsController', () {
    test('surfaces failures as AsyncError', () async {
      stubTransactions(const Err(StorageFailure()));
      final container = createContainer();

      await expectLater(
        container.read(transactionsControllerProvider.future),
        throwsA(isA<StorageFailure>()),
      );
    });

    test('retry reloads from the repository', () async {
      stubTransactions(Ok(sampleTransactions));
      final container = createContainer();
      await container.read(transactionsControllerProvider.future);

      container.read(transactionsControllerProvider.notifier).retry();
      await container.read(transactionsControllerProvider.future);

      verify(repository.getTransactions).called(2);
    });
  });

  group('transactionStatement', () {
    test('builds the statement for the current clock', () async {
      stubTransactions(Ok(sampleTransactions));
      final container = createContainer();
      await container.read(transactionsControllerProvider.future);

      final statement = container.read(transactionStatementProvider).value;

      expect(statement?.recent.map((t) => t.id), [1, 2, 3]);
      expect(statement?.total, 600);
    });
  });
}
