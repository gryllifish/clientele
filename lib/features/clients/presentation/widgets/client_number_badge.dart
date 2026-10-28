import 'dart:ui';

import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/core/utils/formatters.dart';
import 'package:flutter/material.dart';

/// Frosted "01"-style label shown over client photos.
class ClientNumberBadge extends StatelessWidget {
  const ClientNumberBadge({required this.clientId, super.key});

  final int clientId;

  static const _padding = EdgeInsets.symmetric(horizontal: 7, vertical: 4);
  static const _blurSigma = 5.0;
  static const _backgroundOpacity = 0.82;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
        child: ColoredBox(
          color: AppColors.surface.withValues(alpha: _backgroundOpacity),
          child: Padding(
            padding: _padding,
            child: Text(
              Formatters.twoDigits(clientId),
              style: AppTextStyles.badge,
            ),
          ),
        ),
      ),
    );
  }
}
