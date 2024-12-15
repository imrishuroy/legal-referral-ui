import 'package:json_annotation/json_annotation.dart';

part 'like_post_req.g.dart';

@JsonSerializable()
class LikePostReq {
  LikePostReq({
    required this.postOwnerId,
    required this.currentUserId,
    required this.postId,
  });

  factory LikePostReq.fromJson(Map<String, dynamic> json) =>
      _$LikePostReqFromJson(json);

  @JsonKey(name: 'post_user_id')
  final String postOwnerId;
  @JsonKey(name: 'current_user_id')
  final String currentUserId;
  @JsonKey(name: 'post_id')
  final int postId;

  Map<String, dynamic> toJson() => _$LikePostReqToJson(this);
}
