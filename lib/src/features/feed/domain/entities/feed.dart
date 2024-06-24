import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  const factory Feed({
    @JsonKey(name: 'feed_id') required int feedId,
    @JsonKey(name: 'user') required AppUser? user,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @Default(0) @JsonKey(name: 'likes_count') int likesCount,
    @Default(0) @JsonKey(name: 'comments_count') int commentsCount,
    @JsonKey(name: 'post') Post? post,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
