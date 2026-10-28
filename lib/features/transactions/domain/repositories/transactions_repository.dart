import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';

/// Source of truth for payments received from clients.
// An interface (not a function) so data sources can be swapped and mocked.
// ignore: one_member_abstracts
abstract interface class TransactionsRepository {
  /// Returns every transaction, in no particular order.
  Future<Result<List<Transaction>>> getTransactions();
}
