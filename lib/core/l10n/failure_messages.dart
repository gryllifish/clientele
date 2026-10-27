import 'package:clients_app/core/error/failure.dart';
import 'package:clients_app/core/l10n/l10n.dart';

extension FailureMessage on Failure {
  /// User-friendly, localized description of this failure.
  String message(AppLocalizations l10n) => switch (this) {
    StorageFailure() || ParsingFailure() => l10n.errorLoadData,
    UnexpectedFailure() => l10n.errorUnexpected,
  };
}
