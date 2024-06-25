import 'package:flutter/foundation.dart';

class AppLogger {
  static log(String message, {WarningLevel level = WarningLevel.info}) {
    final now = DateTime.now();
    if (kDebugMode) {
      print('$now [${level.name}]: $message');
    }
  }
}

enum WarningLevel {
  info,
  warning,
  error,
}
