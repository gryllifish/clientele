import 'dart:ui';

import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/router/app_routes.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/shared/widgets/not_in_demo_notice.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Tabs of the bottom bar that lead somewhere in this demo.
enum AppTab {
  home(AppRoutes.home),
  payments(AppRoutes.payments);

  const AppTab(this.path);

  final String path;
}

/// Frosted bottom bar shared by the tab screens.
///
/// Home and Payments navigate; Clients and Settings explain that they are
/// outside the demo. The dark style matches the Payments screen.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({required this.current, this.dark = false, super.key});

  static const height = 72.0;

  final AppTab current;
  final bool dark;

  static const _blurSigma = 15.0;
  static const _backgroundOpacity = 0.92;
  static const _indicatorSize = Size(28, 3);
  static const _indicatorTop = 8.0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = [
      (icon: Icons.grid_view_outlined, label: l10n.navHome, tab: AppTab.home),
      (
        icon: Icons.receipt_long_outlined,
        label: l10n.navPayments,
        tab: AppTab.payments,
      ),
      (icon: Icons.people_outline_rounded, label: l10n.navClients, tab: null),
      (icon: Icons.settings_outlined, label: l10n.navSettings, tab: null),
    ];
    final selectedIndex = items.indexWhere((item) => item.tab == current);
    final (background, divider, selectedColor, idleColor) = dark
        ? (
            AppColors.darkSurface,
            AppColors.darkDivider,
            AppColors.onDark,
            AppColors.onDarkMuted,
          )
        : (
            AppColors.surface,
            AppColors.divider,
            AppColors.ink,
            AppColors.inkSubtle,
          );

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: background.withValues(alpha: _backgroundOpacity),
            border: Border(top: BorderSide(color: divider)),
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
                            itemWidth * selectedIndex +
                            (itemWidth - _indicatorSize.width) / 2,
                        width: _indicatorSize.width,
                        height: _indicatorSize.height,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: selectedColor,
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
                                selected: index == selectedIndex,
                                color: index == selectedIndex
                                    ? selectedColor
                                    : idleColor,
                                onTap: switch (item.tab) {
                                  // Re-tapping a tab resets it, e.g. clears
                                  // a client filter on Payments.
                                  final AppTab tab => () => context.go(
                                    tab.path,
                                  ),
                                  null => () => showNotInDemoNotice(context),
                                },
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
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  static const _iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
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
