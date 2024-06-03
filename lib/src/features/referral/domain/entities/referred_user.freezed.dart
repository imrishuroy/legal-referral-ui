// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referred_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReferedUser _$ReferedUserFromJson(Map<String, dynamic> json) {
  return _ReferedUser.fromJson(json);
}

/// @nodoc
mixin _$ReferedUser {
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_area')
  String? get practiceArea => throw _privateConstructorUsedError;
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferedUserCopyWith<ReferedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferedUserCopyWith<$Res> {
  factory $ReferedUserCopyWith(
          ReferedUser value, $Res Function(ReferedUser) then) =
      _$ReferedUserCopyWithImpl<$Res, ReferedUser>;
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
class _$ReferedUserCopyWithImpl<$Res, $Val extends ReferedUser>
    implements $ReferedUserCopyWith<$Res> {
  _$ReferedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
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
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferedUserImplCopyWith<$Res>
    implements $ReferedUserCopyWith<$Res> {
  factory _$$ReferedUserImplCopyWith(
          _$ReferedUserImpl value, $Res Function(_$ReferedUserImpl) then) =
      __$$ReferedUserImplCopyWithImpl<$Res>;
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
class __$$ReferedUserImplCopyWithImpl<$Res>
    extends _$ReferedUserCopyWithImpl<$Res, _$ReferedUserImpl>
    implements _$$ReferedUserImplCopyWith<$Res> {
  __$$ReferedUserImplCopyWithImpl(
      _$ReferedUserImpl _value, $Res Function(_$ReferedUserImpl) _then)
      : super(_value, _then);

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
    return _then(_$ReferedUserImpl(
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
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferedUserImpl implements _ReferedUser {
  const _$ReferedUserImpl(
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

  factory _$ReferedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferedUserImplFromJson(json);

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

  @override
  String toString() {
    return 'ReferedUser(serviceType: $serviceType, userId: $userId, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, practiceLocation: $practiceLocation, practiceArea: $practiceArea, priceId: $priceId, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferedUserImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferedUserImplCopyWith<_$ReferedUserImpl> get copyWith =>
      __$$ReferedUserImplCopyWithImpl<_$ReferedUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferedUserImplToJson(
      this,
    );
  }
}

abstract class _ReferedUser implements ReferedUser {
  const factory _ReferedUser(
          {@JsonKey(name: 'service_type') final PriceServiceType? serviceType,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'avatar_url') final String? avatarUrl,
          @JsonKey(name: 'practice_location') final String? practiceLocation,
          @JsonKey(name: 'practice_area') final String? practiceArea,
          @JsonKey(name: 'price_id') final int? priceId,
          @JsonKey(name: 'per_hour_price') final double? perHourPrice,
          @JsonKey(name: 'per_hearing_price') final double? perHearingPrice,
          @JsonKey(name: 'contingency_price') final String? contingencyPrice,
          @JsonKey(name: 'hybrid_price') final String? hybridPrice}) =
      _$ReferedUserImpl;

  factory _ReferedUser.fromJson(Map<String, dynamic> json) =
      _$ReferedUserImpl.fromJson;

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
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'practice_location')
  String? get practiceLocation;
  @override
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
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
  @JsonKey(ignore: true)
  _$$ReferedUserImplCopyWith<_$ReferedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
