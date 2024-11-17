import 'package:json_annotation/json_annotation.dart';

part 'like_post_req.g.dart';

@JsonSerializable()
class LikePostReq {
  LikePostReq({
    required this.userId,
    required this.senderId,
    required this.postId,
  });

  factory LikePostReq.fromJson(Map<String, dynamic> json) =>
      _$LikePostReqFromJson(json);

  // TODO: change it to postOwnerId
  @JsonKey(name: 'user_id')
  final String userId;
  // TODO: change it to currentUserId
  @JsonKey(name: 'sender_id')
  final String senderId;
  @JsonKey(name: 'post_id')
  final int postId;

  Map<String, dynamic> toJson() => _$LikePostReqToJson(this);
}
