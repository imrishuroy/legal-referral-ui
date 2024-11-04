import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum FeedType {
  @JsonValue('post')
  post,
  @JsonValue('ad')
  ad,
}

@freezed
class Feed with _$Feed {
  const factory Feed({
    @JsonKey(name: 'feed_type') required FeedType type,
    @JsonKey(name: 'feed_post') FeedPost? feedPost,
    @JsonKey(name: 'ad') Ad? ad,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}

@freezed
class FeedPost with _$FeedPost {
  const factory FeedPost({
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'post_id') required int postId,
    @JsonKey(name: 'content') required String? content,
    @JsonKey(name: 'post_type') required PostType postType,
    @JsonKey(name: 'poll_id') int? pollId,
    @JsonKey(name: 'owner_first_name') String? ownerFirstName,
    @JsonKey(name: 'owner_last_name') String? ownerLastName,
    @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
    @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
    @Default([]) @JsonKey(name: 'media') List<String> media,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @Default(0) @JsonKey(name: 'likes_count') int likesCount,
    @Default(0) @JsonKey(name: 'comments_count') int commentsCount,
  }) = _FeedPost;

  factory FeedPost.fromJson(Map<String, dynamic> json) =>
      _$FeedPostFromJson(json);
}
