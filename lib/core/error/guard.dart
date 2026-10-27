import 'package:clients_app/core/error/app_exception.dart';
import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/error/result.dart';
import 'package:clients_app/core/utils/app_logger.dart';

/// Runs [body] and converts expected exceptions into an [Err].
///
/// Every repository method should go through `guard` so raw exceptions
/// never reach controllers. [Error]s (programming bugs) are not caught on
/// purpose: they should crash loudly in development.
Future<Result<T>> guard<T>(Future<T> Function() body) async {
  try {
    return Ok(await body());
  } on AppException catch (exception, stackTrace) {
    AppLogger.warning(exception.message, exception, stackTrace);
    return Err(exception.toFailure());
  } on Exception catch (exception, stackTrace) {
    AppLogger.error('Unexpected exception', exception, stackTrace);
    return Err(UnexpectedFailure(cause: exception));
  }
}
