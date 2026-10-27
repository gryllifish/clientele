import 'package:clients_app/core/utils/part_of_day.dart';
import 'package:clients_app/features/clients/controllers/clients_controller.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:clients_app/shared/providers/session_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_header_controller.freezed.dart';
part 'home_header_controller.g.dart';

@freezed
abstract class HomeHeaderState with _$HomeHeaderState {
  const factory HomeHeaderState({
    required DateTime today,
    required PartOfDay partOfDay,
    required String userName,
    required int totalClients,
    required int clientsThisMonth,
  }) = _HomeHeaderState;
}

/// Greeting and stats for the dashboard header.
///
/// Counts are zero while clients load, so the header renders immediately.
@riverpod
HomeHeaderState homeHeader(Ref ref) {
  final now = ref.watch(nowProvider);
  final clients =
      ref.watch(clientsControllerProvider).value ?? const <Client>[];

  return HomeHeaderState(
    today: now,
    partOfDay: PartOfDay.of(now),
    userName: ref.watch(currentUserNameProvider),
    totalClients: clients.length,
    clientsThisMonth: clients
        .where((client) => client.wasOnboardedInMonthOf(now))
        .length,
  );
}
