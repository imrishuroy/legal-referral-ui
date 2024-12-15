import 'package:json_annotation/json_annotation.dart';

part 'unfeature_post_req.g.dart';

@JsonSerializable()
class UnFeaturePostReq {
  UnFeaturePostReq({
    required this.postId,
    required this.userId,
  });

  factory UnFeaturePostReq.fromJson(Map<String, dynamic> json) =>
      _$UnFeaturePostReqFromJson(json);

  @JsonKey(name: 'post_id')
  final int postId;
  @JsonKey(name: 'user_id')
  final String userId;

  Map<String, dynamic> toJson() => _$UnFeaturePostReqToJson(this);
}
