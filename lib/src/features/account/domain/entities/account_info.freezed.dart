// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountInfo {
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @JsonKey(name: 'connections_count')
  int get connectionsCount;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'rating_info')
  RatingInfo? get ratingInfo;
  @JsonKey(name: 'practice_area')
  String? get practiceArea;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountInfoCopyWith<AccountInfo> get copyWith =>
      _$AccountInfoCopyWithImpl<AccountInfo>(this as AccountInfo, _$identity);

  /// Serializes this AccountInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountInfo &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.connectionsCount, connectionsCount) ||
                other.connectionsCount == connectionsCount) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.ratingInfo, ratingInfo) ||
                other.ratingInfo == ratingInfo) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      followersCount,
      connectionsCount,
      firstName,
      lastName,
      avatarUrl,
      ratingInfo,
      practiceArea);

  @override
  String toString() {
    return 'AccountInfo(userId: $userId, followersCount: $followersCount, connectionsCount: $connectionsCount, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, ratingInfo: $ratingInfo, practiceArea: $practiceArea)';
  }
}

/// @nodoc
abstract mixin class $AccountInfoCopyWith<$Res> {
  factory $AccountInfoCopyWith(
          AccountInfo value, $Res Function(AccountInfo) _then) =
      _$AccountInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'connections_count') int connectionsCount,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'rating_info') RatingInfo? ratingInfo,
      @JsonKey(name: 'practice_area') String? practiceArea});
}

/// @nodoc
class _$AccountInfoCopyWithImpl<$Res> implements $AccountInfoCopyWith<$Res> {
  _$AccountInfoCopyWithImpl(this._self, this._then);

  final AccountInfo _self;
  final $Res Function(AccountInfo) _then;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? followersCount = null,
    Object? connectionsCount = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatarUrl = freezed,
    Object? ratingInfo = freezed,
    Object? practiceArea = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      connectionsCount: null == connectionsCount
          ? _self.connectionsCount
          : connectionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingInfo: freezed == ratingInfo
          ? _self.ratingInfo
          : ratingInfo // ignore: cast_nullable_to_non_nullable
              as RatingInfo?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AccountInfo implements AccountInfo {
  const _AccountInfo(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'followers_count') required this.followersCount,
      @JsonKey(name: 'connections_count') required this.connectionsCount,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'rating_info') this.ratingInfo,
      @JsonKey(name: 'practice_area') this.practiceArea});
  factory _AccountInfo.fromJson(Map<String, dynamic> json) =>
      _$AccountInfoFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'connections_count')
  final int connectionsCount;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'rating_info')
  final RatingInfo? ratingInfo;
  @override
  @JsonKey(name: 'practice_area')
  final String? practiceArea;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountInfoCopyWith<_AccountInfo> get copyWith =>
      __$AccountInfoCopyWithImpl<_AccountInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountInfo &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.connectionsCount, connectionsCount) ||
                other.connectionsCount == connectionsCount) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.ratingInfo, ratingInfo) ||
                other.ratingInfo == ratingInfo) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      followersCount,
      connectionsCount,
      firstName,
      lastName,
      avatarUrl,
      ratingInfo,
      practiceArea);

  @override
  String toString() {
    return 'AccountInfo(userId: $userId, followersCount: $followersCount, connectionsCount: $connectionsCount, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, ratingInfo: $ratingInfo, practiceArea: $practiceArea)';
  }
}

/// @nodoc
abstract mixin class _$AccountInfoCopyWith<$Res>
    implements $AccountInfoCopyWith<$Res> {
  factory _$AccountInfoCopyWith(
          _AccountInfo value, $Res Function(_AccountInfo) _then) =
      __$AccountInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'connections_count') int connectionsCount,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'rating_info') RatingInfo? ratingInfo,
      @JsonKey(name: 'practice_area') String? practiceArea});
}

/// @nodoc
class __$AccountInfoCopyWithImpl<$Res> implements _$AccountInfoCopyWith<$Res> {
  __$AccountInfoCopyWithImpl(this._self, this._then);

  final _AccountInfo _self;
  final $Res Function(_AccountInfo) _then;

  /// Create a copy of AccountInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? followersCount = null,
    Object? connectionsCount = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatarUrl = freezed,
    Object? ratingInfo = freezed,
    Object? practiceArea = freezed,
  }) {
    return _then(_AccountInfo(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      connectionsCount: null == connectionsCount
          ? _self.connectionsCount
          : connectionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingInfo: freezed == ratingInfo
          ? _self.ratingInfo
          : ratingInfo // ignore: cast_nullable_to_non_nullable
              as RatingInfo?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
