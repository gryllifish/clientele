import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/router/app_routes.dart';
import 'package:clients_app/features/clients/presentation/screens/client_profile_screen.dart';
import 'package:clients_app/features/clients/presentation/screens/home_screen.dart';
import 'package:clients_app/features/transactions/presentation/screens/transactions_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Lives in `app/` (not `core/`) because it imports every feature's screens;
/// `core` must never depend on features.
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.clientProfile,
            redirect: (context, state) =>
                _clientIdOf(state) == null ? AppRoutes.home : null,
            pageBuilder: (context, state) => _fadeThroughPage(
              context,
              state,
              ClientProfileScreen(clientId: _clientIdOf(state) ?? 0),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.payments,
        pageBuilder: (context, state) => _fadeThroughPage(
          context,
          state,
          TransactionsScreen(
            clientId: int.tryParse(
              state.uri.queryParameters[AppRoutes.paymentsClientParam] ?? '',
            ),
          ),
        ),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

int? _clientIdOf(GoRouterState state) =>
    int.tryParse(state.pathParameters[AppRoutes.clientIdParam] ?? '');

/// Fade with a slight rise, so the Hero photo is the star of the transition.
///
/// With "Reduce motion" on, pages (and the Hero riding on them) switch
/// instantly.
CustomTransitionPage<void> _fadeThroughPage(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  const riseOffset = Offset(0, 0.015);

  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: context.motion(AppDurations.page),
    reverseTransitionDuration: context.motion(AppDurations.medium),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: AppCurves.emphasized,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween(begin: riseOffset, end: Offset.zero).animate(curved),
          child: child,
        ),
      );
    },
  );
}
