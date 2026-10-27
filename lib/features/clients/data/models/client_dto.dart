import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_dto.freezed.dart';
part 'client_dto.g.dart';

/// Client as stored in `assets/data/clients.json` (snake_case keys).
@freezed
abstract class ClientDto with _$ClientDto {
  const factory ClientDto({
    required int id,
    required String name,
    required String role,
    required String photoAsset,
    required DateTime onboardedAt,
    @Default(false) bool isHot,
  }) = _ClientDto;

  factory ClientDto.fromJson(Map<String, dynamic> json) =>
      _$ClientDtoFromJson(json);
}
