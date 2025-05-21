// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recommendation {
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  String? get about;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation;
  String? get experience;
  @JsonKey(includeFromJson: false, includeToJson: false)
  ConnectionInvitationStatus? get status;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendationCopyWith<Recommendation> get copyWith =>
      _$RecommendationCopyWithImpl<Recommendation>(
          this as Recommendation, _$identity);

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Recommendation &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, firstName, lastName,
      about, avatarUrl, practiceArea, practiceLocation, experience, status);

  @override
  String toString() {
    return 'Recommendation(userId: $userId, firstName: $firstName, lastName: $lastName, about: $about, avatarUrl: $avatarUrl, practiceArea: $practiceArea, practiceLocation: $practiceLocation, experience: $experience, status: $status)';
  }
}

/// @nodoc
abstract mixin class $RecommendationCopyWith<$Res> {
  factory $RecommendationCopyWith(
          Recommendation value, $Res Function(Recommendation) _then) =
      _$RecommendationCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? about,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      String? experience,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ConnectionInvitationStatus? status});
}

/// @nodoc
class _$RecommendationCopyWithImpl<$Res>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._self, this._then);

  final Recommendation _self;
  final $Res Function(Recommendation) _then;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? about = freezed,
    Object? avatarUrl = freezed,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? experience = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Recommendation implements Recommendation {
  const _Recommendation(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.about,
      @JsonKey(name: 'avatar_url') required this.avatarUrl,
      @JsonKey(name: 'practice_area') required this.practiceArea,
      @JsonKey(name: 'practice_location') required this.practiceLocation,
      required this.experience,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.status = ConnectionInvitationStatus.none});
  factory _Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? about;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'practice_area')
  final String? practiceArea;
  @override
  @JsonKey(name: 'practice_location')
  final String? practiceLocation;
  @override
  final String? experience;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final ConnectionInvitationStatus? status;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecommendationCopyWith<_Recommendation> get copyWith =>
      __$RecommendationCopyWithImpl<_Recommendation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecommendationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recommendation &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, firstName, lastName,
      about, avatarUrl, practiceArea, practiceLocation, experience, status);

  @override
  String toString() {
    return 'Recommendation(userId: $userId, firstName: $firstName, lastName: $lastName, about: $about, avatarUrl: $avatarUrl, practiceArea: $practiceArea, practiceLocation: $practiceLocation, experience: $experience, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$RecommendationCopyWith<$Res>
    implements $RecommendationCopyWith<$Res> {
  factory _$RecommendationCopyWith(
          _Recommendation value, $Res Function(_Recommendation) _then) =
      __$RecommendationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? about,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      String? experience,
      @JsonKey(includeFromJson: false, includeToJson: false)
      ConnectionInvitationStatus? status});
}

/// @nodoc
class __$RecommendationCopyWithImpl<$Res>
    implements _$RecommendationCopyWith<$Res> {
  __$RecommendationCopyWithImpl(this._self, this._then);

  final _Recommendation _self;
  final $Res Function(_Recommendation) _then;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? about = freezed,
    Object? avatarUrl = freezed,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? experience = freezed,
    Object? status = freezed,
  }) {
    return _then(_Recommendation(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ));
  }
}

// dart format on
