// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientProfileDto _$ClientProfileDtoFromJson(Map<String, dynamic> json) =>
    _ClientProfileDto(
      location: json['location'] as String,
      totalValue: (json['total_value'] as num).toInt(),
      projectCount: (json['project_count'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      nextSessionAt: DateTime.parse(json['next_session_at'] as String),
      nextSessionMinutes: (json['next_session_minutes'] as num).toInt(),
      latestNote: json['latest_note'] as String,
    );

Map<String, dynamic> _$ClientProfileDtoToJson(_ClientProfileDto instance) =>
    <String, dynamic>{
      'location': instance.location,
      'total_value': instance.totalValue,
      'project_count': instance.projectCount,
      'rating': instance.rating,
      'next_session_at': instance.nextSessionAt.toIso8601String(),
      'next_session_minutes': instance.nextSessionMinutes,
      'latest_note': instance.latestNote,
    };
