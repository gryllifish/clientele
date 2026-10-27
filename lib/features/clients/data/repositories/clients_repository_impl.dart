import 'package:clients_app/core/error/guard.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/clients/data/datasources/clients_local_data_source.dart';
import 'package:clients_app/features/clients/data/mappers/client_mapper.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/repositories/clients_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clients_repository_impl.g.dart';

class ClientsRepositoryImpl implements ClientsRepository {
  const ClientsRepositoryImpl(this._localDataSource);

  final ClientsLocalDataSource _localDataSource;

  @override
  Future<Result<List<Client>>> getClients() => guard(() async {
    final dtos = await _localDataSource.fetchClients();
    return List.unmodifiable(dtos.map((dto) => dto.toEntity()));
  });
}

/// Exposes the interface, so tests and features depend on the abstraction.
@riverpod
ClientsRepository clientsRepository(Ref ref) =>
    ClientsRepositoryImpl(ref.watch(clientsLocalDataSourceProvider));
