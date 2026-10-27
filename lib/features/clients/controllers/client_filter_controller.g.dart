// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_filter_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Currently selected [ClientFilter].

@ProviderFor(ClientFilterController)
final clientFilterControllerProvider = ClientFilterControllerProvider._();

/// Currently selected [ClientFilter].
final class ClientFilterControllerProvider
    extends $NotifierProvider<ClientFilterController, ClientFilter> {
  /// Currently selected [ClientFilter].
  ClientFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientFilterControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientFilterControllerHash();

  @$internal
  @override
  ClientFilterController create() => ClientFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClientFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClientFilter>(value),
    );
  }
}

String _$clientFilterControllerHash() =>
    r'67a60b926587fa81ed2e84af7b0c895cbb51d34d';

/// Currently selected [ClientFilter].

abstract class _$ClientFilterController extends $Notifier<ClientFilter> {
  ClientFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ClientFilter, ClientFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClientFilter, ClientFilter>,
              ClientFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Clients in display order for the selected filter.
///
/// Derived synchronously (not via `.future`) so changing the filter never
/// flashes a loading state and the grid can animate between lists.

@ProviderFor(visibleClients)
final visibleClientsProvider = VisibleClientsProvider._();

/// Clients in display order for the selected filter.
///
/// Derived synchronously (not via `.future`) so changing the filter never
/// flashes a loading state and the grid can animate between lists.

final class VisibleClientsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Client>>,
          AsyncValue<List<Client>>,
          AsyncValue<List<Client>>
        >
    with $Provider<AsyncValue<List<Client>>> {
  /// Clients in display order for the selected filter.
  ///
  /// Derived synchronously (not via `.future`) so changing the filter never
  /// flashes a loading state and the grid can animate between lists.
  VisibleClientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visibleClientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visibleClientsHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<Client>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<Client>> create(Ref ref) {
    return visibleClients(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Client>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Client>>>(value),
    );
  }
}

String _$visibleClientsHash() => r'12c91c822d0656f1a68349f172024bf94540c9bc';
