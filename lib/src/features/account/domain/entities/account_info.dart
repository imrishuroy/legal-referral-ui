import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_info.freezed.dart';
part 'account_info.g.dart';

@JsonSerializable()
class RatingInfo {
  RatingInfo({
    required this.averageRating,
    required this.attorneys,
  });

  factory RatingInfo.fromJson(Map<String, dynamic> json) =>
      _$RatingInfoFromJson(json);

  @JsonKey(name: 'average_rating')
  final double averageRating;
  @JsonKey(name: 'attorneys')
  final int attorneys;
}

@freezed
class AccountInfo with _$AccountInfo {
  const factory AccountInfo({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'followers_count') required int followersCount,
    @JsonKey(name: 'connections_count') required int connectionsCount,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'rating_info') RatingInfo? ratingInfo,
    @JsonKey(name: 'practice_area') String? practiceArea,
  }) = _AccountInfo;

  factory AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);
}
