import 'package:logger/logger.dart';

class AppLogger {
  factory AppLogger() => AppLogger._internal();
  AppLogger._internal();
  static Logger? _logger;

  static void init() {
    _logger ??= Logger(
        // printer: PrettyPrinter(
        //   methodCount: 0,
        //   errorMethodCount: 5,
        //   lineLength: 50,
        //   printTime: true,
        //   levelColors: {
        //     Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
        //     Level.debug: AnsiColor.fg(AnsiColor.blue(0.5)),
        //     Level.info: AnsiColor.fg(AnsiColor.green(0.5)),
        //     Level.warning: AnsiColor.fg(AnsiColor.yellow(0.5)),
        //     Level.error: AnsiColor.fg(AnsiColor.red(0.5)),
        //     Level.wtf: AnsiColor.fg(AnsiColor.magenta(0.5)),
        //   },
        // ),
        );
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
