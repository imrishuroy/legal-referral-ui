// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_discussion_topic_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDiscussionTopicReq _$UpdateDiscussionTopicReqFromJson(
        Map<String, dynamic> json) =>
    UpdateDiscussionTopicReq(
      discussionId: (json['discussion_id'] as num).toInt(),
      topic: json['topic'] as String,
    );

Map<String, dynamic> _$UpdateDiscussionTopicReqToJson(
        UpdateDiscussionTopicReq instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'discussion_id': instance.discussionId,
    };
