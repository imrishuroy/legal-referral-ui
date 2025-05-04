// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectReview _$ProjectReviewFromJson(Map<String, dynamic> json) =>
    _ProjectReview(
      projectId: (json['project_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      review: json['review'] as String?,
      rating: (json['rating'] as num).toDouble(),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      reviewId: (json['review_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProjectReviewToJson(_ProjectReview instance) =>
    <String, dynamic>{
      'project_id': instance.projectId,
      'user_id': instance.userId,
      'review': instance.review,
      'rating': instance.rating,
      if (instance.reviewId case final value?) 'review_id': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
