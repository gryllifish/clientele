import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Tells the user that a control exists only for the look of the demo.
///
/// Replaces any notice already showing, so repeated taps don't queue up.
void showNotInDemoNotice(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          context.l10n.notInDemo,
          style: AppTextStyles.body.copyWith(color: AppColors.onDark),
        ),
        backgroundColor: AppColors.ink,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
    );
}
