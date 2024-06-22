import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @JsonKey(name: 'comment_id') required int commentId,
    @JsonKey(name: 'post_id') required int postId,
    required String content,
    @JsonKey(name: 'created_at')
    @DateTimeJsonConverter()
    required DateTime createdAt,
    @JsonKey(name: 'author_user_id') required String authorUserId,
    @JsonKey(name: 'parent_comment_id') int? parentCommentId,
    @JsonKey(name: 'author_first_name') String? authorFirstName,
    @JsonKey(name: 'author_last_name') String? authorLastName,
    @JsonKey(name: 'author_practice_area') String? authorPracticeArea,
    @JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @Default(0) @JsonKey(name: 'likes_count') int likesCount,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
