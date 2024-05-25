// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectReviewImpl _$$ProjectReviewImplFromJson(Map<String, dynamic> json) =>
    _$ProjectReviewImpl(
      projectId: (json['project_id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      review: json['review'] as String?,
      rating: (json['rating'] as num).toDouble(),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['created_at'], const DateTimeJsonConverter().fromJson),
      reviewId: (json['review_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectReviewImplToJson(_$ProjectReviewImpl instance) {
  final val = <String, dynamic>{
    'project_id': instance.projectId,
    'user_id': instance.userId,
    'review': instance.review,
    'rating': instance.rating,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('review_id', instance.reviewId);
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
