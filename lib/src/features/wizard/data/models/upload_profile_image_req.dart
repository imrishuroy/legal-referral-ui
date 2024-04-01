import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_profile_image_req.g.dart';

@JsonSerializable()
class UploadProfileImageReq {
  UploadProfileImageReq({
    required this.userId,
    required this.imageUrl,
  });

  factory UploadProfileImageReq.fromJson(Map<String, dynamic> json) =>
      _$UploadProfileImageReqFromJson(json);

  @JsonKey(name: 'user_id', includeToJson: false)
  final String userId;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  Map<String, dynamic> toJson() => _$UploadProfileImageReqToJson(this);
}
