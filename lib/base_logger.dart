import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:logging/logging.dart';


abstract class BaseLogger {
  @protected
  late Logger _logger;
  @protected
  DateFormat _dateTimeFormat = DateFormat('H:m:m.S');
  static const String appName = 'singleton example';

  void log(String message, [Object? error , StackTrace? stackTrace]) =>
      _logger.info(message,error,stackTrace);

}

///Singleton wrapper by extenstion
class DebugLogger extends BaseLogger {
  static DebugLogger? _instance;

  ///private constructor
  DebugLogger._internal() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(_recordHandler);
    _logger = Logger(BaseLogger.appName);
    debugPrint('<DebugLogger> creation');
    _instance = this;
  }

  ///public factory constructor
  ///lazy instantation
  factory DebugLogger() => _instance ?? DebugLogger._internal();

  ///record handler for the logging message content
  ///it is added in the private constructor
  void _recordHandler (LogRecord rec) {
    debugPrint (
        '${_dateTimeFormat.format(rec.time)} : ${rec.message} , ${rec.error}'
    );
  }
}