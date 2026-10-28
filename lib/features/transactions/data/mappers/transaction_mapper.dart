import 'package:clients_app/features/transactions/data/models/transaction_dto.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';

extension TransactionDtoMapper on TransactionDto {
  Transaction toEntity() => Transaction(
    id: id,
    title: title,
    clientId: clientId,
    clientName: clientName,
    amount: amount,
    occurredAt: occurredAt,
    participants: List.unmodifiable(
      participants.map(
        (participant) => TransactionParticipant(
          clientId: participant.clientId,
          photoAsset: participant.photoAsset,
        ),
      ),
    ),
  );
}
