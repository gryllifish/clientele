// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_header_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Greeting and stats for the dashboard header.
///
/// Counts are zero while clients load, so the header renders immediately.

@ProviderFor(homeHeader)
final homeHeaderProvider = HomeHeaderProvider._();

/// Greeting and stats for the dashboard header.
///
/// Counts are zero while clients load, so the header renders immediately.

final class HomeHeaderProvider
    extends
        $FunctionalProvider<HomeHeaderState, HomeHeaderState, HomeHeaderState>
    with $Provider<HomeHeaderState> {
  /// Greeting and stats for the dashboard header.
  ///
  /// Counts are zero while clients load, so the header renders immediately.
  HomeHeaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeHeaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeHeaderHash();

  @$internal
  @override
  $ProviderElement<HomeHeaderState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeHeaderState create(Ref ref) {
    return homeHeader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeHeaderState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeHeaderState>(value),
    );
  }
}

String _$homeHeaderHash() => r'1ebef93f10aca94be82be7ae08ca069950188cdb';
