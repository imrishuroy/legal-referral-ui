import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_you_req.g.dart';

@JsonSerializable()
class AboutYouReq {
  AboutYouReq({
    required this.userId,
    required this.address,
    required this.practiceArea,
    required this.practiceLocation,
    required this.experience,
  });

  factory AboutYouReq.fromJson(Map<String, dynamic> json) =>
      _$AboutYouReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  final String address;
  @JsonKey(name: 'practice_area')
  final String practiceArea;
  @JsonKey(name: 'practice_location')
  final String practiceLocation;
  final int experience;

  Map<String, dynamic> toJson() => _$AboutYouReqToJson(this);
}
