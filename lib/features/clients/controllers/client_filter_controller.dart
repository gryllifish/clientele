import 'package:clients_app/features/clients/controllers/clients_controller.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_filter_controller.g.dart';

/// Currently selected [ClientFilter].
@riverpod
class ClientFilterController extends _$ClientFilterController {
  @override
  ClientFilter build() => ClientFilter.all;

  void select(ClientFilter filter) => state = filter;
}

/// Text typed in the home search field.
@riverpod
class ClientSearchController extends _$ClientSearchController {
  @override
  String build() => '';

  void search(String query) => state = query;

  void clear() => state = '';
}

/// Clients matching the search, in display order for the selected filter.
///
/// The search narrows the list first, so "Hot" ranks only the matches.
/// Derived synchronously (not via `.future`) so changing the filter never
/// flashes a loading state and the grid can animate between lists.
@riverpod
AsyncValue<List<Client>> visibleClients(Ref ref) {
  final filter = ref.watch(clientFilterControllerProvider);
  final query = ref.watch(clientSearchControllerProvider);
  return ref
      .watch(clientsControllerProvider)
      .whenData(
        (clients) => filter.apply([
          for (final client in clients)
            if (client.matches(query)) client,
        ]),
      );
}
