import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/domain/entities/client_profile.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_number_badge.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_photo.dart';
import 'package:flutter/material.dart';

/// Portrait, name and key numbers at the top of the profile.
///
/// Renders immediately from [client]; [profile] fills in details once it
/// loads (null while loading).
class ClientProfileHeader extends StatelessWidget {
  const ClientProfileHeader({
    required this.client,
    required this.profile,
    super.key,
  });

  final Client client;
  final ClientProfile? profile;

  static const _padding = EdgeInsets.fromLTRB(
    AppSpacing.screenHorizontal,
    15,
    AppSpacing.screenHorizontal,
    AppSpacing.xl,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final location = profile?.location;

    return Padding(
      padding: _padding,
      child: Column(
        children: [
          _Portrait(client: client),
          const SizedBox(height: AppSpacing.xl),
          Text(
            l10n
                .workingTogetherSince(client.onboardedAt.year.toString())
                .toUpperCase(),
            style: AppTextStyles.eyebrow,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            client.name,
            style: AppTextStyles.headline,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            location == null
                ? client.role
                : l10n.roleAtLocation(client.role, location),
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          _ProfileStats(profile: profile),
        ],
      ),
    );
  }
}

/// Arch-shaped frame around the Hero photo.
class _Portrait extends StatelessWidget {
  const _Portrait({required this.client});

  final Client client;

  static const _size = Size(224, 244);
  static const _inset = 10.0;
  static const _frameRadius = BorderRadius.vertical(
    top: Radius.circular(98),
    bottom: Radius.circular(28),
  );
  static const _photoRadius = BorderRadius.vertical(
    top: Radius.circular(88),
    bottom: Radius.circular(21),
  );
  static const _badgeOffset = Offset(22, 20);
  static const _dotOffset = Offset(17, 25);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: _size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cardFor(client.id),
          borderRadius: _frameRadius,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(_inset),
                child: ClientPhoto(client: client, borderRadius: _photoRadius),
              ),
            ),
            Positioned(
              left: _badgeOffset.dx,
              top: _badgeOffset.dy,
              child: ClientNumberBadge(clientId: client.id),
            ),
            Positioned(
              right: _dotOffset.dx,
              bottom: _dotOffset.dy,
              child: const _StatusDot(),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Active" indicator on the portrait.
class _StatusDot extends StatelessWidget {
  const _StatusDot();

  static const _size = 19.0;
  static const _borderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: AppColors.accent,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.background,
          width: _borderWidth,
        ),
      ),
    );
  }
}

class _ProfileStats extends StatelessWidget {
  const _ProfileStats({required this.profile});

  final ClientProfile? profile;

  static const _gap = 38.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = l10n.localeName;
    final profile = this.profile;
    String valueOr(String Function(ClientProfile) format) =>
        profile == null ? l10n.valuePlaceholder : format(profile);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: _gap,
      children: [
        _Stat(
          value: valueOr((p) => Formatters.compactUsd(p.totalValue, locale)),
          label: l10n.totalValue,
        ),
        _Stat(
          value: valueOr((p) => p.projectCount.toString()),
          label: l10n.projects,
        ),
        _Stat(
          value: valueOr((p) => Formatters.rating(p.rating, locale)),
          label: l10n.rating,
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
      children: [
        AnimatedSwitcher(
          duration: AppDurations.fast,
          child: Text(
            value,
            key: ValueKey(value),
            style: AppTextStyles.statValueSmall,
          ),
        ),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
