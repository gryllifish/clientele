// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientDto _$ClientDtoFromJson(Map<String, dynamic> json) => _ClientDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  role: json['role'] as String,
  photoAsset: json['photo_asset'] as String,
  onboardedAt: DateTime.parse(json['onboarded_at'] as String),
  isHot: json['is_hot'] as bool? ?? false,
);

Map<String, dynamic> _$ClientDtoToJson(_ClientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'photo_asset': instance.photoAsset,
      'onboarded_at': instance.onboardedAt.toIso8601String(),
      'is_hot': instance.isHot,
    };
