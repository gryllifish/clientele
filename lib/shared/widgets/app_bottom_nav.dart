import 'dart:ui';

import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/shared/widgets/not_in_demo_notice.dart';
import 'package:flutter/material.dart';

/// Frosted bottom bar.
///
/// Only Home exists in this demo; the other tabs explain that instead of
/// navigating. Wire it to a `StatefulShellRoute` once more tabs exist.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  static const height = 72.0;

  static const _blurSigma = 15.0;
  static const _backgroundOpacity = 0.92;
  static const _indicatorSize = Size(28, 3);
  static const _indicatorTop = 8.0;

  static const _selected = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = [
      (icon: Icons.grid_view_outlined, label: l10n.navHome),
      (icon: Icons.bar_chart_rounded, label: l10n.navInsights),
      (icon: Icons.people_outline_rounded, label: l10n.navClients),
      (icon: Icons.settings_outlined, label: l10n.navSettings),
    ];

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: _backgroundOpacity),
            border: const Border(
              top: BorderSide(color: AppColors.divider),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: AppBottomNav.height,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = constraints.maxWidth / items.length;
                  return Stack(
                    children: [
                      Positioned(
                        top: _indicatorTop,
                        left:
                            itemWidth * _selected +
                            (itemWidth - _indicatorSize.width) / 2,
                        width: _indicatorSize.width,
                        height: _indicatorSize.height,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.ink,
                            borderRadius: BorderRadius.circular(
                              _indicatorSize.height,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          for (final (index, item) in items.indexed)
                            Expanded(
                              child: _NavButton(
                                icon: item.icon,
                                label: item.label,
                                selected: index == _selected,
                                onTap: index == _selected
                                    ? null
                                    : () => showNotInDemoNotice(context),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  static const _iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.ink : AppColors.inkSubtle;

    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.xs,
          children: [
            Icon(icon, color: color, size: _iconSize),
            Text(label, style: AppTextStyles.caption.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
