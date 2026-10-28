import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/failure_messages.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/features/clients/controllers/client_profile_controller.dart';
import 'package:clients_app/features/clients/controllers/clients_controller.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_profile_header.dart';
import 'package:clients_app/features/clients/presentation/widgets/next_session_card.dart';
import 'package:clients_app/shared/widgets/app_top_bar.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:clients_app/shared/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ClientProfileScreen extends ConsumerWidget {
  const ClientProfileScreen({required this.clientId, super.key});

  final int clientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(clientByIdProvider(clientId));
    final profile = ref.watch(clientProfileControllerProvider(clientId));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(child: _ProfileTopBar()),
            ),
            ...switch (client) {
              AsyncData(:final value) => [
                SliverToBoxAdapter(
                  child: ClientProfileHeader(
                    client: value,
                    profile: profile.value,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _ProfileBody(
                    profile: profile,
                    onRetry: ref
                        .read(
                          clientProfileControllerProvider(clientId).notifier,
                        )
                        .retry,
                  ),
                ),
              ],
              AsyncError(:final error) => [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorView(
                    message: _errorMessage(context, error),
                    onRetry: ref.read(clientsControllerProvider.notifier).retry,
                  ),
                ),
              ],
              _ => [
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ],
            },
          ],
        ),
      ),
    );
  }
}

String _errorMessage(BuildContext context, Object error) => switch (error) {
  final Failure failure => failure.message(context.l10n),
  _ => context.l10n.errorUnexpected,
};

class _ProfileTopBar extends StatelessWidget {
  const _ProfileTopBar();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppTopBar(
      leading: CircleIconButton(
        icon: Icons.chevron_left_rounded,
        tooltip: l10n.back,
        onPressed: () => context.pop(),
      ),
      title: Text(l10n.clientProfileTitle, style: AppTextStyles.pageLabel),
      trailing: CircleIconButton(
        icon: Icons.more_horiz_rounded,
        tooltip: l10n.moreOptions,
        // Placeholder: client actions are out of scope for this demo.
        onPressed: () {},
      ),
    );
  }
}

/// White sheet with the next session and the latest note.
class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.profile, required this.onRetry});

  final AsyncValue<ClientProfile> profile;
  final VoidCallback onRetry;

  static const _padding = EdgeInsets.fromLTRB(19, 22, 19, AppSpacing.xxxl);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.sheetTop,
      ),
      child: Padding(
        padding: _padding,
        child: switch (profile) {
          AsyncData(:final value) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NextSessionCard(session: value.nextSession),
              _LatestNote(note: value.latestNote),
            ],
          ),
          AsyncError(:final error) => ErrorView(
            message: _errorMessage(context, error),
            onRetry: onRetry,
          ),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ),
    );
  }
}

class _LatestNote extends StatelessWidget {
  const _LatestNote({required this.note});

  final String note;

  static const _padding = EdgeInsets.fromLTRB(5, 22, 5, 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.sm,
        children: [
          Text(
            context.l10n.latestNote.toUpperCase(),
            style: AppTextStyles.eyebrow.copyWith(color: AppColors.inkSubtle),
          ),
          Text(note, style: AppTextStyles.note),
        ],
      ),
    );
  }
}
