import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/post/domain/domain.dart';

part 'feature_post.freezed.dart';
part 'feature_post.g.dart';

@freezed
class FeaturePost with _$FeaturePost {
  const factory FeaturePost({
    @JsonKey(name: 'feature_post_id') required int featurePostId,
    required Post? post,
    @JsonKey(name: 'created_at')
    @DateTimeJsonConverter()
    required DateTime createdAt,
  }) = _FeaturePost;

  factory FeaturePost.fromJson(Map<String, dynamic> json) =>
      _$FeaturePostFromJson(json);
}
