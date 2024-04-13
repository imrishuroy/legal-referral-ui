import 'package:logger/logger.dart';

class AppLogger {
  factory AppLogger() => AppLogger._internal();
  AppLogger._internal();
  static Logger? _logger;

  static void init() {
    _logger ??= Logger();
  }

  static void info(dynamic message) {
    _logger?.i('\n\n$message');
  }

  static void debug(dynamic message) {
    _logger?.d(message);
  }

  static void error(dynamic message) {
    _logger?.e(message);
  }
}
