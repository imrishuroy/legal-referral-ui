// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_feature_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFeaturePostReq _$SaveFeaturePostReqFromJson(Map<String, dynamic> json) =>
    SaveFeaturePostReq(
      userId: json['user_id'] as String,
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$SaveFeaturePostReqToJson(SaveFeaturePostReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'post_id': instance.postId,
    };
