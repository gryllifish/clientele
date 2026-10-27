import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/clients/data/datasources/clients_local_data_source.dart';
import 'package:clients_app/features/clients/data/models/client_dto.dart';
import 'package:clients_app/features/clients/data/repositories/clients_repository_impl.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
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

  group('ClientsRepositoryImpl.getClients', () {
    test('maps DTOs to entities', () async {
      final dto = ClientDto(
        id: 1,
        name: 'Maya',
        role: 'Designer',
        photoAsset: 'a.jpg',
        onboardedAt: DateTime.utc(2026, 5, 20),
        isHot: true,
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
              .having((c) => c.isHot, 'isHot', isTrue),
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
}
