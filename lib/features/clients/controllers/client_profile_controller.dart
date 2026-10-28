import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/features/clients/controllers/clients_controller.dart';
import 'package:clients_app/features/clients/data/repositories/clients_repository_impl.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_profile_controller.g.dart';

/// Loads the profile details of one client.
@riverpod
class ClientProfileController extends _$ClientProfileController {
  @override
  Future<ClientProfile> build(int clientId) async =>
      (await ref.watch(clientsRepositoryProvider).getClientProfile(clientId))
          .getOrThrow();

  void retry() => ref.invalidateSelf();
}

/// A client from the already-loaded list.
///
/// Lets the profile header (and its Hero photo) render on the first frame
/// instead of waiting for the profile request.
@riverpod
AsyncValue<Client> clientById(Ref ref, int clientId) => ref
    .watch(clientsControllerProvider)
    .whenData(
      (clients) => clients.firstWhere(
        (client) => client.id == clientId,
        orElse: () => throw const NotFoundFailure(),
      ),
    );
