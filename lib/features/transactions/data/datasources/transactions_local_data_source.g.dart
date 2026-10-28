// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_local_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transactionsLocalDataSource)
final transactionsLocalDataSourceProvider =
    TransactionsLocalDataSourceProvider._();

final class TransactionsLocalDataSourceProvider
    extends
        $FunctionalProvider<
          TransactionsLocalDataSource,
          TransactionsLocalDataSource,
          TransactionsLocalDataSource
        >
    with $Provider<TransactionsLocalDataSource> {
  TransactionsLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<TransactionsLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionsLocalDataSource create(Ref ref) {
    return transactionsLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionsLocalDataSource>(value),
    );
  }
}

String _$transactionsLocalDataSourceHash() =>
    r'140a0cc117f774ca63891c7d2cdf44dfcffd7a06';
