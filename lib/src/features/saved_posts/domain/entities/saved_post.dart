import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

part 'saved_post.freezed.dart';
part 'saved_post.g.dart';

@freezed
class SavedPost with _$SavedPost {
  const factory SavedPost({
    required Post? post,
    @JsonKey(name: 'user') required AppUser? owner,
    @JsonKey(name: 'saved_post_id') required int savedPostId,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _SavedPost;

  factory SavedPost.fromJson(Map<String, dynamic> json) =>
      _$SavedPostFromJson(json);
}
