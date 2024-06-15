import 'package:json_annotation/json_annotation.dart';

part 'comment_req.g.dart';

@JsonSerializable()
class CommentReq {
  CommentReq({
    required this.userId,
    required this.postId,
    required this.content,
    this.parentCommentId,
  });

  factory CommentReq.fromJson(Map<String, dynamic> json) =>
      _$CommentReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'post_id')
  final int postId;
  final String content;
  @JsonKey(name: 'parent_comment_id')
  final int? parentCommentId;

  Map<String, dynamic> toJson() => _$CommentReqToJson(this);
}
