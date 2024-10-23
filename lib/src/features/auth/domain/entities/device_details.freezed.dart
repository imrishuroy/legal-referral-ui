// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceDetails _$DeviceDetailsFromJson(Map<String, dynamic> json) {
  return _DeviceDetails.fromJson(json);
}

/// @nodoc
mixin _$DeviceDetails {
  @JsonKey(name: 'device_id')
  String? get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_token')
  String? get deviceToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this DeviceDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceDetailsCopyWith<DeviceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetailsCopyWith<$Res> {
  factory $DeviceDetailsCopyWith(
          DeviceDetails value, $Res Function(DeviceDetails) then) =
      _$DeviceDetailsCopyWithImpl<$Res, DeviceDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'device_id') String? deviceId,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class _$DeviceDetailsCopyWithImpl<$Res, $Val extends DeviceDetails>
    implements $DeviceDetailsCopyWith<$Res> {
  _$DeviceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? deviceToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceDetailsImplCopyWith<$Res>
    implements $DeviceDetailsCopyWith<$Res> {
  factory _$$DeviceDetailsImplCopyWith(
          _$DeviceDetailsImpl value, $Res Function(_$DeviceDetailsImpl) then) =
      __$$DeviceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'device_id') String? deviceId,
      @JsonKey(name: 'device_token') String? deviceToken,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class __$$DeviceDetailsImplCopyWithImpl<$Res>
    extends _$DeviceDetailsCopyWithImpl<$Res, _$DeviceDetailsImpl>
    implements _$$DeviceDetailsImplCopyWith<$Res> {
  __$$DeviceDetailsImplCopyWithImpl(
      _$DeviceDetailsImpl _value, $Res Function(_$DeviceDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? deviceToken = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$DeviceDetailsImpl(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceToken: freezed == deviceToken
          ? _value.deviceToken
          : deviceToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceDetailsImpl implements _DeviceDetails {
  const _$DeviceDetailsImpl(
      {@JsonKey(name: 'device_id') required this.deviceId,
      @JsonKey(name: 'device_token') required this.deviceToken,
      @JsonKey(name: 'user_id') required this.userId});

  factory _$DeviceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @override
  @JsonKey(name: 'device_token')
  final String? deviceToken;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;

  @override
  String toString() {
    return 'DeviceDetails(deviceId: $deviceId, deviceToken: $deviceToken, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDetailsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceToken, deviceToken) ||
                other.deviceToken == deviceToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceId, deviceToken, userId);

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDetailsImplCopyWith<_$DeviceDetailsImpl> get copyWith =>
      __$$DeviceDetailsImplCopyWithImpl<_$DeviceDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceDetailsImplToJson(
      this,
    );
  }
}

abstract class _DeviceDetails implements DeviceDetails {
  const factory _DeviceDetails(
          {@JsonKey(name: 'device_id') required final String? deviceId,
          @JsonKey(name: 'device_token') required final String? deviceToken,
          @JsonKey(name: 'user_id') required final String? userId}) =
      _$DeviceDetailsImpl;

  factory _DeviceDetails.fromJson(Map<String, dynamic> json) =
      _$DeviceDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'device_id')
  String? get deviceId;
  @override
  @JsonKey(name: 'device_token')
  String? get deviceToken;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;

  /// Create a copy of DeviceDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceDetailsImplCopyWith<_$DeviceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
