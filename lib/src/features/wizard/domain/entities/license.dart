import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
class License with _$License {
  const factory License({
    @JsonKey(name: 'user_id', includeToJson: false) required String userId,
    required String name,
    @JsonKey(name: 'license_number') required String licenseNumber,
    @LicenseDateTimeConverter()
    @JsonKey(name: 'issue_date')
    required DateTime issueDate,
    @JsonKey(name: 'issue_state') required String issueState,
    @JsonKey(name: 'license_id', includeToJson: false) int? id,
  }) = _License;

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);
}

class LicenseDateTimeConverter implements JsonConverter<DateTime, String> {
  const LicenseDateTimeConverter();
  @override
  DateTime fromJson(String json) {
    return DateTimeUtil.getFormatedDateTime(json);
  }

  @override
  String toJson(DateTime object) {
    return DateTimeUtil.getFormatDate(object);
  }
}
