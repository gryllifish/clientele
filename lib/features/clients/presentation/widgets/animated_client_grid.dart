import 'dart:async';
import 'dart:math' as math;

import 'package:clients_app/core/constants/app_durations.dart';
import 'package:clients_app/core/theme/app_spacing.dart';
import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:clients_app/features/clients/presentation/widgets/client_card.dart';
import 'package:flutter/material.dart';

const _staggerStep = Duration(milliseconds: 40);
const _reflowEnterDelay = Duration(milliseconds: 180);
const Curve _moveCurve = Curves.easeInOutCubicEmphasized;

/// A two-column grid that animates between lists instead of rebuilding.
///
/// Cards are keyed by client id and absolutely positioned, so when the list
/// changes each card slides to its new slot, removed cards fade out in place
/// and new cards rise in once the others have started moving.
class AnimatedClientGrid extends StatefulWidget {
  const AnimatedClientGrid({
    required this.clients,
    this.onClientTap,
    this.crossAxisCount = 2,
    this.spacing = AppSpacing.gridGap,
    this.tileHeight = ClientCard.height,
    super.key,
  });

  final List<Client> clients;
  final ValueChanged<Client>? onClientTap;
  final int crossAxisCount;
  final double spacing;
  final double tileHeight;

  @override
  State<AnimatedClientGrid> createState() => _AnimatedClientGridState();
}

class _AnimatedClientGridState extends State<AnimatedClientGrid> {
  /// Cards playing their exit animation, mapped to the slot they leave from.
  final _leaving = <int, ({Client client, int index})>{};

  /// The first build staggers every card in; later builds only delay entries.
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _isFirstBuild = false);
  }

  @override
  void didUpdateWidget(AnimatedClientGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    final currentIds = {for (final c in widget.clients) c.id};
    for (final (index, client) in oldWidget.clients.indexed) {
      if (!currentIds.contains(client.id)) {
        _leaving[client.id] = (client: client, index: index);
      }
    }
    // A card that comes back mid-exit is simply shown again.
    _leaving.removeWhere((id, _) => currentIds.contains(id));
  }

  void _onExitComplete(int id) {
    if (mounted) setState(() => _leaving.remove(id));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = widget.crossAxisCount;
        final spacing = widget.spacing;
        final tileWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        final tileHeight = widget.tileHeight;
        final rows = (widget.clients.length / columns).ceil();
        final height = rows * tileHeight + math.max(0, rows - 1) * spacing;

        Widget positioned(
          int index, {
          required Widget child,
          required Key key,
        }) {
          return AnimatedPositioned(
            key: key,
            duration: AppDurations.slow,
            curve: _moveCurve,
            left: (index % columns) * (tileWidth + spacing),
            top: (index ~/ columns) * (tileHeight + spacing),
            width: tileWidth,
            height: tileHeight,
            child: child,
          );
        }

        return AnimatedContainer(
          duration: AppDurations.slow,
          curve: _moveCurve,
          height: height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Leaving cards go first so they render underneath moving ones.
              for (final MapEntry(key: id, value: leaving) in _leaving.entries)
                positioned(
                  leaving.index,
                  key: ValueKey(id),
                  child: _GridTile(
                    visible: false,
                    onHidden: () => _onExitComplete(id),
                    child: ClientCard(client: leaving.client),
                  ),
                ),
              for (final (index, client) in widget.clients.indexed)
                positioned(
                  index,
                  key: ValueKey(client.id),
                  child: _GridTile(
                    visible: true,
                    enterDelay: _isFirstBuild
                        ? _staggerStep * index
                        : _reflowEnterDelay,
                    child: ClientCard(
                      client: client,
                      onTap: switch (widget.onClientTap) {
                        final ValueChanged<Client> onTap => () => onTap(client),
                        null => null,
                      },
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Rises and fades its child in, or fades it out, depending on [visible].
class _GridTile extends StatefulWidget {
  const _GridTile({
    required this.visible,
    required this.child,
    this.enterDelay = Duration.zero,
    this.onHidden,
  });

  final bool visible;
  final Duration enterDelay;
  final VoidCallback? onHidden;
  final Widget child;

  @override
  State<_GridTile> createState() => _GridTileState();
}

class _GridTileState extends State<_GridTile>
    with SingleTickerProviderStateMixin {
  /// Entrance from the design: 18px lower and 97% scale.
  static const _enterOffset = Offset(0, 18);
  static const _enterScale = 0.97;

  late final _controller = AnimationController(
    vsync: this,
    duration: AppDurations.page,
    reverseDuration: AppDurations.medium,
  );
  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _controller,
    curve: AppCurves.emphasized,
    reverseCurve: Curves.easeInCubic,
  );
  Timer? _enterTimer;

  @override
  void initState() {
    super.initState();
    if (widget.visible) _enter();
  }

  @override
  void didUpdateWidget(_GridTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible == oldWidget.visible) return;
    if (widget.visible) {
      _enter();
    } else {
      _enterTimer?.cancel();
      // TickerFuture only completes when the animation finishes, not when
      // it's interrupted by a re-entry.
      unawaited(
        _controller.reverse().then((_) {
          if (!widget.visible) widget.onHidden?.call();
        }),
      );
    }
  }

  void _enter() {
    _enterTimer?.cancel();
    _enterTimer = Timer(widget.enterDelay, () {
      if (mounted && widget.visible) unawaited(_controller.forward());
    });
  }

  @override
  void dispose() {
    _enterTimer?.cancel();
    _curve.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.visible,
      child: AnimatedBuilder(
        animation: _curve,
        builder: (context, child) {
          final hidden = 1 - _curve.value;
          return Opacity(
            opacity: _curve.value.clamp(0, 1),
            child: Transform.translate(
              offset: _enterOffset * hidden,
              child: Transform.scale(
                scale: 1 - (1 - _enterScale) * hidden,
                child: child,
              ),
            ),
          );
        },
        child: widget.child,
      ),
    );
  }
}
