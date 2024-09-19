// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeaturePostImpl _$$FeaturePostImplFromJson(Map<String, dynamic> json) =>
    _$FeaturePostImpl(
      featurePostId: (json['feature_post_id'] as num).toInt(),
      post: json['post'] == null
          ? null
          : Post.fromJson(json['post'] as Map<String, dynamic>),
      createdAt:
          const DateTimeJsonConverter().fromJson(json['created_at'] as String),
    );

Map<String, dynamic> _$$FeaturePostImplToJson(_$FeaturePostImpl instance) =>
    <String, dynamic>{
      'feature_post_id': instance.featurePostId,
      'post': instance.post,
      'created_at': const DateTimeJsonConverter().toJson(instance.createdAt),
    };
