import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    required String title,
    @JsonKey(name: 'practice_area') required String? practiceArea,
    @JsonKey(name: 'firm') required Firm? firm,
    @JsonKey(name: 'practice_location') required String? practiceLocation,
    @ExperienceDateTimeConverter()
    @JsonKey(name: 'start_date')
    required DateTime? startDate,
    @ExperienceDateTimeConverter()
    @JsonKey(name: 'end_date')
    required DateTime? endDate,
    required bool current,
    required List<String> skills,
    required String? description,
    @JsonKey(name: 'experience_id', includeToJson: false) int? experienceId,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

class ExperienceDateTimeConverter implements JsonConverter<DateTime, String> {
  const ExperienceDateTimeConverter();
  @override
  DateTime fromJson(String json) {
    return DateTimeUtil.getFormatedDateTime(json);
  }

  @override
  String toJson(DateTime object) {
    return DateTimeUtil.getFormatDate(object);
  }
}
