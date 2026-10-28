// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the profile details of one client.

@ProviderFor(ClientProfileController)
final clientProfileControllerProvider = ClientProfileControllerFamily._();

/// Loads the profile details of one client.
final class ClientProfileControllerProvider
    extends $AsyncNotifierProvider<ClientProfileController, ClientProfile> {
  /// Loads the profile details of one client.
  ClientProfileControllerProvider._({
    required ClientProfileControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'clientProfileControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$clientProfileControllerHash();

  @override
  String toString() {
    return r'clientProfileControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ClientProfileController create() => ClientProfileController();

  @override
  bool operator ==(Object other) {
    return other is ClientProfileControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$clientProfileControllerHash() =>
    r'fc00fc0248db2d9322112c9e72f7a897ebd39e1a';

/// Loads the profile details of one client.

final class ClientProfileControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          ClientProfileController,
          AsyncValue<ClientProfile>,
          ClientProfile,
          FutureOr<ClientProfile>,
          int
        > {
  ClientProfileControllerFamily._()
    : super(
        retry: null,
        name: r'clientProfileControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads the profile details of one client.

  ClientProfileControllerProvider call(int clientId) =>
      ClientProfileControllerProvider._(argument: clientId, from: this);

  @override
  String toString() => r'clientProfileControllerProvider';
}

/// Loads the profile details of one client.

abstract class _$ClientProfileController extends $AsyncNotifier<ClientProfile> {
  late final _$args = ref.$arg as int;
  int get clientId => _$args;

  FutureOr<ClientProfile> build(int clientId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ClientProfile>, ClientProfile>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ClientProfile>, ClientProfile>,
              AsyncValue<ClientProfile>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

/// A client from the already-loaded list.
///
/// Lets the profile header (and its Hero photo) render on the first frame
/// instead of waiting for the profile request.

@ProviderFor(clientById)
final clientByIdProvider = ClientByIdFamily._();

/// A client from the already-loaded list.
///
/// Lets the profile header (and its Hero photo) render on the first frame
/// instead of waiting for the profile request.

final class ClientByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Client>,
          AsyncValue<Client>,
          AsyncValue<Client>
        >
    with $Provider<AsyncValue<Client>> {
  /// A client from the already-loaded list.
  ///
  /// Lets the profile header (and its Hero photo) render on the first frame
  /// instead of waiting for the profile request.
  ClientByIdProvider._({
    required ClientByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'clientByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$clientByIdHash();

  @override
  String toString() {
    return r'clientByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<Client>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<Client> create(Ref ref) {
    final argument = this.argument as int;
    return clientById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Client> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Client>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ClientByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$clientByIdHash() => r'73b61ec611d3f07d4a765dfed59ab44c48acda98';

/// A client from the already-loaded list.
///
/// Lets the profile header (and its Hero photo) render on the first frame
/// instead of waiting for the profile request.

final class ClientByIdFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<Client>, int> {
  ClientByIdFamily._()
    : super(
        retry: null,
        name: r'clientByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A client from the already-loaded list.
  ///
  /// Lets the profile header (and its Hero photo) render on the first frame
  /// instead of waiting for the profile request.

  ClientByIdProvider call(int clientId) =>
      ClientByIdProvider._(argument: clientId, from: this);

  @override
  String toString() => r'clientByIdProvider';
}
