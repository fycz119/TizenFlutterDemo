import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger();

  static void log(dynamic message, [Level level = Level.info]) {
      // 开发环境记录所有日志
      _logger.log(level, message);
  }
}
