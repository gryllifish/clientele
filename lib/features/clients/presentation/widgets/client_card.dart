import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_number_badge.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_photo.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({required this.client, this.onTap, super.key});

  /// Card height from the design; width comes from the grid column.
  static const double height = 202;

  static const _inset = 10.0;
  static const _photoHeight = 130.0;
  static const _textInset = 13.0;
  static const _badgeInset = 7.0;
  static const _arrowSize = 16.0;
  static const _roleOpacity = 0.58;

  final Client client;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: context.l10n.openClientProfile(client.name),
      excludeSemantics: true,
      child: Material(
        color: AppColors.cardFor(client.id),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Positioned(
                top: _inset,
                left: _inset,
                right: _inset,
                height: _photoHeight,
                child: ClientPhoto(
                  client: client,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
              ),
              Positioned(
                top: _inset + _badgeInset,
                left: _inset + _badgeInset,
                child: ClientNumberBadge(clientId: client.id),
              ),
              Positioned(
                left: _textInset,
                right: _textInset,
                bottom: _textInset,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: _NameAndRole(client: client)),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: _arrowSize,
                      color: AppColors.ink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NameAndRole extends StatelessWidget {
  const _NameAndRole({required this.client});

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          client.name,
          style: AppTextStyles.cardName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          client.role,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.ink.withValues(alpha: ClientCard._roleOpacity),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
