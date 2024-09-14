// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavePostReq _$SavePostReqFromJson(Map<String, dynamic> json) => SavePostReq(
      userId: json['user_id'] as String,
      postId: (json['post_id'] as num).toInt(),
    );

Map<String, dynamic> _$SavePostReqToJson(SavePostReq instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'post_id': instance.postId,
    };
