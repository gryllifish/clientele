import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/failure_messages.dart';
import 'package:clients_app/core/l10n/l10n.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        AppSpacing.xl;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.sheet),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: AppSpacing.xxl, bottom: bottomInset),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(count: clients.value?.length),
            const SizedBox(height: AppSpacing.xl),
            const ClientFilterChips(),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
              ),
              child: switch (clients) {
                AsyncData(:final value) => AnimatedClientGrid(clients: value),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.count});

  /// Null while loading.
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        spacing: AppSpacing.md,
        children: [
          Text(context.l10n.yourClients, style: AppTextStyles.sectionTitle),
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
              style: AppTextStyles.body,
            ),
          ),
        ],
      ),
    );
  }
}
