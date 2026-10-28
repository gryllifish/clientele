import 'package:clients_app/features/clients/domain/entities/client.dart';
import 'package:flutter/material.dart';

/// A client's photo that flies between screens with a [Hero].
///
/// The card and the profile use different corner radii, so the flight
/// interpolates the radius instead of snapping at the end.
class ClientPhoto extends StatelessWidget {
  const ClientPhoto({
    required this.client,
    required this.borderRadius,
    super.key,
  });

  final Client client;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'client-photo-${client.id}',
      flightShuttleBuilder: _flightShuttle,
      child: _RoundedPhoto(
        asset: client.photoAsset,
        borderRadius: borderRadius,
      ),
    );
  }

  static Widget _flightShuttle(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection direction,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    final from = _photoOf(fromHeroContext);
    final to = _photoOf(toHeroContext);
    // On pop the animation runs backwards (1 -> 0), so the ends swap.
    final (begin, end) = direction == HeroFlightDirection.push
        ? (from, to)
        : (to, from);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => _RoundedPhoto(
        asset: end.asset,
        borderRadius:
            BorderRadius.lerp(
              begin.borderRadius,
              end.borderRadius,
              Curves.fastOutSlowIn.transform(animation.value),
            ) ??
            end.borderRadius,
      ),
    );
  }

  static _RoundedPhoto _photoOf(BuildContext heroContext) =>
      switch (heroContext.widget) {
        Hero(child: final _RoundedPhoto photo) => photo,
        _ => throw StateError('ClientPhoto hero without a photo child'),
      };
}

class _RoundedPhoto extends StatelessWidget {
  const _RoundedPhoto({required this.asset, required this.borderRadius});

  final String asset;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
