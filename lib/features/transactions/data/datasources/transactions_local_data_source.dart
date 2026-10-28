import 'dart:convert';

import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/utils/demo_dates.dart';
import 'package:clients_app/features/transactions/data/models/transaction_dto.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transactions_local_data_source.g.dart';

/// Reads transactions from the bundled JSON mock.
class TransactionsLocalDataSource {
  const TransactionsLocalDataSource({
    required this._bundle,
    required this._now,
  });

  static const assetPath = 'assets/data/transactions.json';

  final AssetBundle _bundle;
  final DateTime _now;

  /// Throws [StorageException] or [ParsingException].
  Future<List<TransactionDto>> fetchTransactions() async {
    final String raw;
    try {
      raw = await _bundle.loadString(assetPath);
    } on Exception catch (error) {
      throw StorageException('Could not read $assetPath', cause: error);
    }

    // See [DemoDates].
    final offset = DemoDates.offsetFor(_now);
    try {
      return (jsonDecode(raw) as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map(TransactionDto.fromJson)
          .map((dto) => dto.copyWith(occurredAt: dto.occurredAt.add(offset)))
          .toList();
    } on Object catch (error) {
      // Malformed JSON surfaces as FormatException or TypeError.
      throw ParsingException('Invalid transactions JSON', cause: error);
    }
  }
}

@riverpod
TransactionsLocalDataSource transactionsLocalDataSource(Ref ref) =>
    TransactionsLocalDataSource(
      bundle: rootBundle,
      now: ref.watch(nowProvider),
    );
