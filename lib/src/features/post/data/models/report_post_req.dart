import 'package:json_annotation/json_annotation.dart';

part 'report_post_req.g.dart';

@JsonSerializable()
class ReportPostReq {
  ReportPostReq({
    required this.postId,
    required this.reportedBy,
    required this.reason,
  });

  factory ReportPostReq.fromJson(Map<String, dynamic> json) =>
      _$ReportPostReqFromJson(json);
  @JsonKey(name: 'post_id')
  final int postId;
  @JsonKey(name: 'reported_by')
  final String reportedBy;
  final String reason;

  Map<String, dynamic> toJson() => _$ReportPostReqToJson(this);
}
