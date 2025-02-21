import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() => _instance;

  late final Logger _logger;

  AppLogger._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 3,
        errorMethodCount: 10,
        lineLength: 300,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
    );
  }

  /// Logs a verbose message with enhanced context information
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logWithContext(Level.trace, message, error, stackTrace);
  }

  /// Logs a debug message with enhanced context information
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logWithContext(Level.debug, message, error, stackTrace);
  }

  /// Logs an info message with enhanced context information
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logWithContext(Level.info, message, error, stackTrace);
  }

  /// Logs a warning message with enhanced context information
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logWithContext(Level.warning, message, error, stackTrace);
  }

  /// Logs an error message with enhanced context information
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logWithContext(Level.error, message, error, stackTrace);
  }

  void _logWithContext(
    Level level,
    dynamic message,
    dynamic error,
    StackTrace? stackTrace,
  ) {
    // Get stack trace if not provided to find caller information
    final trace = stackTrace ?? StackTrace.current;

    // Extract caller information
    final callerInfo = _extractCallerInfo(trace);
    final contextMessage =
        callerInfo != null ? '$callerInfo | $message' : message;

    switch (level) {
      case Level.trace:
        _logger.t(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.debug:
        _logger.d(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.info:
        _logger.i(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.warning:
        _logger.w(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.error:
        _logger.e(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.wtf:
        _logger.f(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.verbose:
        _logger.t(contextMessage, error: error, stackTrace: trace);
        break;
      case Level.all:
      case Level.fatal:
      case Level.nothing:
      case Level.off:
        break;
    }
  }

  String? _extractCallerInfo(StackTrace stackTrace) {
    final frames = stackTrace.toString().split('\n');
    if (frames.length > 2) {
      // Skip the first frames as they are from the logger itself
      final callerFrame = frames[2];

      // Extract file path, line number and method name
      final regex = RegExp(r'(.*) \((.+):([0-9]+)(?::[0-9]+)?\)');
      final match = regex.firstMatch(callerFrame);

      if (match != null && match.groupCount >= 3) {
        final method = match.group(1)?.trim();
        final file = match.group(2)?.split('/').last;
        final line = match.group(3);

        return '[$file:$line | $method]';
      }
    }
    return null;
  }
}
