// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Price _$PriceFromJson(Map<String, dynamic> json) {
  return _Price.fromJson(json);
}

/// @nodoc
mixin _$Price {
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_hour_price', includeIfNull: false)
  double? get perHourPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_hearing_price', includeIfNull: false)
  double? get perHearingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'contingency_price', includeIfNull: false)
  String? get contingencyPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'hybrid_price', includeIfNull: false)
  String? get hybridPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_id', includeToJson: false)
  int? get priceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res, Price>;
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
class _$PriceCopyWithImpl<$Res, $Val extends Price>
    implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      priceId: freezed == priceId
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceImplCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$$PriceImplCopyWith(
          _$PriceImpl value, $Res Function(_$PriceImpl) then) =
      __$$PriceImplCopyWithImpl<$Res>;
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
class __$$PriceImplCopyWithImpl<$Res>
    extends _$PriceCopyWithImpl<$Res, _$PriceImpl>
    implements _$$PriceImplCopyWith<$Res> {
  __$$PriceImplCopyWithImpl(
      _$PriceImpl _value, $Res Function(_$PriceImpl) _then)
      : super(_value, _then);

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
    return _then(_$PriceImpl(
      serviceType: freezed == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as PriceServiceType?,
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
      priceId: freezed == priceId
          ? _value.priceId
          : priceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceImpl implements _Price {
  const _$PriceImpl(
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

  factory _$PriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceImplFromJson(json);

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

  @override
  String toString() {
    return 'Price(serviceType: $serviceType, perHourPrice: $perHourPrice, perHearingPrice: $perHearingPrice, contingencyPrice: $contingencyPrice, hybridPrice: $hybridPrice, priceId: $priceId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceType, perHourPrice,
      perHearingPrice, contingencyPrice, hybridPrice, priceId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      __$$PriceImplCopyWithImpl<_$PriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceImplToJson(
      this,
    );
  }
}

abstract class _Price implements Price {
  const factory _Price(
      {@JsonKey(name: 'service_type')
      required final PriceServiceType? serviceType,
      @JsonKey(name: 'per_hour_price', includeIfNull: false)
      final double? perHourPrice,
      @JsonKey(name: 'per_hearing_price', includeIfNull: false)
      final double? perHearingPrice,
      @JsonKey(name: 'contingency_price', includeIfNull: false)
      final String? contingencyPrice,
      @JsonKey(name: 'hybrid_price', includeIfNull: false)
      final String? hybridPrice,
      @JsonKey(name: 'price_id', includeToJson: false) final int? priceId,
      @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
      final String? userId}) = _$PriceImpl;

  factory _Price.fromJson(Map<String, dynamic> json) = _$PriceImpl.fromJson;

  @override
  @JsonKey(name: 'service_type')
  PriceServiceType? get serviceType;
  @override
  @JsonKey(name: 'per_hour_price', includeIfNull: false)
  double? get perHourPrice;
  @override
  @JsonKey(name: 'per_hearing_price', includeIfNull: false)
  double? get perHearingPrice;
  @override
  @JsonKey(name: 'contingency_price', includeIfNull: false)
  String? get contingencyPrice;
  @override
  @JsonKey(name: 'hybrid_price', includeIfNull: false)
  String? get hybridPrice;
  @override
  @JsonKey(name: 'price_id', includeToJson: false)
  int? get priceId;
  @override
  @JsonKey(name: 'user_id', includeToJson: false, includeIfNull: false)
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$PriceImplCopyWith<_$PriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
