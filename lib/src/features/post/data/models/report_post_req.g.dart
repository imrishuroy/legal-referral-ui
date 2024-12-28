// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_post_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportPostReq _$ReportPostReqFromJson(Map<String, dynamic> json) =>
    ReportPostReq(
      postId: (json['post_id'] as num).toInt(),
      reportedBy: json['reported_by'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$ReportPostReqToJson(ReportPostReq instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'reported_by': instance.reportedBy,
      'reason': instance.reason,
    };
