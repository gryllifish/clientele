import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';
import 'package:flutter/material.dart';

/// Lime card with the next scheduled session.
class NextSessionCard extends StatelessWidget {
  const NextSessionCard({required this.session, this.onTap, super.key});

  final ClientSession session;
  final VoidCallback? onTap;

  static const _padding = EdgeInsets.all(15);
  static const _iconBoxSize = 47.0;
  static const _arrowCircleSize = 34.0;
  static const _arrowSize = 18.0;
  static const _secondaryOpacity = 0.6;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final secondary = AppColors.ink.withValues(alpha: _secondaryOpacity);

    return Material(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: _padding,
          child: Row(
            spacing: AppSpacing.md,
            children: [
              Container(
                width: _iconBoxSize,
                height: _iconBoxSize,
                decoration: BoxDecoration(
                  color: AppColors.ink,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.surface,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.xxs,
                  children: [
                    Text(
                      l10n.nextSession.toUpperCase(),
                      style: AppTextStyles.eyebrow.copyWith(color: secondary),
                    ),
                    Text(
                      Formatters.shortDate(session.startsAt, locale),
                      style: AppTextStyles.cardTitle,
                    ),
                    Text(
                      l10n.sessionTime(
                        Formatters.time(session.startsAt, locale),
                        session.duration.inMinutes,
                      ),
                      style: AppTextStyles.caption.copyWith(color: secondary),
                    ),
                  ],
                ),
              ),
              Container(
                width: _arrowCircleSize,
                height: _arrowCircleSize,
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: _arrowSize,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
