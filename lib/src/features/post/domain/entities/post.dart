import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum PostType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('document')
  document,
  @JsonValue('link')
  link,
  @JsonValue('video')
  video,
  @JsonValue('poll')
  poll,
}

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'post_type') required PostType type,
    @JsonKey(name: 'created_at', includeToJson: false)
    @DateTimeJsonConverter()
    required DateTime createdAt,
    @JsonKey(name: 'post_id') required int postId,
    String? content,
    @JsonKey(name: 'media') @Default([]) List<String?> filesUrls,
    @JsonKey(name: 'poll_id', includeIfNull: false) int? pollId,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
