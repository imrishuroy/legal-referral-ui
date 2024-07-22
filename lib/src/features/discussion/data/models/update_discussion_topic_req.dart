import 'package:json_annotation/json_annotation.dart';

part 'update_discussion_topic_req.g.dart';

@JsonSerializable()
class UpdateDiscussionTopicReq {
  UpdateDiscussionTopicReq({
    required this.discussionId,
    required this.topic,
  });

  factory UpdateDiscussionTopicReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateDiscussionTopicReqFromJson(json);

  final String topic;

  @JsonKey(name: 'discussion_id')
  final int discussionId;

  Map<String, dynamic> toJson() => _$UpdateDiscussionTopicReqToJson(this);
}
