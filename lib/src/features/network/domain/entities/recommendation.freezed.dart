// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return _Recommendation.fromJson(json);
}

/// @nodoc
mixin _$Recommendation {
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_area')
  String? get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation => throw _privateConstructorUsedError;
  String? get experience => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  ConnectionInvitationStatus? get status => throw _privateConstructorUsedError;

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationCopyWith<Recommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationCopyWith<$Res> {
  factory $RecommendationCopyWith(
          Recommendation value, $Res Function(Recommendation) then) =
      _$RecommendationCopyWithImpl<$Res, Recommendation>;
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
class _$RecommendationCopyWithImpl<$Res, $Val extends Recommendation>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationImplCopyWith<$Res>
    implements $RecommendationCopyWith<$Res> {
  factory _$$RecommendationImplCopyWith(_$RecommendationImpl value,
          $Res Function(_$RecommendationImpl) then) =
      __$$RecommendationImplCopyWithImpl<$Res>;
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
class __$$RecommendationImplCopyWithImpl<$Res>
    extends _$RecommendationCopyWithImpl<$Res, _$RecommendationImpl>
    implements _$$RecommendationImplCopyWith<$Res> {
  __$$RecommendationImplCopyWithImpl(
      _$RecommendationImpl _value, $Res Function(_$RecommendationImpl) _then)
      : super(_value, _then);

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
    return _then(_$RecommendationImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationImpl implements _Recommendation {
  const _$RecommendationImpl(
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

  factory _$RecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationImplFromJson(json);

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

  @override
  String toString() {
    return 'Recommendation(userId: $userId, firstName: $firstName, lastName: $lastName, about: $about, avatarUrl: $avatarUrl, practiceArea: $practiceArea, practiceLocation: $practiceLocation, experience: $experience, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationImpl &&
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

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      __$$RecommendationImplCopyWithImpl<_$RecommendationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationImplToJson(
      this,
    );
  }
}

abstract class _Recommendation implements Recommendation {
  const factory _Recommendation(
      {@JsonKey(name: 'user_id') required final String? userId,
      @JsonKey(name: 'first_name') required final String? firstName,
      @JsonKey(name: 'last_name') required final String? lastName,
      required final String? about,
      @JsonKey(name: 'avatar_url') required final String? avatarUrl,
      @JsonKey(name: 'practice_area') required final String? practiceArea,
      @JsonKey(name: 'practice_location')
      required final String? practiceLocation,
      required final String? experience,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final ConnectionInvitationStatus? status}) = _$RecommendationImpl;

  factory _Recommendation.fromJson(Map<String, dynamic> json) =
      _$RecommendationImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get about;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @override
  @JsonKey(name: 'practice_location')
  String? get practiceLocation;
  @override
  String? get experience;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  ConnectionInvitationStatus? get status;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
