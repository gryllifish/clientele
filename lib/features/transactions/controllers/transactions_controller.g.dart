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

/// The rolling statement shown on the payments screen, for every client
/// or only the one with [clientId].

@ProviderFor(transactionStatement)
final transactionStatementProvider = TransactionStatementFamily._();

/// The rolling statement shown on the payments screen, for every client
/// or only the one with [clientId].

final class TransactionStatementProvider
    extends
        $FunctionalProvider<
          AsyncValue<TransactionStatement>,
          AsyncValue<TransactionStatement>,
          AsyncValue<TransactionStatement>
        >
    with $Provider<AsyncValue<TransactionStatement>> {
  /// The rolling statement shown on the payments screen, for every client
  /// or only the one with [clientId].
  TransactionStatementProvider._({
    required TransactionStatementFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'transactionStatementProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionStatementHash();

  @override
  String toString() {
    return r'transactionStatementProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<TransactionStatement>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<TransactionStatement> create(Ref ref) {
    final argument = this.argument as int?;
    return transactionStatement(ref, argument);
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

  @override
  bool operator ==(Object other) {
    return other is TransactionStatementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionStatementHash() =>
    r'5727f3df692ec271887f5c3c57381f1f947437c1';

/// The rolling statement shown on the payments screen, for every client
/// or only the one with [clientId].

final class TransactionStatementFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<TransactionStatement>, int?> {
  TransactionStatementFamily._()
    : super(
        retry: null,
        name: r'transactionStatementProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The rolling statement shown on the payments screen, for every client
  /// or only the one with [clientId].

  TransactionStatementProvider call(int? clientId) =>
      TransactionStatementProvider._(argument: clientId, from: this);

  @override
  String toString() => r'transactionStatementProvider';
}

/// Name of the client with [clientId] as it appears on their payments, or
/// null when they have none.

@ProviderFor(payerName)
final payerNameProvider = PayerNameFamily._();

/// Name of the client with [clientId] as it appears on their payments, or
/// null when they have none.

final class PayerNameProvider
    extends
        $FunctionalProvider<
          AsyncValue<String?>,
          AsyncValue<String?>,
          AsyncValue<String?>
        >
    with $Provider<AsyncValue<String?>> {
  /// Name of the client with [clientId] as it appears on their payments, or
  /// null when they have none.
  PayerNameProvider._({
    required PayerNameFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'payerNameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$payerNameHash();

  @override
  String toString() {
    return r'payerNameProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<String?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<String?> create(Ref ref) {
    final argument = this.argument as int;
    return payerName(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PayerNameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$payerNameHash() => r'a3cb07e9479e9a6f47537b3cb7fd6526051115c2';

/// Name of the client with [clientId] as it appears on their payments, or
/// null when they have none.

final class PayerNameFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<String?>, int> {
  PayerNameFamily._()
    : super(
        retry: null,
        name: r'payerNameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Name of the client with [clientId] as it appears on their payments, or
  /// null when they have none.

  PayerNameProvider call(int clientId) =>
      PayerNameProvider._(argument: clientId, from: this);

  @override
  String toString() => r'payerNameProvider';
}
