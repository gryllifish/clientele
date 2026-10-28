// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Exposes the interface, so tests and features depend on the abstraction.

@ProviderFor(transactionsRepository)
final transactionsRepositoryProvider = TransactionsRepositoryProvider._();

/// Exposes the interface, so tests and features depend on the abstraction.

final class TransactionsRepositoryProvider
    extends
        $FunctionalProvider<
          TransactionsRepository,
          TransactionsRepository,
          TransactionsRepository
        >
    with $Provider<TransactionsRepository> {
  /// Exposes the interface, so tests and features depend on the abstraction.
  TransactionsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsRepositoryHash();

  @$internal
  @override
  $ProviderElement<TransactionsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionsRepository create(Ref ref) {
    return transactionsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionsRepository>(value),
    );
  }
}

String _$transactionsRepositoryHash() =>
    r'cc60669203657d00e3d50b9cb933186acdb59351';
