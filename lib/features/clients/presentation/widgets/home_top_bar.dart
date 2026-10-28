import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/shared/widgets/app_top_bar.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTopBar(
      leading: _BrandMark(mark: context.l10n.brandMark),
      trailing: CircleIconButton(
        icon: Icons.search_rounded,
        tooltip: context.l10n.search,
        // Placeholder: search is out of scope for this demo.
        onPressed: () {},
      ),
    );
  }
}

/// Round logo whose first letter is highlighted.
class _BrandMark extends StatelessWidget {
  const _BrandMark({required this.mark});

  final String mark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CircleIconButton.size,
      height: CircleIconButton.size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.ink,
        shape: BoxShape.circle,
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: mark.characters.first,
              style: const TextStyle(color: AppColors.accent),
            ),
            TextSpan(text: mark.characters.skip(1).toString()),
          ],
        ),
        style: AppTextStyles.brand,
      ),
    );
  }
}
