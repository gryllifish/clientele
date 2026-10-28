import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/failure_messages.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/features/transactions/controllers/transactions_controller.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:clients_app/features/transactions/presentation/widgets/transactions_header.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:clients_app/shared/widgets/app_top_bar.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:clients_app/shared/widgets/error_view.dart';
import 'package:clients_app/shared/widgets/rise_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statement = ref.watch(transactionStatementProvider);
    final now = ref.watch(nowProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: CustomScrollView(
          slivers: [
            const SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(child: _TransactionsTopBar()),
            ),
            ...switch (statement) {
              AsyncData(:final value) => [
                SliverToBoxAdapter(
                  child: TransactionsHeader(statement: value),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _RecentActivity(transactions: value.recent, now: now),
                ),
              ],
              AsyncError(:final error) => [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorView(
                    message: switch (error) {
                      final Failure failure => failure.message(context.l10n),
                      _ => context.l10n.errorUnexpected,
                    },
                    onRetry: ref
                        .read(transactionsControllerProvider.notifier)
                        .retry,
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

class _TransactionsTopBar extends StatelessWidget {
  const _TransactionsTopBar();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppTopBar(
      leading: CircleIconButton(
        icon: Icons.chevron_left_rounded,
        tooltip: l10n.back,
        onPressed: () => context.pop(),
        backgroundColor: AppColors.darkIconButton,
        foregroundColor: AppColors.onDark,
      ),
      title: Text(
        l10n.transactionsTitle,
        style: AppTextStyles.pageLabel.copyWith(color: AppColors.onDark),
      ),
      trailing: CircleIconButton(
        icon: Icons.more_horiz_rounded,
        tooltip: l10n.moreOptions,
        // Placeholder: statement actions are out of scope for this demo.
        onPressed: () {},
        backgroundColor: AppColors.darkIconButton,
        foregroundColor: AppColors.onDark,
      ),
    );
  }
}

/// Dark sheet listing the period's transactions, which rise in one by one.
class _RecentActivity extends StatelessWidget {
  const _RecentActivity({required this.transactions, required this.now});

  final List<Transaction> transactions;
  final DateTime now;

  static const _padding = EdgeInsets.fromLTRB(17, 22, 17, 30);
  static const _titlePadding = EdgeInsets.fromLTRB(5, 0, 5, AppSpacing.lg);
  static const _cardGap = 10.0;
  static const _staggerStep = Duration(milliseconds: 70);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppRadius.sheetTop,
      ),
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: _titlePadding,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.recentActivity,
                      style: AppTextStyles.cardTitle.copyWith(
                        color: AppColors.onDark,
                      ),
                    ),
                  ),
                  Text(
                    l10n.transactionCount(transactions.length),
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.onDarkMuted,
                    ),
                  ),
                ],
              ),
            ),
            if (transactions.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
                child: Text(
                  l10n.noTransactions,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.onDarkMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            for (final (index, transaction) in transactions.indexed)
              Padding(
                padding: const EdgeInsets.only(bottom: _cardGap),
                child: RiseIn(
                  key: ValueKey(transaction.id),
                  enterDelay: _staggerStep * index,
                  child: TransactionCard(
                    transaction: transaction,
                    color: AppColors.transactionFor(index),
                    now: now,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
