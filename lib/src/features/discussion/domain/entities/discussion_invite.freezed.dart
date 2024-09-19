// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscussionInvite _$DiscussionInviteFromJson(Map<String, dynamic> json) {
  return _DiscussionInvite.fromJson(json);
}

/// @nodoc
mixin _$DiscussionInvite {
  @JsonKey(name: 'discussion_invite_id')
  int get discussionInviteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  int get discussionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  DiscussionInviteStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'invitee_user_id')
  String? get inviteeUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invited_user_id')
  String? get invitedUserId => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DiscussionInvite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiscussionInviteCopyWith<DiscussionInvite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionInviteCopyWith<$Res> {
  factory $DiscussionInviteCopyWith(
          DiscussionInvite value, $Res Function(DiscussionInvite) then) =
      _$DiscussionInviteCopyWithImpl<$Res, DiscussionInvite>;
  @useResult
  $Res call(
      {@JsonKey(name: 'discussion_invite_id') int discussionInviteId,
      @JsonKey(name: 'discussion_id', includeIfNull: false) int discussionId,
      @JsonKey(name: 'status') DiscussionInviteStatus status,
      @JsonKey(name: 'invitee_user_id') String? inviteeUserId,
      @JsonKey(name: 'invited_user_id') String? invitedUserId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      DateTime? createdAt});
}

/// @nodoc
class _$DiscussionInviteCopyWithImpl<$Res, $Val extends DiscussionInvite>
    implements $DiscussionInviteCopyWith<$Res> {
  _$DiscussionInviteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionInviteId = null,
    Object? discussionId = null,
    Object? status = null,
    Object? inviteeUserId = freezed,
    Object? invitedUserId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      discussionInviteId: null == discussionInviteId
          ? _value.discussionInviteId
          : discussionInviteId // ignore: cast_nullable_to_non_nullable
              as int,
      discussionId: null == discussionId
          ? _value.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiscussionInviteStatus,
      inviteeUserId: freezed == inviteeUserId
          ? _value.inviteeUserId
          : inviteeUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedUserId: freezed == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscussionInviteImplCopyWith<$Res>
    implements $DiscussionInviteCopyWith<$Res> {
  factory _$$DiscussionInviteImplCopyWith(_$DiscussionInviteImpl value,
          $Res Function(_$DiscussionInviteImpl) then) =
      __$$DiscussionInviteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'discussion_invite_id') int discussionInviteId,
      @JsonKey(name: 'discussion_id', includeIfNull: false) int discussionId,
      @JsonKey(name: 'status') DiscussionInviteStatus status,
      @JsonKey(name: 'invitee_user_id') String? inviteeUserId,
      @JsonKey(name: 'invited_user_id') String? invitedUserId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      DateTime? createdAt});
}

/// @nodoc
class __$$DiscussionInviteImplCopyWithImpl<$Res>
    extends _$DiscussionInviteCopyWithImpl<$Res, _$DiscussionInviteImpl>
    implements _$$DiscussionInviteImplCopyWith<$Res> {
  __$$DiscussionInviteImplCopyWithImpl(_$DiscussionInviteImpl _value,
      $Res Function(_$DiscussionInviteImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionInviteId = null,
    Object? discussionId = null,
    Object? status = null,
    Object? inviteeUserId = freezed,
    Object? invitedUserId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$DiscussionInviteImpl(
      discussionInviteId: null == discussionInviteId
          ? _value.discussionInviteId
          : discussionInviteId // ignore: cast_nullable_to_non_nullable
              as int,
      discussionId: null == discussionId
          ? _value.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiscussionInviteStatus,
      inviteeUserId: freezed == inviteeUserId
          ? _value.inviteeUserId
          : inviteeUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedUserId: freezed == invitedUserId
          ? _value.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscussionInviteImpl implements _DiscussionInvite {
  _$DiscussionInviteImpl(
      {@JsonKey(name: 'discussion_invite_id') required this.discussionInviteId,
      @JsonKey(name: 'discussion_id', includeIfNull: false)
      required this.discussionId,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'invitee_user_id') this.inviteeUserId,
      @JsonKey(name: 'invited_user_id') this.invitedUserId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      this.createdAt});

  factory _$DiscussionInviteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscussionInviteImplFromJson(json);

  @override
  @JsonKey(name: 'discussion_invite_id')
  final int discussionInviteId;
  @override
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  final int discussionId;
  @override
  @JsonKey(name: 'status')
  final DiscussionInviteStatus status;
  @override
  @JsonKey(name: 'invitee_user_id')
  final String? inviteeUserId;
  @override
  @JsonKey(name: 'invited_user_id')
  final String? invitedUserId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DiscussionInvite(discussionInviteId: $discussionInviteId, discussionId: $discussionId, status: $status, inviteeUserId: $inviteeUserId, invitedUserId: $invitedUserId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscussionInviteImpl &&
            (identical(other.discussionInviteId, discussionInviteId) ||
                other.discussionInviteId == discussionInviteId) &&
            (identical(other.discussionId, discussionId) ||
                other.discussionId == discussionId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.inviteeUserId, inviteeUserId) ||
                other.inviteeUserId == inviteeUserId) &&
            (identical(other.invitedUserId, invitedUserId) ||
                other.invitedUserId == invitedUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, discussionInviteId, discussionId,
      status, inviteeUserId, invitedUserId, createdAt);

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscussionInviteImplCopyWith<_$DiscussionInviteImpl> get copyWith =>
      __$$DiscussionInviteImplCopyWithImpl<_$DiscussionInviteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscussionInviteImplToJson(
      this,
    );
  }
}

abstract class _DiscussionInvite implements DiscussionInvite {
  factory _DiscussionInvite(
      {@JsonKey(name: 'discussion_invite_id')
      required final int discussionInviteId,
      @JsonKey(name: 'discussion_id', includeIfNull: false)
      required final int discussionId,
      @JsonKey(name: 'status') required final DiscussionInviteStatus status,
      @JsonKey(name: 'invitee_user_id') final String? inviteeUserId,
      @JsonKey(name: 'invited_user_id') final String? invitedUserId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      final DateTime? createdAt}) = _$DiscussionInviteImpl;

  factory _DiscussionInvite.fromJson(Map<String, dynamic> json) =
      _$DiscussionInviteImpl.fromJson;

  @override
  @JsonKey(name: 'discussion_invite_id')
  int get discussionInviteId;
  @override
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  int get discussionId;
  @override
  @JsonKey(name: 'status')
  DiscussionInviteStatus get status;
  @override
  @JsonKey(name: 'invitee_user_id')
  String? get inviteeUserId;
  @override
  @JsonKey(name: 'invited_user_id')
  String? get invitedUserId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? get createdAt;

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiscussionInviteImplCopyWith<_$DiscussionInviteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
