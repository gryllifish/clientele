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

/// Text typed in the home search field.

@ProviderFor(ClientSearchController)
final clientSearchControllerProvider = ClientSearchControllerProvider._();

/// Text typed in the home search field.
final class ClientSearchControllerProvider
    extends $NotifierProvider<ClientSearchController, String> {
  /// Text typed in the home search field.
  ClientSearchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientSearchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientSearchControllerHash();

  @$internal
  @override
  ClientSearchController create() => ClientSearchController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$clientSearchControllerHash() =>
    r'fcf4d786d994bbc61712948c969b1d504c48d67c';

/// Text typed in the home search field.

abstract class _$ClientSearchController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Clients matching the search, in display order for the selected filter.
///
/// The search narrows the list first, so "Hot" ranks only the matches.
/// Derived synchronously (not via `.future`) so changing the filter never
/// flashes a loading state and the grid can animate between lists.

@ProviderFor(visibleClients)
final visibleClientsProvider = VisibleClientsProvider._();

/// Clients matching the search, in display order for the selected filter.
///
/// The search narrows the list first, so "Hot" ranks only the matches.
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
  /// Clients matching the search, in display order for the selected filter.
  ///
  /// The search narrows the list first, so "Hot" ranks only the matches.
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

String _$visibleClientsHash() => r'47f5f45d22b6fd2a44dc25640d207f1e3674291d';
