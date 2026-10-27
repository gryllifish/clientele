import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/core/utils/part_of_day.dart';
import 'package:clients_app/features/clients/controllers/client_filter_controller.dart';
import 'package:clients_app/features/clients/controllers/clients_controller.dart';
import 'package:clients_app/features/clients/controllers/home_header_controller.dart';
import 'package:clients_app/features/clients/data/repositories/clients_repository_impl.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_filter.dart';
import 'package:clients_app/features/clients/domain/repositories/clients_repository.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/client_fixtures.dart';

class _MockClientsRepository extends Mock implements ClientsRepository {}

void main() {
  late _MockClientsRepository repository;

  setUp(() => repository = _MockClientsRepository());

  ProviderContainer createContainer() => ProviderContainer.test(
    overrides: [
      clientsRepositoryProvider.overrideWithValue(repository),
      nowProvider.overrideWithValue(fixedNow),
    ],
    // Riverpod retries failed providers by default; tests want the raw error.
    retry: (_, _) => null,
  );

  void stubClients(Result<List<Client>> result) =>
      when(repository.getClients).thenAnswer((_) async => result);

  group('ClientsController', () {
    test('exposes the repository clients', () async {
      stubClients(Ok(sampleClients));
      final container = createContainer();

      expect(
        await container.read(clientsControllerProvider.future),
        sampleClients,
      );
    });

    test('surfaces failures as AsyncError', () async {
      stubClients(const Err(StorageFailure()));
      final container = createContainer();

      await expectLater(
        container.read(clientsControllerProvider.future),
        throwsA(isA<StorageFailure>()),
      );
    });

    test('retry reloads from the repository', () async {
      stubClients(Ok(sampleClients));
      final container = createContainer();
      await container.read(clientsControllerProvider.future);

      container.read(clientsControllerProvider.notifier).retry();
      await container.read(clientsControllerProvider.future);

      verify(repository.getClients).called(2);
    });
  });

  group('visibleClients', () {
    test('applies the selected filter without a loading state', () async {
      stubClients(Ok(sampleClients));
      // Keep the derived provider alive across the filter change.
      final container = createContainer()
        ..listen(visibleClientsProvider, (_, _) {});
      await container.read(clientsControllerProvider.future);

      container
          .read(clientFilterControllerProvider.notifier)
          .select(ClientFilter.hot);
      final visible = container.read(visibleClientsProvider);

      expect(visible.hasValue, isTrue);
      expect(visible.requireValue.map((c) => c.id), [1, 3]);
    });
  });

  group('homeHeader', () {
    test('computes greeting and stats from clients and clock', () async {
      stubClients(Ok(sampleClients));
      final container = createContainer();
      await container.read(clientsControllerProvider.future);

      final header = container.read(homeHeaderProvider);

      expect(header.partOfDay, PartOfDay.morning);
      expect(header.totalClients, 4);
      expect(header.clientsThisMonth, 2);
    });
  });
}
