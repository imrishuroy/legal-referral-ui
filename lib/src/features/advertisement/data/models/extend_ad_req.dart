import 'package:json_annotation/json_annotation.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';

part 'extend_ad_req.g.dart';

@JsonSerializable()
class ExtendAdReq {
  ExtendAdReq({
    required this.adId,
    required this.endDate,
  });

  factory ExtendAdReq.fromJson(Map<String, dynamic> json) =>
      _$ExtendAdReqFromJson(json);

  @JsonKey(name: 'ad_id')
  final int adId;
  @DateTimeJsonConverter()
  @JsonKey(name: 'end_date')
  final DateTime endDate;

  Map<String, dynamic> toJson() => _$ExtendAdReqToJson(this);
}
