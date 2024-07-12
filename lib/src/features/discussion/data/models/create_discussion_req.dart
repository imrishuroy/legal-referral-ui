import 'package:json_annotation/json_annotation.dart';

part 'create_discussion_req.g.dart';

@JsonSerializable()
class CreateDiscussionReq {
  CreateDiscussionReq({
    required this.authorId,
    required this.topic,
    required this.invitedUserIds,
  });

  factory CreateDiscussionReq.fromJson(Map<String, dynamic> json) =>
      _$CreateDiscussionReqFromJson(json);

  @JsonKey(name: 'author_id')
  final String authorId;

  @JsonKey(name: 'topic')
  final String topic;

  @JsonKey(name: 'invited_user_ids')
  final List<String> invitedUserIds;

  Map<String, dynamic> toJson() => _$CreateDiscussionReqToJson(this);
}
