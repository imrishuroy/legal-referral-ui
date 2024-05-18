// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return _Proposal.fromJson(json);
}

/// @nodoc
mixin _$Proposal {
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_first_name')
  String? get referrerFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_last_name')
  String? get referrerLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_practice_area')
  String? get referrerPracticeArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_practice_location')
  String? get referrerPracticeLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'referrer_avatar_url')
  String? get referrerAvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_id')
  int? get referralId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_area')
  String? get preferredPracticeArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_location')
  String? get preferredPracticeLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'case_description')
  String? get caseDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProposalCopyWith<Proposal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProposalCopyWith<$Res> {
  factory $ProposalCopyWith(Proposal value, $Res Function(Proposal) then) =
      _$ProposalCopyWithImpl<$Res, Proposal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'referrer_user_id') String? referrerUserId,
      @JsonKey(name: 'referrer_first_name') String? referrerFirstName,
      @JsonKey(name: 'referrer_last_name') String? referrerLastName,
      @JsonKey(name: 'referrer_practice_area') String? referrerPracticeArea,
      @JsonKey(name: 'referrer_practice_location')
      String? referrerPracticeLocation,
      @JsonKey(name: 'referrer_avatar_url') String? referrerAvatarUrl,
      @JsonKey(name: 'referral_id') int? referralId,
      String? title,
      @JsonKey(name: 'preferred_practice_area') String? preferredPracticeArea,
      @JsonKey(name: 'preferred_practice_location')
      String? preferredPracticeLocation,
      @JsonKey(name: 'case_description') String? caseDescription,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? updatedAt});
}

/// @nodoc
class _$ProposalCopyWithImpl<$Res, $Val extends Proposal>
    implements $ProposalCopyWith<$Res> {
  _$ProposalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referrerUserId = freezed,
    Object? referrerFirstName = freezed,
    Object? referrerLastName = freezed,
    Object? referrerPracticeArea = freezed,
    Object? referrerPracticeLocation = freezed,
    Object? referrerAvatarUrl = freezed,
    Object? referralId = freezed,
    Object? title = freezed,
    Object? preferredPracticeArea = freezed,
    Object? preferredPracticeLocation = freezed,
    Object? caseDescription = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      referrerUserId: freezed == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerFirstName: freezed == referrerFirstName
          ? _value.referrerFirstName
          : referrerFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerLastName: freezed == referrerLastName
          ? _value.referrerLastName
          : referrerLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerPracticeArea: freezed == referrerPracticeArea
          ? _value.referrerPracticeArea
          : referrerPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerPracticeLocation: freezed == referrerPracticeLocation
          ? _value.referrerPracticeLocation
          : referrerPracticeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerAvatarUrl: freezed == referrerAvatarUrl
          ? _value.referrerAvatarUrl
          : referrerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredPracticeArea: freezed == preferredPracticeArea
          ? _value.preferredPracticeArea
          : preferredPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredPracticeLocation: freezed == preferredPracticeLocation
          ? _value.preferredPracticeLocation
          : preferredPracticeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      caseDescription: freezed == caseDescription
          ? _value.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ProposalImplCopyWith<$Res>
    implements $ProposalCopyWith<$Res> {
  factory _$$ProposalImplCopyWith(
          _$ProposalImpl value, $Res Function(_$ProposalImpl) then) =
      __$$ProposalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'referrer_user_id') String? referrerUserId,
      @JsonKey(name: 'referrer_first_name') String? referrerFirstName,
      @JsonKey(name: 'referrer_last_name') String? referrerLastName,
      @JsonKey(name: 'referrer_practice_area') String? referrerPracticeArea,
      @JsonKey(name: 'referrer_practice_location')
      String? referrerPracticeLocation,
      @JsonKey(name: 'referrer_avatar_url') String? referrerAvatarUrl,
      @JsonKey(name: 'referral_id') int? referralId,
      String? title,
      @JsonKey(name: 'preferred_practice_area') String? preferredPracticeArea,
      @JsonKey(name: 'preferred_practice_location')
      String? preferredPracticeLocation,
      @JsonKey(name: 'case_description') String? caseDescription,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? updatedAt});
}

