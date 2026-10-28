import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/clients/data/datasources/clients_local_data_source.dart';
import 'package:clients_app/features/clients/data/models/client_dto.dart';
import 'package:clients_app/features/clients/data/models/client_profile_dto.dart';
import 'package:clients_app/features/clients/data/repositories/clients_repository_impl.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocalDataSource extends Mock implements ClientsLocalDataSource {}

void main() {
  late _MockLocalDataSource dataSource;
  late ClientsRepositoryImpl repository;

  setUp(() {
    dataSource = _MockLocalDataSource();
    repository = ClientsRepositoryImpl(dataSource);
  });

  group('getClients', () {
    test('maps DTOs to entities', () async {
      final dto = ClientDto(
        id: 1,
        name: 'Maya',
        role: 'Designer',
        photoAsset: 'a.jpg',
        onboardedAt: DateTime(2024, 5, 20),
        hotScore: 8,
      );
      when(dataSource.fetchClients).thenAnswer((_) async => [dto]);

      final result = await repository.getClients();

      expect(
        result,
        isA<Ok<List<Client>>>().having(
          (ok) => ok.value.single,
          'client',
          isA<Client>()
              .having((c) => c.id, 'id', 1)
              .having((c) => c.hotScore, 'hotScore', 8),
        ),
      );
    });

    test('returns a ParsingFailure instead of throwing', () async {
      when(
        dataSource.fetchClients,
      ).thenThrow(const ParsingException('bad json'));

      final result = await repository.getClients();

      expect(
        result,
        isA<Err<List<Client>>>().having(
          (err) => err.failure,
          'failure',
          isA<ParsingFailure>(),
        ),
      );
    });
  });

  group('getClientProfile', () {
    test('maps the DTO, including the session duration', () async {
      final dto = ClientProfileDto(
        location: 'Brooklyn, NY',
        totalValue: 18400,
        projectCount: 12,
        rating: 4.9,
        nextSessionAt: DateTime(2024, 5, 27, 10, 30),
        nextSessionMinutes: 60,
        latestNote: 'Approved.',
      );
      when(
        () => dataSource.fetchClientProfile(1),
      ).thenAnswer((_) async => dto);

      final result = await repository.getClientProfile(1);

      expect(
        result,
        isA<Ok<ClientProfile>>().having(
          (ok) => ok.value,
          'profile',
          isA<ClientProfile>()
              .having((p) => p.clientId, 'clientId', 1)
              .having(
                (p) => p.nextSession.duration,
                'duration',
                const Duration(minutes: 60),
              ),
        ),
      );
    });

    test('returns a NotFoundFailure for unknown clients', () async {
      when(
        () => dataSource.fetchClientProfile(99),
      ).thenThrow(const NotFoundException('missing'));

      final result = await repository.getClientProfile(99);

      expect(
        result,
        isA<Err<ClientProfile>>().having(
          (err) => err.failure,
          'failure',
          isA<NotFoundFailure>(),
        ),
      );
    });
  });
}
