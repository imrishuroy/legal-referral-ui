import 'package:json_annotation/json_annotation.dart';

part 'feature_post_req.g.dart';

@JsonSerializable()
class FeaturePostReq {
  FeaturePostReq({
    required this.userId,
    required this.postId,
  });

  factory FeaturePostReq.fromJson(Map<String, dynamic> json) =>
      _$FeaturePostReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'post_id')
  final int postId;

  Map<String, dynamic> toJson() => _$FeaturePostReqToJson(this);
}
