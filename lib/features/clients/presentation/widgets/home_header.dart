import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/core/utils/part_of_day.dart';
import 'package:clients_app/features/clients/controllers/home_header_controller.dart';
import 'package:clients_app/shared/widgets/not_in_demo_notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  static const _padding = EdgeInsets.fromLTRB(
    AppSpacing.screenHorizontal,
    26,
    AppSpacing.screenHorizontal,
    30,
  );
  static const _greetingBottomGap = 30.0;
  static const _statsGap = 28.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final header = ref.watch(homeHeaderProvider);
    final l10n = context.l10n;

    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Formatters.longDate(header.today, l10n.localeName).toUpperCase(),
            style: AppTextStyles.eyebrow,
          ),
          const SizedBox(height: AppSpacing.sm),
          _Greeting(
            greeting: _greetingFor(header.partOfDay, l10n),
            userName: header.userName,
          ),
          const SizedBox(height: _greetingBottomGap),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: AppSpacing.lg,
            children: [
              // Stats shrink (and ellipsize) before pushing the button out.
              Expanded(
                child: Row(
                  spacing: _statsGap,
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
              _AddButton(tooltip: l10n.addClient),
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
          child: Text(greeting, style: AppTextStyles.display),
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
          style: AppTextStyles.display,
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
      spacing: AppSpacing.xxs,
      children: [
        Text(value, style: AppTextStyles.statValue),
        Text(
          label,
          style: AppTextStyles.caption,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.tooltip});

  final String tooltip;

  static const _size = 48.0;
  static const _iconSize = 22.0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () => showNotInDemoNotice(context),
      icon: const Icon(Icons.add_rounded, size: _iconSize),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.ink,
        fixedSize: const Size.square(_size),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
  }
}
