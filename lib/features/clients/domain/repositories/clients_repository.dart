import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';

/// Source of truth for the user's clients.
// ignore: one_member_abstracts - repository interfaces grow with the feature.
abstract interface class ClientsRepository {
  /// Returns every client, in their default order.
  Future<Result<List<Client>>> getClients();
}
