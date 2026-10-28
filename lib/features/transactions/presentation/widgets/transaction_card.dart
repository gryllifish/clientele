import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/presentation/widgets/avatar_stack.dart';
import 'package:flutter/material.dart';

/// A colored card with one payment: date, amount, title and participants.
class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.transaction,
    required this.color,
    required this.now,
    super.key,
  });

  final Transaction transaction;
  final Color color;

  /// Lets the card label today's payments as "Today".
  final DateTime now;

  static const _padding = EdgeInsets.all(15);
  static const _titlePadding = EdgeInsets.only(top: 14, bottom: 13);
  static const _avatarGap = 9.0;
  static const _arrowCircleSize = 28.0;
  static const _arrowSize = 16.0;
  static const _dateOpacity = 0.55;
  static const _clientOpacity = 0.6;
  static const _arrowCircleOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final date = DateUtils.isSameDay(transaction.occurredAt, now)
        ? l10n.today
        : Formatters.monthDay(transaction.occurredAt, locale);
    final amount = Formatters.incomeUsd(transaction.amount, locale);

    return Semantics(
      label: l10n.transactionSemantics(
        transaction.title,
        amount,
        transaction.clientName,
        date,
      ),
      excludeSemantics: true,
      child: Container(
        padding: _padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    date,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.ink.withValues(alpha: _dateOpacity),
                    ),
                  ),
                ),
                Text(amount, style: AppTextStyles.cardName),
              ],
            ),
            Padding(
              padding: _titlePadding,
              child: Text(
                transaction.title,
                style: AppTextStyles.transactionTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                AvatarStack(participants: transaction.participants),
                const SizedBox(width: _avatarGap),
                Expanded(
                  child: Text(
                    transaction.clientName,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.ink.withValues(alpha: _clientOpacity),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Container(
                  width: _arrowCircleSize,
                  height: _arrowCircleSize,
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(
                      alpha: _arrowCircleOpacity,
                    ),
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
          ],
        ),
      ),
    );
  }
}
