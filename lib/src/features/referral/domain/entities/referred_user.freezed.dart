// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referred_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferedUser {
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation;
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
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

  /// Create a copy of ReferedUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReferedUserCopyWith<ReferedUser> get copyWith =>
      _$ReferedUserCopyWithImpl<ReferedUser>(this as ReferedUser, _$identity);

  /// Serializes this ReferedUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReferedUser &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.priceId, priceId) || other.priceId == priceId) &&
            (identical(other.perHourPrice, perHourPrice) ||
                other.perHourPrice == perHourPrice) &&
            (identical(other.perHearingPrice, perHearingPrice) ||
                other.perHearingPrice == perHearingPrice) &&
            (identical(other.contingencyPrice, contingencyPrice) ||
                other.contingencyPrice == contingencyPrice) &&
            (identical(other.hybridPrice, hybridPrice) ||
                other.hybridPrice == hybridPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceType,
      userId,
      firstName,
      lastName,
      avatarUrl,
      practiceLocation,
      practiceArea,
      priceId,
      perHourPrice,
      perHearingPrice,
      contingencyPrice,
      hybridPrice);

  @override
  String toString() {
    return 'ReferedUser(serviceType: $serviceType, userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, practiceLocation: $practiceLocation, practiceArea: $practiceArea, priceId: $priceId, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice)';
  }
}

/// @nodoc
abstract mixin class $ReferedUserCopyWith<$Res> {
  factory $ReferedUserCopyWith(
          ReferedUser value, $Res Function(ReferedUser) _then) =
      _$ReferedUserCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'service_type') PriceServiceType? serviceType,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'price_id') int? priceId,
      @JsonKey(name: 'per_hour_price') double? perHourPrice,
      @JsonKey(name: 'per_hearing_price') double? perHearingPrice,
      @JsonKey(name: 'contingency_price') String? contingencyPrice,
      @JsonKey(name: 'hybrid_price') String? hybridPrice});
}

/// @nodoc
class _$ReferedUserCopyWithImpl<$Res> implements $ReferedUserCopyWith<$Res> {
  _$ReferedUserCopyWithImpl(this._self, this._then);

  final ReferedUser _self;
  final $Res Function(ReferedUser) _then;

  /// Create a copy of ReferedUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceType = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatarUrl = freezed,
    Object? practiceLocation = freezed,
    Object? practiceArea = freezed,
    Object? priceId = freezed,
    Object? perHourPrice = freezed,
    Object? perHearingPrice = freezed,
    Object? contingencyPrice = freezed,
    Object? hybridPrice = freezed,
  }) {
    return _then(_self.copyWith(
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
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReferedUser implements ReferedUser {
  const _ReferedUser(
      {@JsonKey(name: 'service_type') this.serviceType,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'practice_location') this.practiceLocation,
      @JsonKey(name: 'practice_area') this.practiceArea,
      @JsonKey(name: 'price_id') this.priceId,
      @JsonKey(name: 'per_hour_price') this.perHourPrice,
      @JsonKey(name: 'per_hearing_price') this.perHearingPrice,
      @JsonKey(name: 'contingency_price') this.contingencyPrice,
      @JsonKey(name: 'hybrid_price') this.hybridPrice});
  factory _ReferedUser.fromJson(Map<String, dynamic> json) =>
      _$ReferedUserFromJson(json);

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
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'practice_location')
  final String? practiceLocation;
  @override
  @JsonKey(name: 'practice_area')
  final String? practiceArea;
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

  /// Create a copy of ReferedUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReferedUserCopyWith<_ReferedUser> get copyWith =>
      __$ReferedUserCopyWithImpl<_ReferedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReferedUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReferedUser &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.priceId, priceId) || other.priceId == priceId) &&
            (identical(other.perHourPrice, perHourPrice) ||
                other.perHourPrice == perHourPrice) &&
            (identical(other.perHearingPrice, perHearingPrice) ||
                other.perHearingPrice == perHearingPrice) &&
            (identical(other.contingencyPrice, contingencyPrice) ||
                other.contingencyPrice == contingencyPrice) &&
            (identical(other.hybridPrice, hybridPrice) ||
                other.hybridPrice == hybridPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      serviceType,
      userId,
      firstName,
      lastName,
      avatarUrl,
      practiceLocation,
      practiceArea,
      priceId,
      perHourPrice,
      perHearingPrice,
      contingencyPrice,
      hybridPrice);

  @override
  String toString() {
    return 'ReferedUser(serviceType: $serviceType, userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, practiceLocation: $practiceLocation, practiceArea: $practiceArea, priceId: $priceId, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice)';
  }
}

/// @nodoc
abstract mixin class _$ReferedUserCopyWith<$Res>
    implements $ReferedUserCopyWith<$Res> {
  factory _$ReferedUserCopyWith(
          _ReferedUser value, $Res Function(_ReferedUser) _then) =
      __$ReferedUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service_type') PriceServiceType? serviceType,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'price_id') int? priceId,
      @JsonKey(name: 'per_hour_price') double? perHourPrice,
      @JsonKey(name: 'per_hearing_price') double? perHearingPrice,
      @JsonKey(name: 'contingency_price') String? contingencyPrice,
      @JsonKey(name: 'hybrid_price') String? hybridPrice});
}

/// @nodoc
class __$ReferedUserCopyWithImpl<$Res> implements _$ReferedUserCopyWith<$Res> {
  __$ReferedUserCopyWithImpl(this._self, this._then);

  final _ReferedUser _self;
  final $Res Function(_ReferedUser) _then;

  /// Create a copy of ReferedUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatarUrl = freezed,
    Object? practiceLocation = freezed,
    Object? practiceArea = freezed,
    Object? priceId = freezed,
    Object? perHourPrice = freezed,
    Object? perHearingPrice = freezed,
    Object? contingencyPrice = freezed,
    Object? hybridPrice = freezed,
  }) {
    return _then(_ReferedUser(
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
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

// dart format on
