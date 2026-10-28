import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/l10n/l10n.dart';
import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/core/theme/app_radius.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/core/theme/app_text_styles.dart';
import 'package:clients_app/features/clients/controllers/client_filter_controller.dart';
import 'package:clients_app/shared/widgets/app_top_bar.dart';
import 'package:clients_app/shared/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Brand mark and a search button that unfolds into a search field.
///
/// Whether the field is open is ephemeral UI state; the query itself lives
/// in [ClientSearchController] so the grid can react to it.
class HomeTopBar extends ConsumerStatefulWidget {
  const HomeTopBar({super.key});

  @override
  ConsumerState<HomeTopBar> createState() => _HomeTopBarState();
}

class _HomeTopBarState extends ConsumerState<HomeTopBar> {
  final _queryController = TextEditingController();
  bool _searching = false;

  void _toggleSearch() {
    if (_searching) {
      _queryController.clear();
      ref.read(clientSearchControllerProvider.notifier).clear();
    }
    setState(() => _searching = !_searching);
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppTopBar(
      leading: _BrandMark(mark: l10n.brandMark),
      title: AnimatedSwitcher(
        duration: context.motion(AppDurations.medium),
        switchInCurve: AppCurves.emphasized,
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SizeTransition(
            axis: Axis.horizontal,
            // Unfolds from the search button towards the logo.
            alignment: AlignmentDirectional.centerEnd,
            sizeFactor: animation,
            child: child,
          ),
        ),
        child: _searching
            ? _SearchField(
                controller: _queryController,
                hint: l10n.searchHint,
                onChanged: ref
                    .read(clientSearchControllerProvider.notifier)
                    .search,
              )
            : const SizedBox.shrink(),
      ),
      trailing: CircleIconButton(
        icon: _searching ? Icons.close_rounded : Icons.search_rounded,
        tooltip: _searching ? l10n.closeSearch : l10n.search,
        onPressed: _toggleSearch,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  static const _contentPadding = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: CircleIconButton.size,
      child: TextField(
        controller: controller,
        autofocus: true,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: AppTextStyles.pageLabel,
        cursorColor: AppColors.ink,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.body,
          filled: true,
          fillColor: AppColors.iconButton,
          contentPadding: _contentPadding,
          border: OutlineInputBorder(
            borderRadius: AppRadius.pillBorder,
            borderSide: BorderSide.none,
          ),
        ),
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
