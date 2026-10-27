// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the client list. Failures surface as `AsyncError<Failure>`.

@ProviderFor(ClientsController)
final clientsControllerProvider = ClientsControllerProvider._();

/// Loads the client list. Failures surface as `AsyncError<Failure>`.
final class ClientsControllerProvider
    extends $AsyncNotifierProvider<ClientsController, List<Client>> {
  /// Loads the client list. Failures surface as `AsyncError<Failure>`.
  ClientsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientsControllerHash();

  @$internal
  @override
  ClientsController create() => ClientsController();
}

String _$clientsControllerHash() => r'2f0e8ab5b0d28fac41d6b5822ac4c022f371fbb5';

/// Loads the client list. Failures surface as `AsyncError<Failure>`.

abstract class _$ClientsController extends $AsyncNotifier<List<Client>> {
  FutureOr<List<Client>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Client>>, List<Client>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Client>>, List<Client>>,
              AsyncValue<List<Client>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
