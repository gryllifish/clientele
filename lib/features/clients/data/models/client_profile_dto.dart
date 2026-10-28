import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_profile_dto.freezed.dart';
part 'client_profile_dto.g.dart';

/// The `profile` object nested in each client of `clients.json`.
@freezed
abstract class ClientProfileDto with _$ClientProfileDto {
  const factory ClientProfileDto({
    required String location,
    required int totalValue,
    required int projectCount,
    required double rating,
    required DateTime nextSessionAt,
    required int nextSessionMinutes,
    required String latestNote,
  }) = _ClientProfileDto;

  factory ClientProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileDtoFromJson(json);
}
