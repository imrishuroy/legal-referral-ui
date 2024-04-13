import 'package:intl/intl.dart';

class DateTimeUtil {
  factory DateTimeUtil() => DateTimeUtil._internal();
  DateTimeUtil._internal();

  static DateTime getFormatedDateTime(String dateTimeString) {
    // final inputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    // return inputDateFormat.parse(dateTimeString, true);
    return DateTime.parse(dateTimeString);
  }

// 2024-04-11T00:00:00
// 2006-01-02T15:04:05Z07:00
  static String getJsonFormattedDate(DateTime dateTime) {
    final outputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    return outputDateFormat.format(dateTime);
  }

  static String getFormattedDate(DateTime dateTime) {
    final outputDateFormat = DateFormat(
      'MM/dd/yyyy',
    );
    return outputDateFormat.format(dateTime);
  }

  static String getFormatDate(DateTime dateTime) {
    final outputDateFormat = DateFormat(
      'yyyy-MM-dd',
    );
    return outputDateFormat.format(dateTime);
  }
}
