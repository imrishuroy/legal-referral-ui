// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceDetails {
  @JsonKey(name: 'device_id')
  String? get deviceId;
  @JsonKey(name: 'device_token')
  String? get deviceToken;
  @JsonKey(name: 'user_id')
  String? get userId;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeviceDetailsCopyWith<DeviceDetails> get copyWith =>
      _$DeviceDetailsCopyWithImpl<DeviceDetails>(
          this as DeviceDetails, _$identity);

  /// Serializes this DeviceDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeviceDetails &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, deviceToken, userId);

  @override
  String toString() {
    return 'DeviceDetails(deviceId: $deviceId, deviceToken: $deviceToken, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $DeviceDetailsCopyWith<$Res> {
  factory $DeviceDetailsCopyWith(
          DeviceDetails value, $Res Function(DeviceDetails) _then) =
      _$DeviceDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'device_id') String? deviceId,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class _$DeviceDetailsCopyWithImpl<$Res>
    implements $DeviceDetailsCopyWith<$Res> {
  _$DeviceDetailsCopyWithImpl(this._self, this._then);

  final DeviceDetails _self;
  final $Res Function(DeviceDetails) _then;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? deviceToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_self.copyWith(
      deviceId: freezed == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _self.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeviceDetails implements DeviceDetails {
  const _DeviceDetails(
      {@JsonKey(name: 'device_id') required this.deviceId,
      @JsonKey(name: 'device_token') required this.deviceToken,
      @JsonKey(name: 'user_id') required this.userId});
  factory _DeviceDetails.fromJson(Map<String, dynamic> json) =>
      _$DeviceDetailsFromJson(json);

  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @override
  @JsonKey(name: 'device_token')
  final String? deviceToken;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeviceDetailsCopyWith<_DeviceDetails> get copyWith =>
      __$DeviceDetailsCopyWithImpl<_DeviceDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeviceDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceDetails &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, deviceToken, userId);

  @override
  String toString() {
    return 'DeviceDetails(deviceId: $deviceId, deviceToken: $deviceToken, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$DeviceDetailsCopyWith<$Res>
    implements $DeviceDetailsCopyWith<$Res> {
  factory _$DeviceDetailsCopyWith(
          _DeviceDetails value, $Res Function(_DeviceDetails) _then) =
      __$DeviceDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'device_id') String? deviceId,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class __$DeviceDetailsCopyWithImpl<$Res>
    implements _$DeviceDetailsCopyWith<$Res> {
  __$DeviceDetailsCopyWithImpl(this._self, this._then);

  final _DeviceDetails _self;
  final $Res Function(_DeviceDetails) _then;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? deviceId = freezed,
    Object? deviceToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_DeviceDetails(
      deviceId: freezed == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _self.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
