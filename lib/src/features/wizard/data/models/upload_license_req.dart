import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_license_req.g.dart';

@JsonSerializable()
class UploadLicenseReq {
  UploadLicenseReq({
    required this.userId,
    required this.licensePdf,
  });

  factory UploadLicenseReq.fromJson(Map<String, dynamic> json) =>
      _$UploadLicenseReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'license_pdf')
  final String licensePdf;

  Map<String, dynamic> toJson() => _$UploadLicenseReqToJson(this);
}
