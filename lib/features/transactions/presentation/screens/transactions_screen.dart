import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/failure_messages.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/router/app_routes.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/features/transactions/controllers/transactions_controller.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:clients_app/features/transactions/presentation/widgets/transaction_card.dart';
import 'package:clients_app/features/transactions/presentation/widgets/transactions_header.dart';
import 'package:clients_app/shared/providers/clock_provider.dart';
import 'package:clients_app/shared/widgets/app_bottom_nav.dart';
import 'package:clients_app/shared/widgets/app_top_bar.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:clients_app/shared/widgets/error_view.dart';
import 'package:clients_app/shared/widgets/not_in_demo_notice.dart';
import 'package:clients_app/shared/widgets/rise_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The Payments tab: income over the last 30 days, for every client or,
/// when opened from a profile, only for [clientId].
class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({this.clientId, super.key});

  final int? clientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statement = ref.watch(transactionStatementProvider(clientId));
    final now = ref.watch(nowProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        extendBody: true,
        bottomNavigationBar: const AppBottomNav(
          current: AppTab.payments,
          dark: true,
        ),
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
                  child: _LatestPayments(
                    transactions: value.recent,
                    now: now,
                    clientId: clientId,
                  ),
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
      // A tab has nowhere to go back to; a page pushed from a profile does.
      leading: context.canPop()
          ? CircleIconButton(
              icon: Icons.chevron_left_rounded,
              tooltip: l10n.back,
              onPressed: () => context.pop(),
              backgroundColor: AppColors.darkIconButton,
              foregroundColor: AppColors.onDark,
            )
          : null,
      title: Text(
        l10n.transactionsTitle,
        style: AppTextStyles.pageLabel.copyWith(color: AppColors.onDark),
      ),
      trailing: CircleIconButton(
        icon: Icons.more_horiz_rounded,
        tooltip: l10n.moreOptions,
        onPressed: () => showNotInDemoNotice(context),
        backgroundColor: AppColors.darkIconButton,
        foregroundColor: AppColors.onDark,
      ),
    );
  }
}

/// Dark sheet listing the period's payments, which rise in one by one.
class _LatestPayments extends StatelessWidget {
  const _LatestPayments({
    required this.transactions,
    required this.now,
    required this.clientId,
  });

  final List<Transaction> transactions;
  final DateTime now;
  final int? clientId;

  static const _padding = EdgeInsets.fromLTRB(17, 22, 17, 30);
  static const _titlePadding = EdgeInsets.fromLTRB(5, 0, 5, AppSpacing.lg);
  static const _cardGap = 10.0;
  static const _staggerStep = Duration(milliseconds: 70);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // Leaves room for the bottom bar drawn over the content.
    final bottomInset =
        MediaQuery.paddingOf(context).bottom + AppBottomNav.height;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: AppRadius.sheetTop,
      ),
      child: Padding(
        padding: _padding.add(EdgeInsets.only(bottom: bottomInset)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: _titlePadding,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.latestPayments,
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
            if (clientId case final int id) _ClientFilterChip(clientId: id),
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

/// Shows which client the list is narrowed to, and clears it on tap.
class _ClientFilterChip extends ConsumerWidget {
  const _ClientFilterChip({required this.clientId});

  final int clientId;

  static const _padding = EdgeInsets.fromLTRB(5, 0, 5, AppSpacing.lg);
  static const _chipPadding = EdgeInsets.fromLTRB(14, 8, 10, 8);
  static const _closeIconSize = 14.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(payerNameProvider(clientId)).value;
    if (name == null) return const SizedBox.shrink();
    final l10n = context.l10n;

    return Padding(
      padding: _padding,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Material(
          color: AppColors.darkIconButton,
          shape: const StadiumBorder(),
          child: InkWell(
            customBorder: const StadiumBorder(),
            onTap: () => context.go(AppRoutes.paymentsPath()),
            child: Tooltip(
              message: l10n.showAllClients,
              child: Padding(
                padding: _chipPadding,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSpacing.xs,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.chip.copyWith(
                        color: AppColors.onDark,
                      ),
                    ),
                    const Icon(
                      Icons.close_rounded,
                      size: _closeIconSize,
                      color: AppColors.onDarkMuted,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
