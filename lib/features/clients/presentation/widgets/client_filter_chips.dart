import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/features/clients/controllers/client_filter_controller.dart';
import 'package:clients_app/features/clients/domain/entities/client_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClientFilterChips extends ConsumerWidget {
  const ClientFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(clientFilterControllerProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
      ),
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          for (final filter in ClientFilter.values)
            _FilterChip(
              label: _labelFor(filter, context.l10n),
              selected: filter == selected,
              onTap: () => ref
                  .read(clientFilterControllerProvider.notifier)
                  .select(filter),
            ),
        ],
      ),
    );
  }

  String _labelFor(ClientFilter filter, AppLocalizations l10n) =>
      switch (filter) {
        ClientFilter.all => l10n.filterAll,
        ClientFilter.oldest => l10n.filterOldest,
        ClientFilter.newest => l10n.filterNewest,
        ClientFilter.hot => l10n.filterHot,
      };
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: AppDurations.fast,
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.ink : AppColors.chip,
            borderRadius: AppRadius.pillBorder,
          ),
          child: AnimatedDefaultTextStyle(
            duration: AppDurations.fast,
            style: AppTextStyles.body.copyWith(
              color: selected ? AppColors.surface : AppColors.inkMuted,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
