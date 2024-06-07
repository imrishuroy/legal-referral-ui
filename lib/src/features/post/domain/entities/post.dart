import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'post.freezed.dart';
part 'post.g.dart';

enum PostType { text, image, video, poll }

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'owner_id') required String ownerId,
    required String title,
    required String content,
    required PostType type,
    @JsonKey(name: 'poll_id', includeIfNull: false)
    @JsonKey(name: 'created_at')
    @DateTimeJsonConverter()
    required DateTime createdAt,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    @Default([])
    List<File> files,
    String? pollId,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
