import 'package:freezed_annotation/freezed_annotation.dart';
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
sealed class Feed with _$Feed {
  const factory Feed({
    @JsonKey(name: 'feed_id') required int feedId,
    @JsonKey(name: 'feed_type') required FeedType type,
    @JsonKey(name: 'feed_post') required Post? post,
    @JsonKey(name: 'ad') Ad? ad,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
