import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock_provider.g.dart';

/// Current time. Override in tests for deterministic dates.
@riverpod
DateTime now(Ref ref) => DateTime.now();
