// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateReferral _$CreateReferralFromJson(Map<String, dynamic> json) {
  return _CreateReferral.fromJson(json);
}

/// @nodoc
mixin _$CreateReferral {
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'case_description')
  String get caseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_area')
  String get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_location')
  String get practiceLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_user_id')
  String get referrerUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_user_ids')
  List<String> get referredUserIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateReferralCopyWith<CreateReferral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReferralCopyWith<$Res> {
  factory $CreateReferralCopyWith(
          CreateReferral value, $Res Function(CreateReferral) then) =
      _$CreateReferralCopyWithImpl<$Res, CreateReferral>;
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
class _$CreateReferralCopyWithImpl<$Res, $Val extends CreateReferral>
    implements $CreateReferralCopyWith<$Res> {
  _$CreateReferralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseDescription: null == caseDescription
          ? _value.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: null == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String,
      practiceLocation: null == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String,
      referrerUserId: null == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      referredUserIds: null == referredUserIds
          ? _value.referredUserIds
          : referredUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReferralImplCopyWith<$Res>
    implements $CreateReferralCopyWith<$Res> {
  factory _$$CreateReferralImplCopyWith(_$CreateReferralImpl value,
          $Res Function(_$CreateReferralImpl) then) =
      __$$CreateReferralImplCopyWithImpl<$Res>;
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
class __$$CreateReferralImplCopyWithImpl<$Res>
    extends _$CreateReferralCopyWithImpl<$Res, _$CreateReferralImpl>
    implements _$$CreateReferralImplCopyWith<$Res> {
  __$$CreateReferralImplCopyWithImpl(
      _$CreateReferralImpl _value, $Res Function(_$CreateReferralImpl) _then)
      : super(_value, _then);

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
    return _then(_$CreateReferralImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseDescription: null == caseDescription
          ? _value.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: null == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String,
      practiceLocation: null == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String,
      referrerUserId: null == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      referredUserIds: null == referredUserIds
          ? _value._referredUserIds
          : referredUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateReferralImpl implements _CreateReferral {
  const _$CreateReferralImpl(
      {required this.title,
      @JsonKey(name: 'case_description') required this.caseDescription,
      @JsonKey(name: 'preferred_practice_area') required this.practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required this.practiceLocation,
      @JsonKey(name: 'referrer_user_id') required this.referrerUserId,
      @JsonKey(name: 'referred_user_ids')
      required final List<String> referredUserIds})
      : _referredUserIds = referredUserIds;

  factory _$CreateReferralImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReferralImplFromJson(json);

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

  @override
  String toString() {
    return 'CreateReferral(title: $title, caseDescription: $caseDescription, practiceArea: $practiceArea, practiceLocation: $practiceLocation, referrerUserId: $referrerUserId, referredUserIds: $referredUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReferralImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      caseDescription,
      practiceArea,
      practiceLocation,
      referrerUserId,
      const DeepCollectionEquality().hash(_referredUserIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReferralImplCopyWith<_$CreateReferralImpl> get copyWith =>
      __$$CreateReferralImplCopyWithImpl<_$CreateReferralImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReferralImplToJson(
      this,
    );
  }
}

abstract class _CreateReferral implements CreateReferral {
  const factory _CreateReferral(
      {required final String title,
      @JsonKey(name: 'case_description') required final String caseDescription,
      @JsonKey(name: 'preferred_practice_area')
      required final String practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required final String practiceLocation,
      @JsonKey(name: 'referrer_user_id') required final String referrerUserId,
      @JsonKey(name: 'referred_user_ids')
      required final List<String> referredUserIds}) = _$CreateReferralImpl;

  factory _CreateReferral.fromJson(Map<String, dynamic> json) =
      _$CreateReferralImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'case_description')
  String get caseDescription;
  @override
  @JsonKey(name: 'preferred_practice_area')
  String get practiceArea;
  @override
  @JsonKey(name: 'preferred_practice_location')
  String get practiceLocation;
  @override
  @JsonKey(name: 'referrer_user_id')
  String get referrerUserId;
  @override
  @JsonKey(name: 'referred_user_ids')
  List<String> get referredUserIds;
  @override
  @JsonKey(ignore: true)
  _$$CreateReferralImplCopyWith<_$CreateReferralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
