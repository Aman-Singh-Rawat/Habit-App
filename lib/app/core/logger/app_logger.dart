import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum LogType { local, server, error, warning, info }

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  static void log(
      String message, {
        LogType type = LogType.info,
        dynamic error,
        StackTrace? stackTrace,
      }) {
    if (!kDebugMode) return;

    final formattedMessage = _format(message, type);

    switch (type) {
      case LogType.local:
        _logger.d(formattedMessage);
        break;
      case LogType.server:
        _logger.i(formattedMessage);
        break;
      case LogType.warning:
        _logger.w(formattedMessage);
        break;
      case LogType.error:
        _logger.e(formattedMessage, error: error, stackTrace: stackTrace);
        break;
      case LogType.info:
        _logger.i(formattedMessage);
        break;
    }
  }

  static String _format(String message, LogType type) {
    switch (type) {
      case LogType.local:
        return '🟢 [LOCAL] $message';
      case LogType.server:
        return '🔵 [SERVER] $message';
      case LogType.warning:
        return '🟡 [WARNING] $message';
      case LogType.error:
        return '🔴 [ERROR] $message';
      case LogType.info:
        return '⚪ [INFO] $message';
    }
  }

  // 👇 CLEAN METHODS (no need to pass type manually)
  static void local(String message) => log(message, type: LogType.local);

  static void server(String message) => log(message, type: LogType.server);

  static void warning(String message) => log(message, type: LogType.warning);

  static void info(String message) => log(message, type: LogType.info);

  static void error(
      String message, {
        dynamic error,
        StackTrace? stackTrace,
      }) =>
      log(
        message,
        type: LogType.error,
        error: error,
        stackTrace: stackTrace,
      );
}