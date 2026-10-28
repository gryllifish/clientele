/// Typed error categories that repositories return instead of raw exceptions.
///
/// Implements [Exception] so a controller can throw it into an `AsyncValue`
/// and the UI can pattern match on it. Add a subclass per category the UI
/// needs to tell apart (e.g. `NetworkFailure` once a remote API exists).
sealed class Failure implements Exception {
  const Failure({this.cause});

  /// The underlying error, kept for logging only. Never shown to users.
  final Object? cause;
}

/// Local storage or bundled assets could not be read.
final class StorageFailure extends Failure {
  const StorageFailure({super.cause});
}

/// Data was read but did not match the expected format.
final class ParsingFailure extends Failure {
  const ParsingFailure({super.cause});
}

/// The requested item does not exist.
final class NotFoundFailure extends Failure {
  const NotFoundFailure({super.cause});
}

/// Anything the data layer did not anticipate.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure({super.cause});
}
