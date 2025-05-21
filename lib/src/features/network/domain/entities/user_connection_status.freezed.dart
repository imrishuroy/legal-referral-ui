// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_connection_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserConnectionStatus {
  ConnectionInvitationStatus get status;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserConnectionStatusCopyWith<UserConnectionStatus> get copyWith =>
      _$UserConnectionStatusCopyWithImpl<UserConnectionStatus>(
          this as UserConnectionStatus, _$identity);

  /// Serializes this UserConnectionStatus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserConnectionStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'UserConnectionStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class $UserConnectionStatusCopyWith<$Res> {
  factory $UserConnectionStatusCopyWith(UserConnectionStatus value,
          $Res Function(UserConnectionStatus) _then) =
      _$UserConnectionStatusCopyWithImpl;
  @useResult
  $Res call({ConnectionInvitationStatus status});
}

/// @nodoc
class _$UserConnectionStatusCopyWithImpl<$Res>
    implements $UserConnectionStatusCopyWith<$Res> {
  _$UserConnectionStatusCopyWithImpl(this._self, this._then);

  final UserConnectionStatus _self;
  final $Res Function(UserConnectionStatus) _then;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserConnectionStatus implements UserConnectionStatus {
  const _UserConnectionStatus({required this.status});
  factory _UserConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$UserConnectionStatusFromJson(json);

  @override
  final ConnectionInvitationStatus status;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserConnectionStatusCopyWith<_UserConnectionStatus> get copyWith =>
      __$UserConnectionStatusCopyWithImpl<_UserConnectionStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserConnectionStatusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserConnectionStatus &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'UserConnectionStatus(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$UserConnectionStatusCopyWith<$Res>
    implements $UserConnectionStatusCopyWith<$Res> {
  factory _$UserConnectionStatusCopyWith(_UserConnectionStatus value,
          $Res Function(_UserConnectionStatus) _then) =
      __$UserConnectionStatusCopyWithImpl;
  @override
  @useResult
  $Res call({ConnectionInvitationStatus status});
}

/// @nodoc
class __$UserConnectionStatusCopyWithImpl<$Res>
    implements _$UserConnectionStatusCopyWith<$Res> {
  __$UserConnectionStatusCopyWithImpl(this._self, this._then);

  final _UserConnectionStatus _self;
  final $Res Function(_UserConnectionStatus) _then;

  /// Create a copy of UserConnectionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_UserConnectionStatus(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionInvitationStatus,
    ));
  }
}

// dart format on
