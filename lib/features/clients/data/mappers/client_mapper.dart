import 'package:clients_app/features/clients/data/models/client_dto.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';

extension ClientDtoMapper on ClientDto {
  Client toEntity() => Client(
    id: id,
    name: name,
    role: role,
    photoAsset: photoAsset,
    onboardedAt: onboardedAt.toLocal(),
    isHot: isHot,
  );
}
