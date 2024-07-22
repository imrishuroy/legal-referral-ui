import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeUtil {
  factory DateTimeUtil() => DateTimeUtil._internal();
  DateTimeUtil._internal();

  static DateTime convertUtcToLocal(DateTime dateTime) {
    return dateTime.toLocal();
  }

  static String getFormattedTime(DateTime dateTime) {
    final date = convertUtcToLocal(dateTime);
    final outputDateFormat = DateFormat('hh:mm a');
    return outputDateFormat.format(date);
  }

  static String getFormatTimeHHMM(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final date = convertUtcToLocal(dateTime);
    final outputDateFormat = DateFormat('HH:mm');
    return outputDateFormat.format(date);
  }

  static DateTime getFormatedDateTime(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }

  // static String getJsonFormattedDate(DateTime dateTime) {
  //   final outputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  //   return outputDateFormat.format(dateTime);
  // }

  static String getJsonFormattedDate(DateTime dateTime) {
    final utcDateTime = dateTime.toUtc();
    final outputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    return outputDateFormat.format(utcDateTime);
  }

  static String getFormattedDate(DateTime dateTime) {
    final outputDateFormat = DateFormat(
      'dd/MM/yyyy',
    );
    return outputDateFormat.format(dateTime);
  }

  static String getFormatDate(DateTime dateTime) {
    final outputDateFormat = DateFormat(
      'yyyy-MM-dd',
    );
    return outputDateFormat.format(dateTime);
  }

  static String formatDateRange(DateTime start, DateTime? end) {
    final formattedStart = DateFormat('MMMM yyyy').format(start);
    String formattedEnd;

    if (end != null) {
      formattedEnd = DateFormat('MMMM yyyy').format(end);
    } else {
      formattedEnd = 'Current';
    }

    return '$formattedStart - $formattedEnd';
  }

  static String timeAgo(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return timeago.format(dateTime, locale: '');
  }

  static String formatReferralDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final date = convertUtcToLocal(dateTime);
    final outputDateFormat = DateFormat('d MMM y');
    return outputDateFormat.format(date);
  }

  static String formatProjectTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final date = convertUtcToLocal(dateTime);
    final outputDateFormat = DateFormat('dd MMM yyyy');
    return outputDateFormat.format(date);
  }
}
