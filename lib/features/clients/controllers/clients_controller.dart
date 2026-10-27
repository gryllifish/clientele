import 'package:clients_app/features/clients/data/repositories/clients_repository_impl.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clients_controller.g.dart';

/// Loads the client list. Failures surface as `AsyncError<Failure>`.
@riverpod
class ClientsController extends _$ClientsController {
  @override
  Future<List<Client>> build() async =>
      (await ref.watch(clientsRepositoryProvider).getClients()).getOrThrow();

  void retry() => ref.invalidateSelf();
}
