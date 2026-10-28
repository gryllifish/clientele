import 'package:clients_app/features/clients/data/models/client_dto.dart';
import 'package:clients_app/features/clients/data/models/client_profile_dto.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';

extension ClientDtoMapper on ClientDto {
  Client toEntity() => Client(
    id: id,
    name: name,
    role: role,
    photoAsset: photoAsset,
    onboardedAt: onboardedAt,
    hotScore: hotScore,
  );
}

extension ClientProfileDtoMapper on ClientProfileDto {
  ClientProfile toEntity({required int clientId}) => ClientProfile(
    clientId: clientId,
    location: location,
    totalValue: totalValue,
    projectCount: projectCount,
    rating: rating,
    nextSession: ClientSession(
      startsAt: nextSessionAt,
      duration: Duration(minutes: nextSessionMinutes),
    ),
    latestNote: latestNote,
  );
}
