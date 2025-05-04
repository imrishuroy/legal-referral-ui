// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReferral {
  String get title;
  @JsonKey(name: 'case_description')
  String get caseDescription;
  @JsonKey(name: 'preferred_practice_area')
  String get practiceArea;
  @JsonKey(name: 'preferred_practice_location')
  String get practiceLocation;
  @JsonKey(name: 'referrer_user_id')
  String get referrerUserId;
  @JsonKey(name: 'referred_user_ids')
  List<String> get referredUserIds;

  /// Create a copy of CreateReferral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateReferralCopyWith<CreateReferral> get copyWith =>
      _$CreateReferralCopyWithImpl<CreateReferral>(
          this as CreateReferral, _$identity);

  /// Serializes this CreateReferral to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateReferral &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caseDescription, caseDescription) ||
                other.caseDescription == caseDescription) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.referrerUserId, referrerUserId) ||
                other.referrerUserId == referrerUserId) &&
            const DeepCollectionEquality()
                .equals(other.referredUserIds, referredUserIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      caseDescription,
      practiceArea,
      practiceLocation,
      referrerUserId,
      const DeepCollectionEquality().hash(referredUserIds));

  @override
  String toString() {
    return 'CreateReferral(title: $title, caseDescription: $caseDescription, practiceArea: $practiceArea, practiceLocation: $practiceLocation, referrerUserId: $referrerUserId, referredUserIds: $referredUserIds)';
  }
}

/// @nodoc
abstract mixin class $CreateReferralCopyWith<$Res> {
  factory $CreateReferralCopyWith(
          CreateReferral value, $Res Function(CreateReferral) _then) =
      _$CreateReferralCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'case_description') String caseDescription,
      @JsonKey(name: 'preferred_practice_area') String practiceArea,
      @JsonKey(name: 'preferred_practice_location') String practiceLocation,
      @JsonKey(name: 'referrer_user_id') String referrerUserId,
      @JsonKey(name: 'referred_user_ids') List<String> referredUserIds});
}

/// @nodoc
class _$CreateReferralCopyWithImpl<$Res>
    implements $CreateReferralCopyWith<$Res> {
  _$CreateReferralCopyWithImpl(this._self, this._then);

  final CreateReferral _self;
  final $Res Function(CreateReferral) _then;

  /// Create a copy of CreateReferral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? caseDescription = null,
    Object? practiceArea = null,
    Object? practiceLocation = null,
    Object? referrerUserId = null,
    Object? referredUserIds = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseDescription: null == caseDescription
          ? _self.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: null == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String,
      practiceLocation: null == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String,
      referrerUserId: null == referrerUserId
          ? _self.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      referredUserIds: null == referredUserIds
          ? _self.referredUserIds
          : referredUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CreateReferral implements CreateReferral {
  const _CreateReferral(
      {required this.title,
      @JsonKey(name: 'case_description') required this.caseDescription,
      @JsonKey(name: 'preferred_practice_area') required this.practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required this.practiceLocation,
      @JsonKey(name: 'referrer_user_id') required this.referrerUserId,
      @JsonKey(name: 'referred_user_ids')
      required final List<String> referredUserIds})
      : _referredUserIds = referredUserIds;
  factory _CreateReferral.fromJson(Map<String, dynamic> json) =>
      _$CreateReferralFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'case_description')
  final String caseDescription;
  @override
  @JsonKey(name: 'preferred_practice_area')
  final String practiceArea;
  @override
  @JsonKey(name: 'preferred_practice_location')
  final String practiceLocation;
  @override
  @JsonKey(name: 'referrer_user_id')
  final String referrerUserId;
  final List<String> _referredUserIds;
  @override
  @JsonKey(name: 'referred_user_ids')
  List<String> get referredUserIds {
    if (_referredUserIds is EqualUnmodifiableListView) return _referredUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_referredUserIds);
  }

  /// Create a copy of CreateReferral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateReferralCopyWith<_CreateReferral> get copyWith =>
      __$CreateReferralCopyWithImpl<_CreateReferral>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateReferralToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateReferral &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caseDescription, caseDescription) ||
                other.caseDescription == caseDescription) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.referrerUserId, referrerUserId) ||
                other.referrerUserId == referrerUserId) &&
            const DeepCollectionEquality()
                .equals(other._referredUserIds, _referredUserIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      caseDescription,
      practiceArea,
      practiceLocation,
      referrerUserId,
      const DeepCollectionEquality().hash(_referredUserIds));

  @override
  String toString() {
    return 'CreateReferral(title: $title, caseDescription: $caseDescription, practiceArea: $practiceArea, practiceLocation: $practiceLocation, referrerUserId: $referrerUserId, referredUserIds: $referredUserIds)';
  }
}

/// @nodoc
abstract mixin class _$CreateReferralCopyWith<$Res>
    implements $CreateReferralCopyWith<$Res> {
  factory _$CreateReferralCopyWith(
          _CreateReferral value, $Res Function(_CreateReferral) _then) =
      __$CreateReferralCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'case_description') String caseDescription,
      @JsonKey(name: 'preferred_practice_area') String practiceArea,
      @JsonKey(name: 'preferred_practice_location') String practiceLocation,
      @JsonKey(name: 'referrer_user_id') String referrerUserId,
      @JsonKey(name: 'referred_user_ids') List<String> referredUserIds});
}

/// @nodoc
class __$CreateReferralCopyWithImpl<$Res>
    implements _$CreateReferralCopyWith<$Res> {
  __$CreateReferralCopyWithImpl(this._self, this._then);

  final _CreateReferral _self;
  final $Res Function(_CreateReferral) _then;

  /// Create a copy of CreateReferral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? caseDescription = null,
    Object? practiceArea = null,
    Object? practiceLocation = null,
    Object? referrerUserId = null,
    Object? referredUserIds = null,
  }) {
    return _then(_CreateReferral(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseDescription: null == caseDescription
          ? _self.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: null == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String,
      practiceLocation: null == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String,
      referrerUserId: null == referrerUserId
          ? _self.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      referredUserIds: null == referredUserIds
          ? _self._referredUserIds
          : referredUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
