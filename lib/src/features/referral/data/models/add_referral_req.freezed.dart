// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_referral_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddReferralReq _$AddReferralReqFromJson(Map<String, dynamic> json) {
  return _AddReferralReq.fromJson(json);
}

/// @nodoc
mixin _$AddReferralReq {
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
  $AddReferralReqCopyWith<AddReferralReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddReferralReqCopyWith<$Res> {
  factory $AddReferralReqCopyWith(
          AddReferralReq value, $Res Function(AddReferralReq) then) =
      _$AddReferralReqCopyWithImpl<$Res, AddReferralReq>;
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
class _$AddReferralReqCopyWithImpl<$Res, $Val extends AddReferralReq>
    implements $AddReferralReqCopyWith<$Res> {
  _$AddReferralReqCopyWithImpl(this._value, this._then);

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
abstract class _$$AddReferralReqImplCopyWith<$Res>
    implements $AddReferralReqCopyWith<$Res> {
  factory _$$AddReferralReqImplCopyWith(_$AddReferralReqImpl value,
          $Res Function(_$AddReferralReqImpl) then) =
      __$$AddReferralReqImplCopyWithImpl<$Res>;
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
class __$$AddReferralReqImplCopyWithImpl<$Res>
    extends _$AddReferralReqCopyWithImpl<$Res, _$AddReferralReqImpl>
    implements _$$AddReferralReqImplCopyWith<$Res> {
  __$$AddReferralReqImplCopyWithImpl(
      _$AddReferralReqImpl _value, $Res Function(_$AddReferralReqImpl) _then)
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
    return _then(_$AddReferralReqImpl(
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
class _$AddReferralReqImpl implements _AddReferralReq {
  const _$AddReferralReqImpl(
      {required this.title,
      @JsonKey(name: 'case_description') required this.caseDescription,
      @JsonKey(name: 'preferred_practice_area') required this.practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required this.practiceLocation,
      @JsonKey(name: 'referrer_user_id') required this.referrerUserId,
      @JsonKey(name: 'referred_user_ids')
      required final List<String> referredUserIds})
      : _referredUserIds = referredUserIds;

  factory _$AddReferralReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddReferralReqImplFromJson(json);

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
    return 'AddReferralReq(title: $title, caseDescription: $caseDescription, practiceArea: $practiceArea, practiceLocation: $practiceLocation, referrerUserId: $referrerUserId, referredUserIds: $referredUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddReferralReqImpl &&
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
  _$$AddReferralReqImplCopyWith<_$AddReferralReqImpl> get copyWith =>
      __$$AddReferralReqImplCopyWithImpl<_$AddReferralReqImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddReferralReqImplToJson(
      this,
    );
  }
}

abstract class _AddReferralReq implements AddReferralReq {
  const factory _AddReferralReq(
      {required final String title,
      @JsonKey(name: 'case_description') required final String caseDescription,
      @JsonKey(name: 'preferred_practice_area')
      required final String practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required final String practiceLocation,
      @JsonKey(name: 'referrer_user_id') required final String referrerUserId,
      @JsonKey(name: 'referred_user_ids')
      required final List<String> referredUserIds}) = _$AddReferralReqImpl;

  factory _AddReferralReq.fromJson(Map<String, dynamic> json) =
      _$AddReferralReqImpl.fromJson;

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
  _$$AddReferralReqImplCopyWith<_$AddReferralReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
