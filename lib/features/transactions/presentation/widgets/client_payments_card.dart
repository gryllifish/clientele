import 'dart:async';

import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/failure_messages.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/router/app_routes.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/features/transactions/controllers/transactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// A client's last 30 days of payments, opening the Payments tab narrowed
/// to them.
///
/// Public entry point of the transactions feature for other features (the
/// client profile embeds it), so they never touch its internals.
class ClientPaymentsCard extends ConsumerWidget {
  const ClientPaymentsCard({
    required this.clientId,
    required this.clientName,
    super.key,
  });

  final int clientId;
  final String clientName;

  static const _padding = EdgeInsets.all(15);
  static const _iconBoxSize = 47.0;
  static const _arrowCircleSize = 34.0;
  static const _arrowSize = 18.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final statement = ref.watch(transactionStatementProvider(clientId));
    final summary = switch (statement) {
      AsyncData(:final value) => l10n.clientPaymentsSummary(
        Formatters.usd(value.total, l10n.localeName),
        value.recent.length,
      ),
      AsyncError(error: final Failure failure) => failure.message(l10n),
      AsyncError() => l10n.errorUnexpected,
      _ => l10n.valuePlaceholder,
    };

    return Material(
      color: AppColors.chip,
      borderRadius: BorderRadius.circular(AppRadius.lg),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => unawaited(
          context.push<void>(AppRoutes.paymentsPath(clientId: clientId)),
        ),
        child: Padding(
          padding: _padding,
          child: Row(
            spacing: AppSpacing.md,
            children: [
              Container(
                width: _iconBoxSize,
                height: _iconBoxSize,
                decoration: BoxDecoration(
                  color: AppColors.darkBackground,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Icon(
                  Icons.receipt_long_outlined,
                  color: AppColors.accent,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.xxs,
                  children: [
                    Text(
                      l10n.paymentsFromClient(clientName),
                      style: AppTextStyles.cardTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(summary, style: AppTextStyles.caption),
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
