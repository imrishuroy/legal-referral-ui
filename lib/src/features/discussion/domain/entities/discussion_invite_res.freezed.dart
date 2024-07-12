// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion_invite_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DiscussionInviteRes _$DiscussionInviteResFromJson(Map<String, dynamic> json) {
  return _DiscussionInviteRes.fromJson(json);
}

/// @nodoc
mixin _$DiscussionInviteRes {
  @JsonKey(name: 'discussion_invite')
  DiscussionInvite get discussionInvite => throw _privateConstructorUsedError;
  @JsonKey(name: 'discussion')
  Discussion get discussion => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  AppUser get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussionInviteResCopyWith<DiscussionInviteRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionInviteResCopyWith<$Res> {
  factory $DiscussionInviteResCopyWith(
          DiscussionInviteRes value, $Res Function(DiscussionInviteRes) then) =
      _$DiscussionInviteResCopyWithImpl<$Res, DiscussionInviteRes>;
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
class _$DiscussionInviteResCopyWithImpl<$Res, $Val extends DiscussionInviteRes>
    implements $DiscussionInviteResCopyWith<$Res> {
  _$DiscussionInviteResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionInvite = null,
    Object? discussion = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      discussionInvite: null == discussionInvite
          ? _value.discussionInvite
          : discussionInvite // ignore: cast_nullable_to_non_nullable
              as DiscussionInvite,
      discussion: null == discussion
          ? _value.discussion
          : discussion // ignore: cast_nullable_to_non_nullable
              as Discussion,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscussionInviteCopyWith<$Res> get discussionInvite {
    return $DiscussionInviteCopyWith<$Res>(_value.discussionInvite, (value) {
      return _then(_value.copyWith(discussionInvite: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscussionCopyWith<$Res> get discussion {
    return $DiscussionCopyWith<$Res>(_value.discussion, (value) {
      return _then(_value.copyWith(discussion: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscussionInviteResImplCopyWith<$Res>
    implements $DiscussionInviteResCopyWith<$Res> {
  factory _$$DiscussionInviteResImplCopyWith(_$DiscussionInviteResImpl value,
          $Res Function(_$DiscussionInviteResImpl) then) =
      __$$DiscussionInviteResImplCopyWithImpl<$Res>;
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
class __$$DiscussionInviteResImplCopyWithImpl<$Res>
    extends _$DiscussionInviteResCopyWithImpl<$Res, _$DiscussionInviteResImpl>
    implements _$$DiscussionInviteResImplCopyWith<$Res> {
  __$$DiscussionInviteResImplCopyWithImpl(_$DiscussionInviteResImpl _value,
      $Res Function(_$DiscussionInviteResImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionInvite = null,
    Object? discussion = null,
    Object? user = null,
  }) {
    return _then(_$DiscussionInviteResImpl(
      discussionInvite: null == discussionInvite
          ? _value.discussionInvite
          : discussionInvite // ignore: cast_nullable_to_non_nullable
              as DiscussionInvite,
      discussion: null == discussion
          ? _value.discussion
          : discussion // ignore: cast_nullable_to_non_nullable
              as Discussion,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscussionInviteResImpl implements _DiscussionInviteRes {
  _$DiscussionInviteResImpl(
      {@JsonKey(name: 'discussion_invite') required this.discussionInvite,
      @JsonKey(name: 'discussion') required this.discussion,
      @JsonKey(name: 'user') required this.user});

  factory _$DiscussionInviteResImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscussionInviteResImplFromJson(json);

  @override
  @JsonKey(name: 'discussion_invite')
  final DiscussionInvite discussionInvite;
  @override
  @JsonKey(name: 'discussion')
  final Discussion discussion;
  @override
  @JsonKey(name: 'user')
  final AppUser user;

  @override
  String toString() {
    return 'DiscussionInviteRes(discussionInvite: $discussionInvite, discussion: $discussion, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscussionInviteResImpl &&
            (identical(other.discussionInvite, discussionInvite) ||
                other.discussionInvite == discussionInvite) &&
            (identical(other.discussion, discussion) ||
                other.discussion == discussion) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, discussionInvite, discussion, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscussionInviteResImplCopyWith<_$DiscussionInviteResImpl> get copyWith =>
      __$$DiscussionInviteResImplCopyWithImpl<_$DiscussionInviteResImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscussionInviteResImplToJson(
      this,
    );
  }
}

abstract class _DiscussionInviteRes implements DiscussionInviteRes {
  factory _DiscussionInviteRes(
          {@JsonKey(name: 'discussion_invite')
          required final DiscussionInvite discussionInvite,
          @JsonKey(name: 'discussion') required final Discussion discussion,
          @JsonKey(name: 'user') required final AppUser user}) =
      _$DiscussionInviteResImpl;

  factory _DiscussionInviteRes.fromJson(Map<String, dynamic> json) =
      _$DiscussionInviteResImpl.fromJson;

  @override
  @JsonKey(name: 'discussion_invite')
  DiscussionInvite get discussionInvite;
  @override
  @JsonKey(name: 'discussion')
  Discussion get discussion;
  @override
  @JsonKey(name: 'user')
  AppUser get user;
  @override
  @JsonKey(ignore: true)
  _$$DiscussionInviteResImplCopyWith<_$DiscussionInviteResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
