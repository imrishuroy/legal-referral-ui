import 'package:json_annotation/json_annotation.dart';

part 'save_feature_post_req.g.dart';

@JsonSerializable()
class SaveFeaturePostReq {
  SaveFeaturePostReq({
    required this.userId,
    required this.postId,
  });

  factory SaveFeaturePostReq.fromJson(Map<String, dynamic> json) =>
      _$SaveFeaturePostReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'post_id')
  final int postId;

  Map<String, dynamic> toJson() => _$SaveFeaturePostReqToJson(this);
}
