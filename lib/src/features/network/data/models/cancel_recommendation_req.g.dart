// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_recommendation_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRecommendationReq _$CancelRecommendationReqFromJson(
        Map<String, dynamic> json) =>
    CancelRecommendationReq(
      recommendedUserId: json['recommended_user_id'] as String,
    );

Map<String, dynamic> _$CancelRecommendationReqToJson(
        CancelRecommendationReq instance) =>
    <String, dynamic>{
      'recommended_user_id': instance.recommendedUserId,
    };
