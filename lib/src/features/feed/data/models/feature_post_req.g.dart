// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturePostReq _$FeaturePostReqFromJson(Map<String, dynamic> json) =>
    FeaturePostReq(
      userId: json['user_id'] as String,
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$FeaturePostReqToJson(FeaturePostReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'post_id': instance.postId,
    };
