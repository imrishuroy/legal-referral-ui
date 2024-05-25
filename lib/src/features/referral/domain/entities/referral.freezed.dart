// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Referral _$ReferralFromJson(Map<String, dynamic> json) {
  return _Referral.fromJson(json);
}

/// @nodoc
mixin _$Referral {
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'case_description')
  String get caseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_area')
  String? get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_location')
  String? get practiceLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_user_id')
  String? get referredUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_id', includeToJson: false)
  int? get referralId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', includeToJson: false)
  ReferralProjectStatus get status => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'updated_at', includeToJson: false)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralCopyWith<Referral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralCopyWith<$Res> {
  factory $ReferralCopyWith(Referral value, $Res Function(Referral) then) =
      _$ReferralCopyWithImpl<$Res, Referral>;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'case_description') String caseDescription,
      @JsonKey(name: 'preferred_practice_area') String? practiceArea,
      @JsonKey(name: 'preferred_practice_location') String? practiceLocation,
      @JsonKey(name: 'referred_user_id') String? referredUserId,
      @JsonKey(name: 'referrer_user_id') String? referrerUserId,
      @JsonKey(name: 'referral_id', includeToJson: false) int? referralId,
      @JsonKey(name: 'status', includeToJson: false)
      ReferralProjectStatus status,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      DateTime? createdAt,
      @DateTimeJsonConverter()
      @JsonKey(name: 'updated_at', includeToJson: false)
      DateTime? updatedAt});
}

/// @nodoc
class _$ReferralCopyWithImpl<$Res, $Val extends Referral>
    implements $ReferralCopyWith<$Res> {
  _$ReferralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? caseDescription = null,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? referredUserId = freezed,
    Object? referrerUserId = freezed,
    Object? referralId = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      referredUserId: freezed == referredUserId
          ? _value.referredUserId
          : referredUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerUserId: freezed == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReferralProjectStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferralImplCopyWith<$Res>
    implements $ReferralCopyWith<$Res> {
  factory _$$ReferralImplCopyWith(
          _$ReferralImpl value, $Res Function(_$ReferralImpl) then) =
      __$$ReferralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'case_description') String caseDescription,
      @JsonKey(name: 'preferred_practice_area') String? practiceArea,
      @JsonKey(name: 'preferred_practice_location') String? practiceLocation,
      @JsonKey(name: 'referred_user_id') String? referredUserId,
      @JsonKey(name: 'referrer_user_id') String? referrerUserId,
      @JsonKey(name: 'referral_id', includeToJson: false) int? referralId,
      @JsonKey(name: 'status', includeToJson: false)
      ReferralProjectStatus status,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      DateTime? createdAt,
      @DateTimeJsonConverter()
      @JsonKey(name: 'updated_at', includeToJson: false)
      DateTime? updatedAt});
}

/// @nodoc
class __$$ReferralImplCopyWithImpl<$Res>
    extends _$ReferralCopyWithImpl<$Res, _$ReferralImpl>
    implements _$$ReferralImplCopyWith<$Res> {
  __$$ReferralImplCopyWithImpl(
      _$ReferralImpl _value, $Res Function(_$ReferralImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? caseDescription = null,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? referredUserId = freezed,
    Object? referrerUserId = freezed,
    Object? referralId = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReferralImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      caseDescription: null == caseDescription
          ? _value.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      referredUserId: freezed == referredUserId
          ? _value.referredUserId
          : referredUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerUserId: freezed == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReferralProjectStatus,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralImpl implements _Referral {
  const _$ReferralImpl(
      {required this.title,
      @JsonKey(name: 'case_description') required this.caseDescription,
      @JsonKey(name: 'preferred_practice_area') required this.practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required this.practiceLocation,
      @JsonKey(name: 'referred_user_id') required this.referredUserId,
      @JsonKey(name: 'referrer_user_id') required this.referrerUserId,
      @JsonKey(name: 'referral_id', includeToJson: false) this.referralId,
      @JsonKey(name: 'status', includeToJson: false)
      this.status = ReferralProjectStatus.active,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      this.createdAt,
      @DateTimeJsonConverter()
      @JsonKey(name: 'updated_at', includeToJson: false)
      this.updatedAt});

  factory _$ReferralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralImplFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'case_description')
  final String caseDescription;
  @override
  @JsonKey(name: 'preferred_practice_area')
  final String? practiceArea;
  @override
  @JsonKey(name: 'preferred_practice_location')
  final String? practiceLocation;
  @override
  @JsonKey(name: 'referred_user_id')
  final String? referredUserId;
  @override
  @JsonKey(name: 'referrer_user_id')
  final String? referrerUserId;
  @override
  @JsonKey(name: 'referral_id', includeToJson: false)
  final int? referralId;
  @override
  @JsonKey(name: 'status', includeToJson: false)
  final ReferralProjectStatus status;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  final DateTime? createdAt;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'updated_at', includeToJson: false)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Referral(title: $title, caseDescription: $caseDescription, practiceArea: $practiceArea, practiceLocation: $practiceLocation, referredUserId: $referredUserId, referrerUserId: $referrerUserId, referralId: $referralId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.caseDescription, caseDescription) ||
                other.caseDescription == caseDescription) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.referredUserId, referredUserId) ||
                other.referredUserId == referredUserId) &&
            (identical(other.referrerUserId, referrerUserId) ||
                other.referrerUserId == referrerUserId) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      caseDescription,
      practiceArea,
      practiceLocation,
      referredUserId,
      referrerUserId,
      referralId,
      status,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      __$$ReferralImplCopyWithImpl<_$ReferralImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralImplToJson(
      this,
    );
  }
}

abstract class _Referral implements Referral {
  const factory _Referral(
      {required final String title,
      @JsonKey(name: 'case_description') required final String caseDescription,
      @JsonKey(name: 'preferred_practice_area')
      required final String? practiceArea,
      @JsonKey(name: 'preferred_practice_location')
      required final String? practiceLocation,
      @JsonKey(name: 'referred_user_id') required final String? referredUserId,
      @JsonKey(name: 'referrer_user_id') required final String? referrerUserId,
      @JsonKey(name: 'referral_id', includeToJson: false) final int? referralId,
      @JsonKey(name: 'status', includeToJson: false)
      final ReferralProjectStatus status,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeToJson: false)
      final DateTime? createdAt,
      @DateTimeJsonConverter()
      @JsonKey(name: 'updated_at', includeToJson: false)
      final DateTime? updatedAt}) = _$ReferralImpl;

  factory _Referral.fromJson(Map<String, dynamic> json) =
      _$ReferralImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'case_description')
  String get caseDescription;
  @override
  @JsonKey(name: 'preferred_practice_area')
  String? get practiceArea;
  @override
  @JsonKey(name: 'preferred_practice_location')
  String? get practiceLocation;
  @override
  @JsonKey(name: 'referred_user_id')
  String? get referredUserId;
  @override
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId;
  @override
  @JsonKey(name: 'referral_id', includeToJson: false)
  int? get referralId;
  @override
  @JsonKey(name: 'status', includeToJson: false)
  ReferralProjectStatus get status;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeToJson: false)
  DateTime? get createdAt;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'updated_at', includeToJson: false)
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ReferralImplCopyWith<_$ReferralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
