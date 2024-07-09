// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_discussion_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDiscussionReq _$CreateDiscussionReqFromJson(Map<String, dynamic> json) =>
    CreateDiscussionReq(
      authorId: json['author_id'] as String,
      topic: json['topic'] as String,
      invitedUserIds: (json['invited_user_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateDiscussionReqToJson(
        CreateDiscussionReq instance) =>
    <String, dynamic>{
      'author_id': instance.authorId,
      'topic': instance.topic,
      'invited_user_ids': instance.invitedUserIds,
    };
