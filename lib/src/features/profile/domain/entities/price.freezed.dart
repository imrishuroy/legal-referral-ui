// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Price {
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType;
  @JsonKey(name: 'per_hour_price', includeIfNull: false)
  double? get perHourPrice;
  @JsonKey(name: 'per_hearing_price', includeIfNull: false)
  double? get perHearingPrice;
  @JsonKey(name: 'contingency_price', includeIfNull: false)
  String? get contingencyPrice;
  @JsonKey(name: 'hybrid_price', includeIfNull: false)
  String? get hybridPrice;
  @JsonKey(name: 'price_id', includeToJson: false)
  int? get priceId;
  @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
  String? get userId;

  /// Create a copy of Price
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PriceCopyWith<Price> get copyWith =>
      _$PriceCopyWithImpl<Price>(this as Price, _$identity);

  /// Serializes this Price to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Price &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.perHourPrice, perHourPrice) ||
                other.perHourPrice == perHourPrice) &&
            (identical(other.perHearingPrice, perHearingPrice) ||
                other.perHearingPrice == perHearingPrice) &&
            (identical(other.contingencyPrice, contingencyPrice) ||
                other.contingencyPrice == contingencyPrice) &&
            (identical(other.hybridPrice, hybridPrice) ||
                other.hybridPrice == hybridPrice) &&
            (identical(other.priceId, priceId) || other.priceId == priceId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceType, perHourPrice,
      perHearingPrice, contingencyPrice, hybridPrice, priceId, userId);

  @override
  String toString() {
    return 'Price(serviceType: $serviceType, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice, priceId: $priceId, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) _then) =
      _$PriceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'service_type') PriceServiceType? serviceType,
      @JsonKey(name: 'per_hour_price', includeIfNull: false)
      double? perHourPrice,
      @JsonKey(name: 'per_hearing_price', includeIfNull: false)
      double? perHearingPrice,
      @JsonKey(name: 'contingency_price', includeIfNull: false)
      String? contingencyPrice,
      @JsonKey(name: 'hybrid_price', includeIfNull: false) String? hybridPrice,
      @JsonKey(name: 'price_id', includeToJson: false) int? priceId,
      @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
      String? userId});
}

/// @nodoc
class _$PriceCopyWithImpl<$Res> implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._self, this._then);

  final Price _self;
  final $Res Function(Price) _then;

  /// Create a copy of Price
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceType = freezed,
    Object? perHourPrice = freezed,
    Object? perHearingPrice = freezed,
    Object? contingencyPrice = freezed,
    Object? hybridPrice = freezed,
    Object? priceId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_self.copyWith(
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      priceId: freezed == priceId
          ? _self.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Price implements Price {
  const _Price(
      {@JsonKey(name: 'service_type') required this.serviceType,
      @JsonKey(name: 'per_hour_price', includeIfNull: false) this.perHourPrice,
      @JsonKey(name: 'per_hearing_price', includeIfNull: false)
      this.perHearingPrice,
      @JsonKey(name: 'contingency_price', includeIfNull: false)
      this.contingencyPrice,
      @JsonKey(name: 'hybrid_price', includeIfNull: false) this.hybridPrice,
      @JsonKey(name: 'price_id', includeToJson: false) this.priceId,
      @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
      this.userId});
  factory _Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  @override
  @JsonKey(name: 'service_type')
  final PriceServiceType? serviceType;
  @override
  @JsonKey(name: 'per_hour_price', includeIfNull: false)
  final double? perHourPrice;
  @override
  @JsonKey(name: 'per_hearing_price', includeIfNull: false)
  final double? perHearingPrice;
  @override
  @JsonKey(name: 'contingency_price', includeIfNull: false)
  final String? contingencyPrice;
  @override
  @JsonKey(name: 'hybrid_price', includeIfNull: false)
  final String? hybridPrice;
  @override
  @JsonKey(name: 'price_id', includeToJson: false)
  final int? priceId;
  @override
  @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
  final String? userId;

  /// Create a copy of Price
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PriceCopyWith<_Price> get copyWith =>
      __$PriceCopyWithImpl<_Price>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PriceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Price &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.perHourPrice, perHourPrice) ||
                other.perHourPrice == perHourPrice) &&
            (identical(other.perHearingPrice, perHearingPrice) ||
                other.perHearingPrice == perHearingPrice) &&
            (identical(other.contingencyPrice, contingencyPrice) ||
                other.contingencyPrice == contingencyPrice) &&
            (identical(other.hybridPrice, hybridPrice) ||
                other.hybridPrice == hybridPrice) &&
            (identical(other.priceId, priceId) || other.priceId == priceId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serviceType, perHourPrice,
      perHearingPrice, contingencyPrice, hybridPrice, priceId, userId);

  @override
  String toString() {
    return 'Price(serviceType: $serviceType, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice, priceId: $priceId, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$PriceCopyWith(_Price value, $Res Function(_Price) _then) =
      __$PriceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service_type') PriceServiceType? serviceType,
      @JsonKey(name: 'per_hour_price', includeIfNull: false)
      double? perHourPrice,
      @JsonKey(name: 'per_hearing_price', includeIfNull: false)
      double? perHearingPrice,
      @JsonKey(name: 'contingency_price', includeIfNull: false)
      String? contingencyPrice,
      @JsonKey(name: 'hybrid_price', includeIfNull: false) String? hybridPrice,
      @JsonKey(name: 'price_id', includeToJson: false) int? priceId,
      @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
      String? userId});
}

/// @nodoc
class __$PriceCopyWithImpl<$Res> implements _$PriceCopyWith<$Res> {
  __$PriceCopyWithImpl(this._self, this._then);

  final _Price _self;
  final $Res Function(_Price) _then;

  /// Create a copy of Price
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serviceType = freezed,
    Object? perHourPrice = freezed,
    Object? perHearingPrice = freezed,
    Object? contingencyPrice = freezed,
    Object? hybridPrice = freezed,
    Object? priceId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_Price(
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      priceId: freezed == priceId
          ? _self.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
