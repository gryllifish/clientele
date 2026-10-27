import 'package:clients_app/core/error/failure.dart';

/// Exceptions thrown by data sources.
///
/// They never leave the data layer: repositories convert them into a
/// [Failure] through `guard`.
sealed class AppException implements Exception {
  const AppException(this.message, {this.cause});

  final String message;
  final Object? cause;

  Failure toFailure() => switch (this) {
    StorageException() => StorageFailure(cause: this),
    ParsingException() => ParsingFailure(cause: this),
  };

  @override
  String toString() => 'AppException: $message (cause: $cause)';
}

final class StorageException extends AppException {
  const StorageException(super.message, {super.cause});
}

final class ParsingException extends AppException {
  const ParsingException(super.message, {super.cause});
}
