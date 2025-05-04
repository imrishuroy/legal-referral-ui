// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion_invite_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscussionInviteRes {
  @JsonKey(name: 'discussion_invite')
  DiscussionInvite get discussionInvite;
  @JsonKey(name: 'discussion')
  Discussion get discussion;
  @JsonKey(name: 'user')
  AppUser get user;

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiscussionInviteResCopyWith<DiscussionInviteRes> get copyWith =>
      _$DiscussionInviteResCopyWithImpl<DiscussionInviteRes>(
          this as DiscussionInviteRes, _$identity);

  /// Serializes this DiscussionInviteRes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DiscussionInviteRes &&
            (identical(other.discussionInvite, discussionInvite) ||
                other.discussionInvite == discussionInvite) &&
            (identical(other.discussion, discussion) ||
                other.discussion == discussion) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, discussionInvite, discussion, user);

  @override
  String toString() {
    return 'DiscussionInviteRes(discussionInvite: $discussionInvite, discussion: $discussion, user: $user)';
  }
}

/// @nodoc
abstract mixin class $DiscussionInviteResCopyWith<$Res> {
  factory $DiscussionInviteResCopyWith(
          DiscussionInviteRes value, $Res Function(DiscussionInviteRes) _then) =
      _$DiscussionInviteResCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'discussion_invite') DiscussionInvite discussionInvite,
      @JsonKey(name: 'discussion') Discussion discussion,
      @JsonKey(name: 'user') AppUser user});

  $DiscussionInviteCopyWith<$Res> get discussionInvite;
  $DiscussionCopyWith<$Res> get discussion;
  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class _$DiscussionInviteResCopyWithImpl<$Res>
    implements $DiscussionInviteResCopyWith<$Res> {
  _$DiscussionInviteResCopyWithImpl(this._self, this._then);

  final DiscussionInviteRes _self;
  final $Res Function(DiscussionInviteRes) _then;

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionInvite = null,
    Object? discussion = null,
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      discussionInvite: null == discussionInvite
          ? _self.discussionInvite
          : discussionInvite // ignore: cast_nullable_to_non_nullable
              as DiscussionInvite,
      discussion: null == discussion
          ? _self.discussion
          : discussion // ignore: cast_nullable_to_non_nullable
              as Discussion,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscussionInviteCopyWith<$Res> get discussionInvite {
    return $DiscussionInviteCopyWith<$Res>(_self.discussionInvite, (value) {
      return _then(_self.copyWith(discussionInvite: value));
    });
  }

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscussionCopyWith<$Res> get discussion {
    return $DiscussionCopyWith<$Res>(_self.discussion, (value) {
      return _then(_self.copyWith(discussion: value));
    });
  }

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _DiscussionInviteRes implements DiscussionInviteRes {
  _DiscussionInviteRes(
      {@JsonKey(name: 'discussion_invite') required this.discussionInvite,
      @JsonKey(name: 'discussion') required this.discussion,
      @JsonKey(name: 'user') required this.user});
  factory _DiscussionInviteRes.fromJson(Map<String, dynamic> json) =>
      _$DiscussionInviteResFromJson(json);

  @override
  @JsonKey(name: 'discussion_invite')
  final DiscussionInvite discussionInvite;
  @override
  @JsonKey(name: 'discussion')
  final Discussion discussion;
  @override
  @JsonKey(name: 'user')
  final AppUser user;

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiscussionInviteResCopyWith<_DiscussionInviteRes> get copyWith =>
      __$DiscussionInviteResCopyWithImpl<_DiscussionInviteRes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiscussionInviteResToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DiscussionInviteRes &&
            (identical(other.discussionInvite, discussionInvite) ||
                other.discussionInvite == discussionInvite) &&
            (identical(other.discussion, discussion) ||
                other.discussion == discussion) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, discussionInvite, discussion, user);

  @override
  String toString() {
    return 'DiscussionInviteRes(discussionInvite: $discussionInvite, discussion: $discussion, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$DiscussionInviteResCopyWith<$Res>
    implements $DiscussionInviteResCopyWith<$Res> {
  factory _$DiscussionInviteResCopyWith(_DiscussionInviteRes value,
          $Res Function(_DiscussionInviteRes) _then) =
      __$DiscussionInviteResCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'discussion_invite') DiscussionInvite discussionInvite,
      @JsonKey(name: 'discussion') Discussion discussion,
      @JsonKey(name: 'user') AppUser user});

  @override
  $DiscussionInviteCopyWith<$Res> get discussionInvite;
  @override
  $DiscussionCopyWith<$Res> get discussion;
  @override
  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$DiscussionInviteResCopyWithImpl<$Res>
    implements _$DiscussionInviteResCopyWith<$Res> {
  __$DiscussionInviteResCopyWithImpl(this._self, this._then);

  final _DiscussionInviteRes _self;
  final $Res Function(_DiscussionInviteRes) _then;

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? discussionInvite = null,
    Object? discussion = null,
    Object? user = null,
  }) {
    return _then(_DiscussionInviteRes(
      discussionInvite: null == discussionInvite
          ? _self.discussionInvite
          : discussionInvite // ignore: cast_nullable_to_non_nullable
              as DiscussionInvite,
      discussion: null == discussion
          ? _self.discussion
          : discussion // ignore: cast_nullable_to_non_nullable
              as Discussion,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscussionInviteCopyWith<$Res> get discussionInvite {
    return $DiscussionInviteCopyWith<$Res>(_self.discussionInvite, (value) {
      return _then(_self.copyWith(discussionInvite: value));
    });
  }

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiscussionCopyWith<$Res> get discussion {
    return $DiscussionCopyWith<$Res>(_self.discussion, (value) {
      return _then(_self.copyWith(discussion: value));
    });
  }

  /// Create a copy of DiscussionInviteRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
