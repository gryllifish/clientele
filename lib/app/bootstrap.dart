import 'dart:ui';

import 'package:clients_app/core/config/env.dart';
import 'package:clients_app/core/utils/app_logger.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  AppLogger.info('Starting app (${Env.environment.name})');
  runApp(ProviderScope(child: builder()));
}
