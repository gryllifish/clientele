import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

/// Screen header with optional leading, centered title and trailing widgets.
class AppTopBar extends StatelessWidget {
  const AppTopBar({
    this.leading,
    this.title,
    this.trailing,
    super.key,
  });

  static const _padding = EdgeInsets.fromLTRB(22, 20, 22, 10);

  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Row(
        spacing: AppSpacing.md,
        children: [
          // Placeholders keep the title centered when an action is missing.
          leading ?? const SizedBox.square(dimension: CircleIconButton.size),
          Expanded(child: Center(child: title)),
          trailing ?? const SizedBox.square(dimension: CircleIconButton.size),
        ],
      ),
    );
  }
}
