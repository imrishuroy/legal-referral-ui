import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'project_review.freezed.dart';
part 'project_review.g.dart';

@freezed
class ProjectReview with _$ProjectReview {
  const factory ProjectReview({
    @JsonKey(name: 'project_id') required int? projectId,
    @JsonKey(name: 'user_id') required String? userId,
    required String? review,
    required double rating,
    @JsonKey(
      name: 'created_at',
      includeToJson: false,
    )
    @DateTimeJsonConverter()
    DateTime? createdAt,
    @JsonKey(
      name: 'review_id',
      includeIfNull: false,
    )
    int? reviewId,
  }) = _ProjectReview;

  factory ProjectReview.fromJson(Map<String, dynamic> json) =>
      _$ProjectReviewFromJson(json);
}
