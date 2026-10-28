import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/failure_messages.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/router/app_routes.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/features/clients/controllers/client_filter_controller.dart';
import 'package:clients_app/features/clients/controllers/clients_controller.dart';
import 'package:clients_app/features/clients/presentation/widgets/animated_client_grid.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_filter_chips.dart';
import 'package:clients_app/shared/widgets/app_bottom_nav.dart';
import 'package:clients_app/shared/widgets/error_view.dart';
import 'package:clients_app/shared/widgets/rise_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// White sheet with the title, filters and the client grid.
class ClientsSection extends ConsumerWidget {
  const ClientsSection({super.key});

  static const _loadingHeight = 240.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(visibleClientsProvider);
    final bottomInset =
        MediaQuery.paddingOf(context).bottom +
        AppBottomNav.height +
        AppSpacing.xxl;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.sheetTop,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: AppSpacing.xl, bottom: bottomInset),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(count: clients.value?.length),
            const SizedBox(height: AppSpacing.lg),
            const ClientFilterChips(),
            const SizedBox(height: AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sheetHorizontal,
              ),
              child: switch (clients) {
                AsyncData(:final value) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedClientGrid(
                      clients: value,
                      onClientTap: (client) =>
                          context.go(AppRoutes.clientProfilePath(client.id)),
                    ),
                    if (value.isEmpty) const _NoMatches(),
                  ],
                ),
                AsyncError(:final error) => ErrorView(
                  message: _errorMessage(context, error),
                  onRetry: ref.read(clientsControllerProvider.notifier).retry,
                ),
                _ => const SizedBox(
                  height: _loadingHeight,
                  child: Center(child: CircularProgressIndicator()),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }

  String _errorMessage(BuildContext context, Object error) => switch (error) {
    final Failure failure => failure.message(context.l10n),
    _ => context.l10n.errorUnexpected,
  };
}

/// Shown when the search leaves the grid empty.
class _NoMatches extends ConsumerWidget {
  const _NoMatches();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(clientSearchControllerProvider).trim();

    return RiseIn(
      // Waits for the last cards to leave before rising in.
      enterDelay: AppDurations.medium,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
        child: Text(
          context.l10n.noClientsMatch(query),
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.count});

  /// Null while loading.
  final int? count;

  static const _horizontalPadding = 22.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        spacing: AppSpacing.sm,
        children: [
          Text(context.l10n.yourClients, style: AppTextStyles.title),
          AnimatedSwitcher(
            duration: AppDurations.fast,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0.4),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: Text(
              switch (count) {
                final int value => Formatters.twoDigits(value),
                null => '',
              },
              key: ValueKey(count),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.inkSubtle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
