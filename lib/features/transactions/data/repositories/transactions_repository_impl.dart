import 'package:clients_app/core/error/guard.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/transactions/data/datasources/transactions_local_data_source.dart';
import 'package:clients_app/features/transactions/data/mappers/transaction_mapper.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_repository_impl.g.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  const TransactionsRepositoryImpl(this._localDataSource);

  final TransactionsLocalDataSource _localDataSource;

  @override
  Future<Result<List<Transaction>>> getTransactions() => guard(() async {
    final dtos = await _localDataSource.fetchTransactions();
    return List<Transaction>.unmodifiable(dtos.map((dto) => dto.toEntity()));
  });
}

/// Exposes the interface, so tests and features depend on the abstraction.
@riverpod
TransactionsRepository transactionsRepository(Ref ref) =>
    TransactionsRepositoryImpl(ref.watch(transactionsLocalDataSourceProvider));