/// @nodoc
class __$$ProposalImplCopyWithImpl<$Res>
    extends _$ProposalCopyWithImpl<$Res, _$ProposalImpl>
    implements _$$ProposalImplCopyWith<$Res> {
  __$$ProposalImplCopyWithImpl(
      _$ProposalImpl _value, $Res Function(_$ProposalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referrerUserId = freezed,
    Object? referrerFirstName = freezed,
    Object? referrerLastName = freezed,
    Object? referrerPracticeArea = freezed,
    Object? referrerPracticeLocation = freezed,
    Object? referrerAvatarUrl = freezed,
    Object? referralId = freezed,
    Object? title = freezed,
    Object? preferredPracticeArea = freezed,
    Object? preferredPracticeLocation = freezed,
    Object? caseDescription = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProposalImpl(
      referrerUserId: freezed == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerFirstName: freezed == referrerFirstName
          ? _value.referrerFirstName
          : referrerFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerLastName: freezed == referrerLastName
          ? _value.referrerLastName
          : referrerLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerPracticeArea: freezed == referrerPracticeArea
          ? _value.referrerPracticeArea
          : referrerPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerPracticeLocation: freezed == referrerPracticeLocation
          ? _value.referrerPracticeLocation
          : referrerPracticeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      referrerAvatarUrl: freezed == referrerAvatarUrl
          ? _value.referrerAvatarUrl
          : referrerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      referralId: freezed == referralId
          ? _value.referralId
          : referralId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredPracticeArea: freezed == preferredPracticeArea
          ? _value.preferredPracticeArea
          : preferredPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredPracticeLocation: freezed == preferredPracticeLocation
          ? _value.preferredPracticeLocation
          : preferredPracticeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      caseDescription: freezed == caseDescription
          ? _value.caseDescription
          : caseDescription // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ProposalImpl implements _Proposal {
  const _$ProposalImpl(
      {@JsonKey(name: 'referrer_user_id') required this.referrerUserId,
      @JsonKey(name: 'referrer_first_name') required this.referrerFirstName,
      @JsonKey(name: 'referrer_last_name') required this.referrerLastName,
      @JsonKey(name: 'referrer_practice_area')
      required this.referrerPracticeArea,
      @JsonKey(name: 'referrer_practice_location')
      required this.referrerPracticeLocation,
      @JsonKey(name: 'referrer_avatar_url') required this.referrerAvatarUrl,
      @JsonKey(name: 'referral_id') required this.referralId,
      required this.title,
      @JsonKey(name: 'preferred_practice_area')
      required this.preferredPracticeArea,
      @JsonKey(name: 'preferred_practice_location')
      required this.preferredPracticeLocation,
      @JsonKey(name: 'case_description') required this.caseDescription,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      required this.createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      required this.updatedAt});

  factory _$ProposalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProposalImplFromJson(json);

  @override
  @JsonKey(name: 'referrer_user_id')
  final String? referrerUserId;
  @override
  @JsonKey(name: 'referrer_first_name')
  final String? referrerFirstName;
  @override
  @JsonKey(name: 'referrer_last_name')
  final String? referrerLastName;
  @override
  @JsonKey(name: 'referrer_practice_area')
  final String? referrerPracticeArea;
  @override
  @JsonKey(name: 'referrer_practice_location')
  final String? referrerPracticeLocation;
  @override
  @JsonKey(name: 'referrer_avatar_url')
  final String? referrerAvatarUrl;
  @override
  @JsonKey(name: 'referral_id')
  final int? referralId;
  @override
  final String? title;
  @override
  @JsonKey(name: 'preferred_practice_area')
  final String? preferredPracticeArea;
  @override
  @JsonKey(name: 'preferred_practice_location')
  final String? preferredPracticeLocation;
  @override
  @JsonKey(name: 'case_description')
  final String? caseDescription;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Proposal(referrerUserId: $referrerUserId, referrerFirstName: $referrerFirstName, referrerLastName: $referrerLastName, referrerPracticeArea: $referrerPracticeArea, referrerPracticeLocation: $referrerPracticeLocation, referrerAvatarUrl: $referrerAvatarUrl, referralId: $referralId, title: $title, preferredPracticeArea: $preferredPracticeArea, preferredPracticeLocation: $preferredPracticeLocation, caseDescription: $caseDescription, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProposalImpl &&
            (identical(other.referrerUserId, referrerUserId) ||
                other.referrerUserId == referrerUserId) &&
            (identical(other.referrerFirstName, referrerFirstName) ||
                other.referrerFirstName == referrerFirstName) &&
            (identical(other.referrerLastName, referrerLastName) ||
                other.referrerLastName == referrerLastName) &&
            (identical(other.referrerPracticeArea, referrerPracticeArea) ||
                other.referrerPracticeArea == referrerPracticeArea) &&
            (identical(
                    other.referrerPracticeLocation, referrerPracticeLocation) ||
                other.referrerPracticeLocation == referrerPracticeLocation) &&
            (identical(other.referrerAvatarUrl, referrerAvatarUrl) ||
                other.referrerAvatarUrl == referrerAvatarUrl) &&
            (identical(other.referralId, referralId) ||
                other.referralId == referralId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.preferredPracticeArea, preferredPracticeArea) ||
                other.preferredPracticeArea == preferredPracticeArea) &&
            (identical(other.preferredPracticeLocation,
                    preferredPracticeLocation) ||
                other.preferredPracticeLocation == preferredPracticeLocation) &&
            (identical(other.caseDescription, caseDescription) ||
                other.caseDescription == caseDescription) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referrerUserId,
      referrerFirstName,
      referrerLastName,
      referrerPracticeArea,
      referrerPracticeLocation,
      referrerAvatarUrl,
      referralId,
      title,
      preferredPracticeArea,
      preferredPracticeLocation,
      caseDescription,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProposalImplCopyWith<_$ProposalImpl> get copyWith =>
      __$$ProposalImplCopyWithImpl<_$ProposalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProposalImplToJson(
      this,
    );
  }
}

abstract class _Proposal implements Proposal {
  const factory _Proposal(
      {@JsonKey(name: 'referrer_user_id') required final String? referrerUserId,
      @JsonKey(name: 'referrer_first_name')
      required final String? referrerFirstName,
      @JsonKey(name: 'referrer_last_name')
      required final String? referrerLastName,
      @JsonKey(name: 'referrer_practice_area')
      required final String? referrerPracticeArea,
      @JsonKey(name: 'referrer_practice_location')
      required final String? referrerPracticeLocation,
      @JsonKey(name: 'referrer_avatar_url')
      required final String? referrerAvatarUrl,
      @JsonKey(name: 'referral_id') required final int? referralId,
      required final String? title,
      @JsonKey(name: 'preferred_practice_area')
      required final String? preferredPracticeArea,
      @JsonKey(name: 'preferred_practice_location')
      required final String? preferredPracticeLocation,
      @JsonKey(name: 'case_description') required final String? caseDescription,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      required final DateTime? createdAt,
      @JsonKey(name: 'updated_at', includeToJson: false)
      @DateTimeJsonConverter()
      required final DateTime? updatedAt}) = _$ProposalImpl;

  factory _Proposal.fromJson(Map<String, dynamic> json) =
      _$ProposalImpl.fromJson;

  @override
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId;
  @override
  @JsonKey(name: 'referrer_first_name')
  String? get referrerFirstName;
  @override
  @JsonKey(name: 'referrer_last_name')
  String? get referrerLastName;
  @override
  @JsonKey(name: 'referrer_practice_area')
  String? get referrerPracticeArea;
  @override
  @JsonKey(name: 'referrer_practice_location')
  String? get referrerPracticeLocation;
  @override
  @JsonKey(name: 'referrer_avatar_url')
  String? get referrerAvatarUrl;
  @override
  @JsonKey(name: 'referral_id')
  int? get referralId;
  @override
  String? get title;
  @override
  @JsonKey(name: 'preferred_practice_area')
  String? get preferredPracticeArea;
  @override
  @JsonKey(name: 'preferred_practice_location')
  String? get preferredPracticeLocation;
  @override
  @JsonKey(name: 'case_description')
  String? get caseDescription;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProposalImplCopyWith<_$ProposalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
