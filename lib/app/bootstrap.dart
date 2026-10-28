import 'package:clients_app/core/config/env.dart';
import 'package:clients_app/core/error/retry_policy.dart';
import 'package:clients_app/core/utils/app_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// Sets up error reporting and runs the app inside a [ProviderScope].
void bootstrap(Widget Function() builder) {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    AppLogger.error('Flutter error', details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    AppLogger.error('Uncaught error', error, stackTrace);
    return true;
  };

  // Fonts ship in assets/google_fonts/, so never download them at runtime.
  GoogleFonts.config.allowRuntimeFetching = false;
  LicenseRegistry.addLicense(_fontLicenses);

  AppLogger.info('Starting app (${Env.environment.name})');
  runApp(ProviderScope(retry: retryPolicy, child: builder()));
}

Stream<LicenseEntry> _fontLicenses() async* {
  for (final (family, file) in [
    ('Manrope', 'OFL-Manrope.txt'),
    ('DM Sans', 'OFL-DMSans.txt'),
  ]) {
    final license = await rootBundle.loadString('assets/google_fonts/$file');
    yield LicenseEntryWithLineBreaks([family], license);
  }
}
