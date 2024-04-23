import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  const factory Education({
    required String? degree,
    required String? school,
    @JsonKey(name: 'field_of_study') required String? fieldOfStudy,
    @EducationDateTimeConverter()
    @JsonKey(name: 'start_date')
    required DateTime? startDate,
    @EducationDateTimeConverter()
    @JsonKey(name: 'end_date')
    required DateTime? endDate,
    @JsonKey(name: 'current') required bool current,
    required String? grade,
    required String? achievements,
    required List<String> skills,
    @JsonKey(name: 'education_id', includeToJson: false) int? educationId,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}

class EducationDateTimeConverter implements JsonConverter<DateTime, String> {
  const EducationDateTimeConverter();
  @override
  DateTime fromJson(String json) {
    return DateTimeUtil.getFormatedDateTime(json);
  }

  @override
  String toJson(DateTime object) {
    return DateTimeUtil.getFormatDate(object);
  }
}
