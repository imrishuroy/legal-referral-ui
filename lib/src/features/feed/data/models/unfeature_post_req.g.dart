// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unfeature_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnFeaturePostReq _$UnFeaturePostReqFromJson(Map<String, dynamic> json) =>
    UnFeaturePostReq(
      postId: (json['post_id'] as num).toInt(),
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$UnFeaturePostReqToJson(UnFeaturePostReq instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'user_id': instance.userId,
    };
