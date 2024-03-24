import 'package:intl/intl.dart';

class DateTimeUtil {
  factory DateTimeUtil() => DateTimeUtil._internal();
  DateTimeUtil._internal();

  static DateTime getFormatedDateTime(String dateTimeString) {
    final inputDateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss.zzzz');
    return inputDateFormat.parse(dateTimeString, true);
  }
}
