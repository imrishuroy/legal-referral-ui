import 'package:json_annotation/json_annotation.dart';

part 'cancel_recommendation_req.g.dart';

@JsonSerializable()
class CancelRecommendationReq {
  CancelRecommendationReq({required this.recommendedUserId});

  factory CancelRecommendationReq.fromJson(Map<String, dynamic> json) =>
      _$CancelRecommendationReqFromJson(json);

  @JsonKey(name: 'recommended_user_id')
  final String recommendedUserId;

  Map<String, dynamic> toJson() => _$CancelRecommendationReqToJson(this);
}
