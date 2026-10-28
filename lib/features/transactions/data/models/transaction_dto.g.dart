// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    _TransactionDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      clientName: json['client_name'] as String,
      amount: (json['amount'] as num).toInt(),
      occurredAt: DateTime.parse(json['occurred_at'] as String),
      participants: (json['participants'] as List<dynamic>)
          .map(
            (e) =>
                TransactionParticipantDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$TransactionDtoToJson(_TransactionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'client_name': instance.clientName,
      'amount': instance.amount,
      'occurred_at': instance.occurredAt.toIso8601String(),
      'participants': instance.participants.map((e) => e.toJson()).toList(),
    };

_TransactionParticipantDto _$TransactionParticipantDtoFromJson(
  Map<String, dynamic> json,
) => _TransactionParticipantDto(
  clientId: (json['client_id'] as num).toInt(),
  photoAsset: json['photo_asset'] as String,
);

Map<String, dynamic> _$TransactionParticipantDtoToJson(
  _TransactionParticipantDto instance,
) => <String, dynamic>{
  'client_id': instance.clientId,
  'photo_asset': instance.photoAsset,
};
