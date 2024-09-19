// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_connection_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserConnectionStatus _$UserConnectionStatusFromJson(Map<String, dynamic> json) {
  return _UserConnectionStatus.fromJson(json);
}

/// @nodoc
mixin _$UserConnectionStatus {
  ConnectionInvitationStatus get status => throw _privateConstructorUsedError;

  /// Serializes this UserConnectionStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserConnectionStatusCopyWith<UserConnectionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserConnectionStatusCopyWith<$Res> {
  factory $UserConnectionStatusCopyWith(UserConnectionStatus value,
          $Res Function(UserConnectionStatus) then) =
      _$UserConnectionStatusCopyWithImpl<$Res, UserConnectionStatus>;
  @useResult
  $Res call({ConnectionInvitationStatus status});
}

/// @nodoc
class _$UserConnectionStatusCopyWithImpl<$Res,
        $Val extends UserConnectionStatus>
    implements $UserConnectionStatusCopyWith<$Res> {
  _$UserConnectionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserConnectionStatusImplCopyWith<$Res>
    implements $UserConnectionStatusCopyWith<$Res> {
  factory _$$UserConnectionStatusImplCopyWith(_$UserConnectionStatusImpl value,
          $Res Function(_$UserConnectionStatusImpl) then) =
      __$$UserConnectionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConnectionInvitationStatus status});
}

/// @nodoc
class __$$UserConnectionStatusImplCopyWithImpl<$Res>
    extends _$UserConnectionStatusCopyWithImpl<$Res, _$UserConnectionStatusImpl>
    implements _$$UserConnectionStatusImplCopyWith<$Res> {
  __$$UserConnectionStatusImplCopyWithImpl(_$UserConnectionStatusImpl _value,
      $Res Function(_$UserConnectionStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$UserConnectionStatusImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserConnectionStatusImpl implements _UserConnectionStatus {
  const _$UserConnectionStatusImpl({required this.status});

  factory _$UserConnectionStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserConnectionStatusImplFromJson(json);

  @override
  final ConnectionInvitationStatus status;

  @override
  String toString() {
    return 'UserConnectionStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserConnectionStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserConnectionStatusImplCopyWith<_$UserConnectionStatusImpl>
      get copyWith =>
          __$$UserConnectionStatusImplCopyWithImpl<_$UserConnectionStatusImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserConnectionStatusImplToJson(
      this,
    );
  }
}

abstract class _UserConnectionStatus implements UserConnectionStatus {
  const factory _UserConnectionStatus(
          {required final ConnectionInvitationStatus status}) =
      _$UserConnectionStatusImpl;

  factory _UserConnectionStatus.fromJson(Map<String, dynamic> json) =
      _$UserConnectionStatusImpl.fromJson;

  @override
  ConnectionInvitationStatus get status;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserConnectionStatusImplCopyWith<_$UserConnectionStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}
