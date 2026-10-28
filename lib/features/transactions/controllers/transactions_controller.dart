import 'package:clients_app/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction_statement.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_controller.g.dart';

/// Loads every transaction. Failures surface as `AsyncError<Failure>`.
@riverpod
class TransactionsController extends _$TransactionsController {
  @override
  Future<List<Transaction>> build() async =>
      (await ref.watch(transactionsRepositoryProvider).getTransactions())
          .getOrThrow();

  void retry() => ref.invalidateSelf();
}

/// The rolling statement shown on the payments screen, for every client
/// or only the one with [clientId].
@riverpod
AsyncValue<TransactionStatement> transactionStatement(
  Ref ref,
  int? clientId,
) {
  final now = ref.watch(nowProvider);
  return ref
      .watch(transactionsControllerProvider)
      .whenData(
        (transactions) => TransactionStatement.of(
          transactions,
          now: now,
          clientId: clientId,
        ),
      );
}

/// Name of the client with [clientId] as it appears on their payments, or
/// null when they have none.
@riverpod
AsyncValue<String?> payerName(Ref ref, int clientId) => ref
    .watch(transactionsControllerProvider)
    .whenData(
      (transactions) => transactions
          .where((transaction) => transaction.clientId == clientId)
          .firstOrNull
          ?.clientName,
    );
