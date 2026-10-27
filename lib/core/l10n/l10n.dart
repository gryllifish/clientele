import 'package:clients_app/core/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';

export 'package:clients_app/core/l10n/generated/app_localizations.dart';

extension BuildContextL10n on BuildContext {
  /// Shorthand for `AppLocalizations.of(context)`.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
