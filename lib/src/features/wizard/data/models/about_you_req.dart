import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_you_req.g.dart';

@JsonSerializable()
class AboutYouReq {
  AboutYouReq({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.practiceArea,
    required this.practiceLocation,
    required this.experience,
  });

  factory AboutYouReq.fromJson(Map<String, dynamic> json) =>
      _$AboutYouReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String address;
  @JsonKey(name: 'practice_area')
  final String practiceArea;
  @JsonKey(name: 'practice_location')
  final String practiceLocation;
  final int experience;

  Map<String, dynamic> toJson() => _$AboutYouReqToJson(this);
}
