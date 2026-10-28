import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

/// Screen header with a leading widget, an optional centered title and an
/// optional trailing widget.
class AppTopBar extends StatelessWidget {
  const AppTopBar({
    required this.leading,
    this.title,
    this.trailing,
    super.key,
  });

  static const _padding = EdgeInsets.fromLTRB(22, 20, 22, 10);

  final Widget leading;
  final Widget? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Row(
        spacing: AppSpacing.md,
        children: [
          leading,
          Expanded(child: Center(child: title)),
          // Keeps the title centered when there is no trailing action.
          trailing ?? const SizedBox.square(dimension: CircleIconButton.size),
        ],
      ),
    );
  }
}
