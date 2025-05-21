// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @JsonKey(name: 'connections_count')
  int get connectionsCount;
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'banner_url')
  String? get bannerUrl;
  @JsonKey(name: 'average_billing_per_client')
  int? get averageBillingPerClient;
  @JsonKey(name: 'case_resolution_rate')
  int? get caseResolutionRate;
  @JsonKey(name: 'open_to_referral')
  bool? get openToReferral;
  @JsonKey(name: 'about')
  String? get about;
  @JsonKey(name: 'price_id')
  int? get priceId;
  @JsonKey(name: 'per_hour_price')
  double? get perHourPrice;
  @JsonKey(name: 'per_hearing_price')
  double? get perHearingPrice;
  @JsonKey(name: 'contingency_price')
  String? get contingencyPrice;
  @JsonKey(name: 'hybrid_price')
  String? get hybridPrice;
  @JsonKey(name: 'rating_info')
  RatingInfo? get ratingInfo;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<UserProfile> get copyWith =>
      _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfile &&
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

  @override
  String toString() {
    return 'UserProfile(followersCount: $followersCount, connectionsCount: $connectionsCount, serviceType: $serviceType, userId: $userId, firstName: $firstName, lastName: $lastName, practiceArea: $practiceArea, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, averageBillingPerClient: $averageBillingPerClient, caseResolutionRate: $caseResolutionRate, openToReferral: $openToReferral, about: $about, priceId: $priceId, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice, ratingInfo: $ratingInfo)';
  }
}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) _then) =
      _$UserProfileCopyWithImpl;
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
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

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
    return _then(_self.copyWith(
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      connectionsCount: null == connectionsCount
          ? _self.connectionsCount
          : connectionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _self.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _self.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _self.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      openToReferral: freezed == openToReferral
          ? _self.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      priceId: freezed == priceId
          ? _self.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      perHourPrice: freezed == perHourPrice
          ? _self.perHourPrice
          : perHourPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      perHearingPrice: freezed == perHearingPrice
          ? _self.perHearingPrice
          : perHearingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      contingencyPrice: freezed == contingencyPrice
          ? _self.contingencyPrice
          : contingencyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      hybridPrice: freezed == hybridPrice
          ? _self.hybridPrice
          : hybridPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingInfo: freezed == ratingInfo
          ? _self.ratingInfo
          : ratingInfo // ignore: cast_nullable_to_non_nullable
              as RatingInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfile implements UserProfile {
  const _UserProfile(
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
  factory _UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

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

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
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

  @override
  String toString() {
    return 'UserProfile(followersCount: $followersCount, connectionsCount: $connectionsCount, serviceType: $serviceType, userId: $userId, firstName: $firstName, lastName: $lastName, practiceArea: $practiceArea, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, averageBillingPerClient: $averageBillingPerClient, caseResolutionRate: $caseResolutionRate, openToReferral: $openToReferral, about: $about, priceId: $priceId, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice, ratingInfo: $ratingInfo)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) _then) =
      __$UserProfileCopyWithImpl;
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
class __$UserProfileCopyWithImpl<$Res> implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_UserProfile(
      followersCount: null == followersCount
          ? _self.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      connectionsCount: null == connectionsCount
          ? _self.connectionsCount
          : connectionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _self.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _self.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _self.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      openToReferral: freezed == openToReferral
          ? _self.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      priceId: freezed == priceId
          ? _self.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      perHourPrice: freezed == perHourPrice
          ? _self.perHourPrice
          : perHourPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      perHearingPrice: freezed == perHearingPrice
          ? _self.perHearingPrice
          : perHearingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      contingencyPrice: freezed == contingencyPrice
          ? _self.contingencyPrice
          : contingencyPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      hybridPrice: freezed == hybridPrice
          ? _self.hybridPrice
          : hybridPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      ratingInfo: freezed == ratingInfo
          ? _self.ratingInfo
          : ratingInfo // ignore: cast_nullable_to_non_nullable
              as RatingInfo?,
    ));
  }
}

// dart format on
