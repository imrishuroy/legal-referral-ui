import 'package:json_annotation/json_annotation.dart';

part 'upload_user_info_req.g.dart';

@JsonSerializable()
class UploadUserInfoReq {
  UploadUserInfoReq({
    required this.firstName,
    required this.lastName,
    required this.averageBillingPerClient,
    required this.caseResolutionRate,
    required this.about,
  });

  factory UploadUserInfoReq.fromJson(Map<String, dynamic> json) =>
      _$UploadUserInfoReqFromJson(json);

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey(name: 'average_billing_per_client')
  final int averageBillingPerClient;

  @JsonKey(name: 'case_resolution_rate')
  final int caseResolutionRate;

  @JsonKey(name: 'about')
  final String about;

  Map<String, dynamic> toJson() => _$UploadUserInfoReqToJson(this);
}
