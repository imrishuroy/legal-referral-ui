import 'package:json_annotation/json_annotation.dart';

part 'save_post_req.g.dart';

@JsonSerializable()
class SavePostReq {
  SavePostReq({
    required this.userId,
    required this.postId,
  });

  factory SavePostReq.fromJson(Map<String, dynamic> json) =>
      _$SavePostReqFromJson(json);

  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'post_id')
  final int postId;

  Map<String, dynamic> toJson() => _$SavePostReqToJson(this);
}
