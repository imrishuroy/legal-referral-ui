import 'package:json_annotation/json_annotation.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

part 'add_update_experience_req.g.dart';

@JsonSerializable()
class AddUpdateExperienceReq {
  AddUpdateExperienceReq({
    required this.title,
    required this.practiceArea,
    required this.firmId,
    required this.practiceLocation,
    required this.startDate,
    required this.endDate,
    required this.current,
    required this.description,
    required this.skills,
  });

  final String title;
  @JsonKey(name: 'practice_area')
  final String practiceArea;
  @JsonKey(name: 'firm_id')
  final int firmId;
  @JsonKey(name: 'practice_location')
  final String practiceLocation;
  @AddExperienceReqDateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @AddExperienceReqDateTimeConverter()
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  final bool current;
  final String description;
  final List<String?> skills;

  Map<String, dynamic> toJson() => _$AddUpdateExperienceReqToJson(this);
}

class AddExperienceReqDateTimeConverter
    implements JsonConverter<DateTime, String> {
  const AddExperienceReqDateTimeConverter();
  @override
  DateTime fromJson(String json) {
    return DateTimeUtil.getFormatedDateTime(json);
  }

  @override
  String toJson(DateTime object) {
    return DateTimeUtil.getFormatDate(object);
  }
}
