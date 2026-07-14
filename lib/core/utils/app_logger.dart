import 'dart:developer' as developer;

/// Logger central do app.
///
/// Usar sempre no lugar de `print()`. Facilita trocar a implementação
/// (ex.: integrar com Sentry/Crashlytics) sem tocar em outras camadas.
class AppLogger {
  AppLogger._();

  static void info(String message, {String tag = 'INFO'}) {
    developer.log(message, name: tag);
  }

  static void warning(String message, {String tag = 'WARNING'}) {
    developer.log(message, name: tag);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace, String tag = 'ERROR'}) {
    developer.log(message, name: tag, error: error, stackTrace: stackTrace);
  }
}
