import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_user_image_req.g.dart';

@JsonSerializable()
class UploadUserImageReq {
  UploadUserImageReq({
    required this.userId,
    required this.imageUrl,
  });

  factory UploadUserImageReq.fromJson(Map<String, dynamic> json) =>
      _$UploadUserImageReqFromJson(json);

  @JsonKey(name: 'user_id', includeToJson: false)
  final String userId;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  Map<String, dynamic> toJson() => _$UploadUserImageReqToJson(this);
}
