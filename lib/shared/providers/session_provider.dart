import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

/// Name of the signed-in user.
///
/// Demo-only stub: replace with the auth feature's user once it exists.
@riverpod
String currentUserName(Ref ref) => 'Alex';
