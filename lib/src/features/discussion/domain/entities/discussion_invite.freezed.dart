// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscussionInvite {
  @JsonKey(name: 'discussion_invite_id')
  int get discussionInviteId;
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  int get discussionId;
  @JsonKey(name: 'status')
  DiscussionInviteStatus get status;
  @JsonKey(name: 'invitee_user_id')
  String? get inviteeUserId;
  @JsonKey(name: 'invited_user_id')
  String? get invitedUserId;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? get createdAt;

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiscussionInviteCopyWith<DiscussionInvite> get copyWith =>
      _$DiscussionInviteCopyWithImpl<DiscussionInvite>(
          this as DiscussionInvite, _$identity);

  /// Serializes this DiscussionInvite to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiscussionInvite &&
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

  @override
  String toString() {
    return 'DiscussionInvite(discussionInviteId: $discussionInviteId, discussionId: $discussionId, status: $status, inviteeUserId: $inviteeUserId, invitedUserId: $invitedUserId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $DiscussionInviteCopyWith<$Res> {
  factory $DiscussionInviteCopyWith(
          DiscussionInvite value, $Res Function(DiscussionInvite) _then) =
      _$DiscussionInviteCopyWithImpl;
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
class _$DiscussionInviteCopyWithImpl<$Res>
    implements $DiscussionInviteCopyWith<$Res> {
  _$DiscussionInviteCopyWithImpl(this._self, this._then);

  final DiscussionInvite _self;
  final $Res Function(DiscussionInvite) _then;

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
    return _then(_self.copyWith(
      discussionInviteId: null == discussionInviteId
          ? _self.discussionInviteId
          : discussionInviteId // ignore: cast_nullable_to_non_nullable
              as int,
      discussionId: null == discussionId
          ? _self.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiscussionInviteStatus,
      inviteeUserId: freezed == inviteeUserId
          ? _self.inviteeUserId
          : inviteeUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedUserId: freezed == invitedUserId
          ? _self.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DiscussionInvite implements DiscussionInvite {
  _DiscussionInvite(
      {@JsonKey(name: 'discussion_invite_id') required this.discussionInviteId,
      @JsonKey(name: 'discussion_id', includeIfNull: false)
      required this.discussionId,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'invitee_user_id') this.inviteeUserId,
      @JsonKey(name: 'invited_user_id') this.invitedUserId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      this.createdAt});
  factory _DiscussionInvite.fromJson(Map<String, dynamic> json) =>
      _$DiscussionInviteFromJson(json);

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

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiscussionInviteCopyWith<_DiscussionInvite> get copyWith =>
      __$DiscussionInviteCopyWithImpl<_DiscussionInvite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiscussionInviteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DiscussionInvite &&
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

  @override
  String toString() {
    return 'DiscussionInvite(discussionInviteId: $discussionInviteId, discussionId: $discussionId, status: $status, inviteeUserId: $inviteeUserId, invitedUserId: $invitedUserId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$DiscussionInviteCopyWith<$Res>
    implements $DiscussionInviteCopyWith<$Res> {
  factory _$DiscussionInviteCopyWith(
          _DiscussionInvite value, $Res Function(_DiscussionInvite) _then) =
      __$DiscussionInviteCopyWithImpl;
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
class __$DiscussionInviteCopyWithImpl<$Res>
    implements _$DiscussionInviteCopyWith<$Res> {
  __$DiscussionInviteCopyWithImpl(this._self, this._then);

  final _DiscussionInvite _self;
  final $Res Function(_DiscussionInvite) _then;

  /// Create a copy of DiscussionInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? discussionInviteId = null,
    Object? discussionId = null,
    Object? status = null,
    Object? inviteeUserId = freezed,
    Object? invitedUserId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_DiscussionInvite(
      discussionInviteId: null == discussionInviteId
          ? _self.discussionInviteId
          : discussionInviteId // ignore: cast_nullable_to_non_nullable
              as int,
      discussionId: null == discussionId
          ? _self.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DiscussionInviteStatus,
      inviteeUserId: freezed == inviteeUserId
          ? _self.inviteeUserId
          : inviteeUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedUserId: freezed == invitedUserId
          ? _self.invitedUserId
          : invitedUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
