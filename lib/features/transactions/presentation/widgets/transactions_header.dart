import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction_statement.dart';
import 'package:flutter/material.dart';

/// Period label, headline and the period total with its trend.
class TransactionsHeader extends StatelessWidget {
  const TransactionsHeader({required this.statement, super.key});

  final TransactionStatement statement;

  static const _padding = EdgeInsets.fromLTRB(
    AppSpacing.screenHorizontal,
    20,
    AppSpacing.screenHorizontal,
    26,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.transactionsPeriod.toUpperCase(),
            style: AppTextStyles.eyebrow.copyWith(color: AppColors.onDarkMuted),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text.rich(
            TextSpan(
              text: l10n.transactionsHeadline,
              children: const [
                TextSpan(
                  text: '.',
                  style: TextStyle(color: AppColors.coral),
                ),
              ],
            ),
            style: AppTextStyles.display.copyWith(color: AppColors.onDark),
          ),
          const SizedBox(height: AppSpacing.xxl),
          _PeriodTotal(statement: statement),
        ],
      ),
    );
  }
}

class _PeriodTotal extends StatelessWidget {
  const _PeriodTotal({required this.statement});

  final TransactionStatement statement;

  static const _trendPadding = EdgeInsets.only(bottom: 6);
  static const _trendIconSize = 12.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final total = Formatters.usd(statement.total, locale);
    final change = statement.change;
    final trendColor = (change ?? 0) < 0 ? AppColors.coral : AppColors.positive;

    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.darkDivider)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: AppSpacing.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: AppSpacing.md,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppSpacing.xs,
                children: [
                  Text(
                    l10n.periodTotal.toUpperCase(),
                    style: AppTextStyles.eyebrow.copyWith(
                      color: AppColors.onDarkMuted,
                    ),
                  ),
                  // Screen readers get the final amount, not every tick.
                  Semantics(
                    label: total,
                    excludeSemantics: true,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: statement.total.toDouble()),
                      duration: AppDurations.countUp,
                      curve: AppCurves.emphasized,
                      builder: (context, value, _) => Text(
                        Formatters.usd(value.round(), locale),
                        style: AppTextStyles.balance.copyWith(
                          color: AppColors.onDark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (change != null)
              Flexible(
                child: Padding(
                  padding: _trendPadding,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: AppSpacing.xs,
                    children: [
                      Icon(
                        change < 0 ? Icons.south_east : Icons.north_east,
                        size: _trendIconSize,
                        color: trendColor,
                      ),
                      Flexible(
                        child: Text(
                          l10n.changeFromPrevious(
                            Formatters.percent(change, locale),
                          ),
                          style: AppTextStyles.caption.copyWith(
                            color: trendColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
