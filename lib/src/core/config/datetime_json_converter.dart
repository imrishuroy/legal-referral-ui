import 'package:json_annotation/json_annotation.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class DateTimeJsonConverter implements JsonConverter<DateTime, String> {
  const DateTimeJsonConverter();
  @override
  DateTime fromJson(String json) {
    return DateTimeUtil.getFormatedDateTime(json);
  }

  @override
  String toJson(DateTime object) {
    return DateTimeUtil.getFormatDate(object);
  }
}
