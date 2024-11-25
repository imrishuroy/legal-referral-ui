// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingInfo _$RatingInfoFromJson(Map<String, dynamic> json) => RatingInfo(
      averageRating: (json['average_rating'] as num).toDouble(),
      attorneys: (json['attorneys'] as num).toInt(),
    );

Map<String, dynamic> _$RatingInfoToJson(RatingInfo instance) =>
    <String, dynamic>{
      'average_rating': instance.averageRating,
      'attorneys': instance.attorneys,
    };

_$AccountInfoImpl _$$AccountInfoImplFromJson(Map<String, dynamic> json) =>
    _$AccountInfoImpl(
      userId: json['user_id'] as String,
      followersCount: (json['followers_count'] as num).toInt(),
      connectionsCount: (json['connections_count'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      ratingInfo: json['rating_info'] == null
          ? null
          : RatingInfo.fromJson(json['rating_info'] as Map<String, dynamic>),
      practiceArea: json['practice_area'] as String?,
    );

Map<String, dynamic> _$$AccountInfoImplToJson(_$AccountInfoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'followers_count': instance.followersCount,
      'connections_count': instance.connectionsCount,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'rating_info': instance.ratingInfo,
      'practice_area': instance.practiceArea,
    };
