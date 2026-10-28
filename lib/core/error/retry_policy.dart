import 'package:clients_app/core/error/failure.dart';

/// Decides whether a failed provider is retried, for `ProviderScope.retry`.
///
/// Returns the delay before the next attempt, or null to stop. Typed
/// [Failure]s are deterministic (bad data, missing item), so retrying them
/// only repeats the error; programming [Error]s are never retried either.
/// Anything else gets a few attempts with exponential backoff.
Duration? retryPolicy(int retryCount, Object error) {
  const maxRetries = 3;
  const baseDelay = Duration(milliseconds: 200);

  if (error is Failure || error is Error || retryCount >= maxRetries) {
    return null;
  }
  return baseDelay * (1 << retryCount);
}
