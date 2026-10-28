import 'package:clients_app/app/app.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/features/clients/data/repositories/clients_repository_impl.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';
import 'package:clients_app/features/clients/domain/repositories/clients_repository.dart';
import 'package:clients_app/features/transactions/data/repositories/transactions_repository_impl.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'client_fixtures.dart';
import 'transaction_fixtures.dart';

class _FakeClientsRepository implements ClientsRepository {
  @override
  Future<Result<List<Client>>> getClients() async => Ok(sampleClients);

  @override
  Future<Result<ClientProfile>> getClientProfile(int clientId) async =>
      Ok(sampleProfile.copyWith(clientId: clientId));
}

class _FakeTransactionsRepository implements TransactionsRepository {
  @override
  Future<Result<List<Transaction>>> getTransactions() async =>
      Ok(sampleTransactions);
}

/// Logical size of the phone the designs were made for.
const phoneSize = Size(393, 852);

/// Pumps the whole app (real router and screens) on fixture data, at
/// [fixedNow] and a logical [size] that defaults to a phone.
Future<void> pumpApp(WidgetTester tester, {Size size = phoneSize}) async {
  tester.view
    ..physicalSize = size * 3
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        clientsRepositoryProvider.overrideWithValue(_FakeClientsRepository()),
        transactionsRepositoryProvider.overrideWithValue(
          _FakeTransactionsRepository(),
        ),
        nowProvider.overrideWithValue(fixedNow),
      ],
      child: const App(),
    ),
  );
  await tester.pumpAndSettle();
}
