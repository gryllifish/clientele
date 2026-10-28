import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/core/utils/part_of_day.dart';
import 'package:clients_app/features/clients/controllers/home_header_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final header = ref.watch(homeHeaderProvider);
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenHorizontal,
        vertical: AppSpacing.xxxl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Formatters.longDate(header.today, l10n.localeName).toUpperCase(),
            style: AppTextStyles.overline,
          ),
          const SizedBox(height: AppSpacing.lg),
          _Greeting(
            greeting: _greetingFor(header.partOfDay, l10n),
            userName: header.userName,
          ),
          const SizedBox(height: AppSpacing.xxl),
          Row(
            spacing: AppSpacing.lg,
            children: [
              // Stats shrink (and ellipsize) before pushing the button out.
              Expanded(
                child: Row(
                  spacing: AppSpacing.xl,
                  children: [
                    Flexible(
                      child: _Stat(
                        value: Formatters.twoDigits(header.totalClients),
                        label: l10n.totalClients,
                      ),
                    ),
                    Flexible(
                      child: _Stat(
                        value: Formatters.twoDigits(header.clientsThisMonth),
                        label: l10n.clientsThisMonth,
                      ),
                    ),
                  ],
                ),
              ),
              _AddButton(semanticLabel: l10n.addClient),
            ],
          ),
        ],
      ),
    );
  }

  String _greetingFor(PartOfDay period, AppLocalizations l10n) =>
      switch (period) {
        PartOfDay.morning => l10n.greetingMorning,
        PartOfDay.afternoon => l10n.greetingAfternoon,
        PartOfDay.evening => l10n.greetingEvening,
      };
}

class _Greeting extends StatelessWidget {
  const _Greeting({required this.greeting, required this.userName});

  final String greeting;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Shrinks long greetings instead of wrapping on small phones.
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(greeting, style: AppTextStyles.greeting),
        ),
        Text.rich(
          TextSpan(
            text: userName,
            children: const [
              TextSpan(
                text: '.',
                style: TextStyle(color: AppColors.coral),
              ),
            ],
          ),
          style: AppTextStyles.greeting,
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.xs,
      children: [
        Text(value, style: AppTextStyles.statValue),
        Text(
          label,
          style: AppTextStyles.body,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.semanticLabel});

  final String semanticLabel;

  static const _size = Size(84, 76);
  static const _iconSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticLabel,
      child: Material(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          // Placeholder: creating clients is out of scope for this demo.
          onTap: () {},
          child: SizedBox.fromSize(
            size: _size,
            child: const Icon(
              Icons.add,
              size: _iconSize,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}
