import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';

/// Source of truth for the user's clients.
abstract interface class ClientsRepository {
  /// Returns every client, in their default order.
  Future<Result<List<Client>>> getClients();

  /// Returns the profile of the client with [clientId], or a
  /// `NotFoundFailure` when it does not exist.
  Future<Result<ClientProfile>> getClientProfile(int clientId);
}
