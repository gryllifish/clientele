// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(clientsLocalDataSource)
final clientsLocalDataSourceProvider = ClientsLocalDataSourceProvider._();

final class ClientsLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ClientsLocalDataSource,
          ClientsLocalDataSource,
          ClientsLocalDataSource
        >
    with $Provider<ClientsLocalDataSource> {
  ClientsLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientsLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientsLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ClientsLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClientsLocalDataSource create(Ref ref) {
    return clientsLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClientsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClientsLocalDataSource>(value),
    );
  }
}

String _$clientsLocalDataSourceHash() =>
    r'201fb9bc8fa9d16593fa7bf3f6f3a28902f37669';
