import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

/// One record of `transactions.json`.
@freezed
abstract class TransactionDto with _$TransactionDto {
  const factory TransactionDto({
    required int id,
    required String title,
    required int clientId,
    required String clientName,
    required int amount,
    required DateTime occurredAt,
    required List<TransactionParticipantDto> participants,
  }) = _TransactionDto;

  factory TransactionDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDtoFromJson(json);
}

@freezed
abstract class TransactionParticipantDto with _$TransactionParticipantDto {
  const factory TransactionParticipantDto({
    required int clientId,
    required String photoAsset,
  }) = _TransactionParticipantDto;

  factory TransactionParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionParticipantDtoFromJson(json);
}
