import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';

/// An incoming payment from a client.
@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required String title,

    /// The client who paid.
    required int clientId,
    required String clientName,

    /// In whole US dollars.
    required int amount,
    required DateTime occurredAt,

    /// Clients involved in the work, in display order.
    required List<TransactionParticipant> participants,
  }) = _Transaction;
}

/// A client involved in a transaction, with what's needed to show them.
@freezed
abstract class TransactionParticipant with _$TransactionParticipant {
  const factory TransactionParticipant({
    required int clientId,
    required String photoAsset,
  }) = _TransactionParticipant;
}
