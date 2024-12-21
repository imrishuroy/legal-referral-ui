// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'connections_count')
  int get connectionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_area')
  String? get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'banner_url')
  String? get bannerUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_billing_per_client')
  int? get averageBillingPerClient => throw _privateConstructorUsedError;
  @JsonKey(name: 'case_resolution_rate')
  int? get caseResolutionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_to_referral')
  bool? get openToReferral => throw _privateConstructorUsedError;
  @JsonKey(name: 'about')
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_id')
  int? get priceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_hour_price')
  double? get perHourPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_hearing_price')
  double? get perHearingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'contingency_price')
  String? get contingencyPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'hybrid_price')
  String? get hybridPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_info')
  RatingInfo? get ratingInfo => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'connections_count') int connectionsCount,
      @JsonKey(name: 'service_type') PriceServiceType? serviceType,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'banner_url') String? bannerUrl,
      @JsonKey(name: 'average_billing_per_client') int? averageBillingPerClient,
      @JsonKey(name: 'case_resolution_rate') int? caseResolutionRate,
      @JsonKey(name: 'open_to_referral') bool? openToReferral,
      @JsonKey(name: 'about') String? about,
      @JsonKey(name: 'price_id') int? priceId,
      @JsonKey(name: 'per_hour_price') double? perHourPrice,
      @JsonKey(name: 'per_hearing_price') double? perHearingPrice,
      @JsonKey(name: 'contingency_price') String? contingencyPrice,
      @JsonKey(name: 'hybrid_price') String? hybridPrice,
      @JsonKey(name: 'rating_info') RatingInfo? ratingInfo});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followersCount = null,
    Object? connectionsCount = null,
    Object? serviceType = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? practiceArea = freezed,
    Object? avatarUrl = freezed,
    Object? bannerUrl = freezed,
    Object? averageBillingPerClient = freezed,
    Object? caseResolutionRate = freezed,
    Object? openToReferral = freezed,
    Object? about = freezed,
    Object? priceId = freezed,
    Object? perHourPrice = freezed,
    Object? perHearingPrice = freezed,
    Object? contingencyPrice = freezed,
    Object? hybridPrice = freezed,
    Object? ratingInfo = freezed,
  }) {
    return _then(_value.copyWith(
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      connectionsCount: null == connectionsCount
          ? _value.connectionsCount
          : connectionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _value.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _value.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      openToReferral: freezed == openToReferral
          ? _value.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      priceId: freezed == priceId
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      perHourPrice: freezed == perHourPrice
          ? _value.perHourPrice
          : perHourPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      perHearingPrice: freezed == perHearingPrice
          ? _value.perHearingPrice
          : perHearingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      contingencyPrice: freezed == contingencyPrice
          ? _value.contingencyPrice
          : contingencyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      hybridPrice: freezed == hybridPrice
          ? _value.hybridPrice
          : hybridPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingInfo: freezed == ratingInfo
          ? _value.ratingInfo
          : ratingInfo // ignore: cast_nullable_to_non_nullable
              as RatingInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'followers_count') int followersCount,
      @JsonKey(name: 'connections_count') int connectionsCount,
      @JsonKey(name: 'service_type') PriceServiceType? serviceType,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'banner_url') String? bannerUrl,
      @JsonKey(name: 'average_billing_per_client') int? averageBillingPerClient,
      @JsonKey(name: 'case_resolution_rate') int? caseResolutionRate,
      @JsonKey(name: 'open_to_referral') bool? openToReferral,
      @JsonKey(name: 'about') String? about,
      @JsonKey(name: 'price_id') int? priceId,
      @JsonKey(name: 'per_hour_price') double? perHourPrice,
      @JsonKey(name: 'per_hearing_price') double? perHearingPrice,
      @JsonKey(name: 'contingency_price') String? contingencyPrice,
      @JsonKey(name: 'hybrid_price') String? hybridPrice,
      @JsonKey(name: 'rating_info') RatingInfo? ratingInfo});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followersCount = null,
    Object? connectionsCount = null,
    Object? serviceType = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? practiceArea = freezed,
    Object? avatarUrl = freezed,
    Object? bannerUrl = freezed,
    Object? averageBillingPerClient = freezed,
    Object? caseResolutionRate = freezed,
    Object? openToReferral = freezed,
    Object? about = freezed,
    Object? priceId = freezed,
    Object? perHourPrice = freezed,
    Object? perHearingPrice = freezed,
    Object? contingencyPrice = freezed,
    Object? hybridPrice = freezed,
    Object? ratingInfo = freezed,
  }) {
    return _then(_$UserProfileImpl(
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      connectionsCount: null == connectionsCount
          ? _value.connectionsCount
          : connectionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _value.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _value.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      openToReferral: freezed == openToReferral
          ? _value.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      priceId: freezed == priceId
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      perHourPrice: freezed == perHourPrice
          ? _value.perHourPrice
          : perHourPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      perHearingPrice: freezed == perHearingPrice
          ? _value.perHearingPrice
          : perHearingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      contingencyPrice: freezed == contingencyPrice
          ? _value.contingencyPrice
          : contingencyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      hybridPrice: freezed == hybridPrice
          ? _value.hybridPrice
          : hybridPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingInfo: freezed == ratingInfo
          ? _value.ratingInfo
          : ratingInfo // ignore: cast_nullable_to_non_nullable
              as RatingInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {@JsonKey(name: 'followers_count') required this.followersCount,
      @JsonKey(name: 'connections_count') required this.connectionsCount,
      @JsonKey(name: 'service_type') this.serviceType,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'practice_area') this.practiceArea,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'banner_url') this.bannerUrl,
      @JsonKey(name: 'average_billing_per_client') this.averageBillingPerClient,
      @JsonKey(name: 'case_resolution_rate') this.caseResolutionRate,
      @JsonKey(name: 'open_to_referral') this.openToReferral,
      @JsonKey(name: 'about') this.about,
      @JsonKey(name: 'price_id') this.priceId,
      @JsonKey(name: 'per_hour_price') this.perHourPrice,
      @JsonKey(name: 'per_hearing_price') this.perHearingPrice,
      @JsonKey(name: 'contingency_price') this.contingencyPrice,
      @JsonKey(name: 'hybrid_price') this.hybridPrice,
      @JsonKey(name: 'rating_info') this.ratingInfo});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'connections_count')
  final int connectionsCount;
  @override
  @JsonKey(name: 'service_type')
  final PriceServiceType? serviceType;
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
  @JsonKey(name: 'practice_area')
  final String? practiceArea;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'banner_url')
  final String? bannerUrl;
  @override
  @JsonKey(name: 'average_billing_per_client')
  final int? averageBillingPerClient;
  @override
  @JsonKey(name: 'case_resolution_rate')
  final int? caseResolutionRate;
  @override
  @JsonKey(name: 'open_to_referral')
  final bool? openToReferral;
  @override
  @JsonKey(name: 'about')
  final String? about;
  @override
  @JsonKey(name: 'price_id')
  final int? priceId;
  @override
  @JsonKey(name: 'per_hour_price')
  final double? perHourPrice;
  @override
  @JsonKey(name: 'per_hearing_price')
  final double? perHearingPrice;
  @override
  @JsonKey(name: 'contingency_price')
  final String? contingencyPrice;
  @override
  @JsonKey(name: 'hybrid_price')
  final String? hybridPrice;
  @override
  @JsonKey(name: 'rating_info')
  final RatingInfo? ratingInfo;

  @override
  String toString() {
    return 'UserProfile(followersCount: $followersCount, connectionsCount: $connectionsCount, serviceType: $serviceType, userId: $userId, firstName: $firstName, lastName: $lastName, practiceArea: $practiceArea, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, averageBillingPerClient: $averageBillingPerClient, caseResolutionRate: $caseResolutionRate, openToReferral: $openToReferral, about: $about, priceId: $priceId, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice, ratingInfo: $ratingInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.connectionsCount, connectionsCount) ||
                other.connectionsCount == connectionsCount) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(
                    other.averageBillingPerClient, averageBillingPerClient) ||
                other.averageBillingPerClient == averageBillingPerClient) &&
            (identical(other.caseResolutionRate, caseResolutionRate) ||
                other.caseResolutionRate == caseResolutionRate) &&
            (identical(other.openToReferral, openToReferral) ||
                other.openToReferral == openToReferral) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.priceId, priceId) || other.priceId == priceId) &&
            (identical(other.perHourPrice, perHourPrice) ||
                other.perHourPrice == perHourPrice) &&
            (identical(other.perHearingPrice, perHearingPrice) ||
                other.perHearingPrice == perHearingPrice) &&
            (identical(other.contingencyPrice, contingencyPrice) ||
                other.contingencyPrice == contingencyPrice) &&
            (identical(other.hybridPrice, hybridPrice) ||
                other.hybridPrice == hybridPrice) &&
            (identical(other.ratingInfo, ratingInfo) ||
                other.ratingInfo == ratingInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        followersCount,
        connectionsCount,
        serviceType,
        userId,
        firstName,
        lastName,
        practiceArea,
        avatarUrl,
        bannerUrl,
        averageBillingPerClient,
        caseResolutionRate,
        openToReferral,
        about,
        priceId,
        perHourPrice,
        perHearingPrice,
        contingencyPrice,
        hybridPrice,
        ratingInfo
      ]);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {@JsonKey(name: 'followers_count') required final int followersCount,
      @JsonKey(name: 'connections_count') required final int connectionsCount,
      @JsonKey(name: 'service_type') final PriceServiceType? serviceType,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'practice_area') final String? practiceArea,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'banner_url') final String? bannerUrl,
      @JsonKey(name: 'average_billing_per_client')
      final int? averageBillingPerClient,
      @JsonKey(name: 'case_resolution_rate') final int? caseResolutionRate,
      @JsonKey(name: 'open_to_referral') final bool? openToReferral,
      @JsonKey(name: 'about') final String? about,
      @JsonKey(name: 'price_id') final int? priceId,
      @JsonKey(name: 'per_hour_price') final double? perHourPrice,
      @JsonKey(name: 'per_hearing_price') final double? perHearingPrice,
      @JsonKey(name: 'contingency_price') final String? contingencyPrice,
      @JsonKey(name: 'hybrid_price') final String? hybridPrice,
      @JsonKey(name: 'rating_info')
      final RatingInfo? ratingInfo}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @JsonKey(name: 'connections_count')
  int get connectionsCount;
  @override
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType;
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
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'banner_url')
  String? get bannerUrl;
  @override
  @JsonKey(name: 'average_billing_per_client')
  int? get averageBillingPerClient;
  @override
  @JsonKey(name: 'case_resolution_rate')
  int? get caseResolutionRate;
  @override
  @JsonKey(name: 'open_to_referral')
  bool? get openToReferral;
  @override
  @JsonKey(name: 'about')
  String? get about;
  @override
  @JsonKey(name: 'price_id')
  int? get priceId;
  @override
  @JsonKey(name: 'per_hour_price')
  double? get perHourPrice;
  @override
  @JsonKey(name: 'per_hearing_price')
  double? get perHearingPrice;
  @override
  @JsonKey(name: 'contingency_price')
  String? get contingencyPrice;
  @override
  @JsonKey(name: 'hybrid_price')
  String? get hybridPrice;
  @override
  @JsonKey(name: 'rating_info')
  RatingInfo? get ratingInfo;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
