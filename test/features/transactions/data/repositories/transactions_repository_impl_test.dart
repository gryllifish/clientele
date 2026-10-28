import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/transactions/data/datasources/transactions_local_data_source.dart';
import 'package:clients_app/features/transactions/data/models/transaction_dto.dart';
import 'package:clients_app/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocalDataSource extends Mock
    implements TransactionsLocalDataSource {}

void main() {
  late _MockLocalDataSource dataSource;
  late TransactionsRepositoryImpl repository;

  setUp(() {
    dataSource = _MockLocalDataSource();
    repository = TransactionsRepositoryImpl(dataSource);
  });

  test('maps DTOs to entities', () async {
    final dto = TransactionDto(
      id: 1,
      title: 'Brand direction',
      clientId: 1,
      clientName: 'Maya Chen',
      amount: 4200,
      occurredAt: DateTime(2024, 5, 24),
      participants: const [
        TransactionParticipantDto(clientId: 1, photoAsset: 'a.jpg'),
      ],
    );
    when(dataSource.fetchTransactions).thenAnswer((_) async => [dto]);

    final result = await repository.getTransactions();

    expect(
      result,
      isA<Ok<List<Transaction>>>().having(
        (ok) => ok.value.single.participants.single,
        'participant',
        const TransactionParticipant(clientId: 1, photoAsset: 'a.jpg'),
      ),
    );
  });

  test('maps data source exceptions to failures', () async {
    when(
      dataSource.fetchTransactions,
    ).thenThrow(const ParsingException('bad json'));

    expect(
      await repository.getTransactions(),
      isA<Err<List<Transaction>>>().having(
        (err) => err.failure,
        'failure',
        isA<ParsingFailure>(),
      ),
    );
  });
}
