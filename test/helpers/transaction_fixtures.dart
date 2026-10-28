import 'package:clients_app/features/transactions/domain/entities/transaction.dart';

Transaction buildTransaction({
  required int id,
  required int amount,
  required DateTime occurredAt,
}) => Transaction(
  id: id,
  title: 'Project $id',
  clientName: 'Client $id',
  amount: amount,
  occurredAt: occurredAt,
  participants: [
    TransactionParticipant(
      clientId: id,
      photoAsset: 'assets/images/clients/client_0$id.jpg',
    ),
  ],
);

/// Relative to `fixedNow` (May 24, 2026, 9:00) and a 30-day window:
/// 1, 2 and 3 are recent (total 600), 4 and 5 are in the previous window
/// (total 500) and 6 is older than both.
final List<Transaction> sampleTransactions = [
  buildTransaction(id: 3, amount: 300, occurredAt: DateTime(2026, 4, 25, 8)),
  buildTransaction(id: 1, amount: 100, occurredAt: DateTime(2026, 5, 24, 18)),
  buildTransaction(id: 2, amount: 200, occurredAt: DateTime(2026, 5, 10)),
  buildTransaction(id: 4, amount: 400, occurredAt: DateTime(2026, 4, 24, 23)),
  buildTransaction(id: 5, amount: 100, occurredAt: DateTime(2026, 3, 26)),
  buildTransaction(id: 6, amount: 900, occurredAt: DateTime(2026, 3, 25)),
];
