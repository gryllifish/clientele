// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Name of the signed-in user.
///
/// Demo-only stub: replace with the auth feature's user once it exists.

@ProviderFor(currentUserName)
final currentUserNameProvider = CurrentUserNameProvider._();

/// Name of the signed-in user.
///
/// Demo-only stub: replace with the auth feature's user once it exists.

final class CurrentUserNameProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// Name of the signed-in user.
  ///
  /// Demo-only stub: replace with the auth feature's user once it exists.
  CurrentUserNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return currentUserName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currentUserNameHash() => r'10d943f75bff291d62d7fc755b3117ecf2abdad1';
