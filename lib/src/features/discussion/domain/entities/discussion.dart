import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:legal_referral_ui/src/core/config/datetime_json_converter.dart';

part 'discussion.freezed.dart';
part 'discussion.g.dart';

@freezed
class Discussion with _$Discussion {
  factory Discussion({
    @JsonKey(name: 'discussion_id', includeIfNull: false) int? discussionId,
    @JsonKey(name: 'topic', includeIfNull: false) String? topic,
    @JsonKey(name: 'author_id') String? authorId,
    @DateTimeJsonConverter()
    @JsonKey(name: 'created_at', includeIfNull: false)
    DateTime? createdAt,
    @JsonKey(name: 'active_member_count', includeIfNull: false)
    int? activeMemberCount,
  }) = _Discussion;

  factory Discussion.fromJson(Map<String, dynamic> json) =>
      _$DiscussionFromJson(json);
}
