// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads every transaction. Failures surface as `AsyncError<Failure>`.

@ProviderFor(TransactionsController)
final transactionsControllerProvider = TransactionsControllerProvider._();

/// Loads every transaction. Failures surface as `AsyncError<Failure>`.
final class TransactionsControllerProvider
    extends $AsyncNotifierProvider<TransactionsController, List<Transaction>> {
  /// Loads every transaction. Failures surface as `AsyncError<Failure>`.
  TransactionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsControllerHash();

  @$internal
  @override
  TransactionsController create() => TransactionsController();
}

String _$transactionsControllerHash() =>
    r'c61992b9103ede2d3a2fdb964c674f4641d6040d';

/// Loads every transaction. Failures surface as `AsyncError<Failure>`.

abstract class _$TransactionsController
    extends $AsyncNotifier<List<Transaction>> {
  FutureOr<List<Transaction>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Transaction>>, List<Transaction>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transaction>>, List<Transaction>>,
              AsyncValue<List<Transaction>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// The rolling statement shown on the transactions screen.

@ProviderFor(transactionStatement)
final transactionStatementProvider = TransactionStatementProvider._();

/// The rolling statement shown on the transactions screen.

final class TransactionStatementProvider
    extends
        $FunctionalProvider<
          AsyncValue<TransactionStatement>,
          AsyncValue<TransactionStatement>,
          AsyncValue<TransactionStatement>
        >
    with $Provider<AsyncValue<TransactionStatement>> {
  /// The rolling statement shown on the transactions screen.
  TransactionStatementProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionStatementProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionStatementHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<TransactionStatement>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<TransactionStatement> create(Ref ref) {
    return transactionStatement(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<TransactionStatement> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<TransactionStatement>>(
        value,
      ),
    );
  }
}

String _$transactionStatementHash() =>
    r'036271968c3a86e019b5d28d5418f1825e630035';
