import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_profile.freezed.dart';

/// Relationship details shown on a client's profile.
@freezed
abstract class ClientProfile with _$ClientProfile {
  const factory ClientProfile({
    required int clientId,
    required String location,

    /// Lifetime billed amount, in whole US dollars.
    required int totalValue,
    required int projectCount,

    /// Average satisfaction, from 0 to 5.
    required double rating,
    required ClientSession nextSession,
    required String latestNote,
  }) = _ClientProfile;
}

/// A scheduled meeting with a client.
@freezed
abstract class ClientSession with _$ClientSession {
  const factory ClientSession({
    required DateTime startsAt,
    required Duration duration,
  }) = _ClientSession;
}
