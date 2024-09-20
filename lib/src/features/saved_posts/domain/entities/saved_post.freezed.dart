// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedPost _$SavedPostFromJson(Map<String, dynamic> json) {
  return _SavedPost.fromJson(json);
}

/// @nodoc
mixin _$SavedPost {
  Post? get post => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  AppUser? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved_post_id')
  int get savedPostId => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SavedPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedPostCopyWith<SavedPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedPostCopyWith<$Res> {
  factory $SavedPostCopyWith(SavedPost value, $Res Function(SavedPost) then) =
      _$SavedPostCopyWithImpl<$Res, SavedPost>;
  @useResult
  $Res call(
      {Post? post,
      @JsonKey(name: 'user') AppUser? owner,
      @JsonKey(name: 'saved_post_id') int savedPostId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at')
      DateTime createdAt});

  $PostCopyWith<$Res>? get post;
  $AppUserCopyWith<$Res>? get owner;
}

/// @nodoc
class _$SavedPostCopyWithImpl<$Res, $Val extends SavedPost>
    implements $SavedPostCopyWith<$Res> {
  _$SavedPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = freezed,
    Object? owner = freezed,
    Object? savedPostId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      savedPostId: null == savedPostId
          ? _value.savedPostId
          : savedPostId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_value.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.post!, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedPostImplCopyWith<$Res>
    implements $SavedPostCopyWith<$Res> {
  factory _$$SavedPostImplCopyWith(
          _$SavedPostImpl value, $Res Function(_$SavedPostImpl) then) =
      __$$SavedPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Post? post,
      @JsonKey(name: 'user') AppUser? owner,
      @JsonKey(name: 'saved_post_id') int savedPostId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at')
      DateTime createdAt});

  @override
  $PostCopyWith<$Res>? get post;
  @override
  $AppUserCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$SavedPostImplCopyWithImpl<$Res>
    extends _$SavedPostCopyWithImpl<$Res, _$SavedPostImpl>
    implements _$$SavedPostImplCopyWith<$Res> {
  __$$SavedPostImplCopyWithImpl(
      _$SavedPostImpl _value, $Res Function(_$SavedPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = freezed,
    Object? owner = freezed,
    Object? savedPostId = null,
    Object? createdAt = null,
  }) {
    return _then(_$SavedPostImpl(
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      savedPostId: null == savedPostId
          ? _value.savedPostId
          : savedPostId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedPostImpl implements _SavedPost {
  const _$SavedPostImpl(
      {required this.post,
      @JsonKey(name: 'user') required this.owner,
      @JsonKey(name: 'saved_post_id') required this.savedPostId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at')
      required this.createdAt});

  factory _$SavedPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPostImplFromJson(json);

  @override
  final Post? post;
  @override
  @JsonKey(name: 'user')
  final AppUser? owner;
  @override
  @JsonKey(name: 'saved_post_id')
  final int savedPostId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'SavedPost(post: $post, owner: $owner, savedPostId: $savedPostId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedPostImpl &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.savedPostId, savedPostId) ||
                other.savedPostId == savedPostId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, post, owner, savedPostId, createdAt);

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPostImplCopyWith<_$SavedPostImpl> get copyWith =>
      __$$SavedPostImplCopyWithImpl<_$SavedPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPostImplToJson(
      this,
    );
  }
}

abstract class _SavedPost implements SavedPost {
  const factory _SavedPost(
      {required final Post? post,
      @JsonKey(name: 'user') required final AppUser? owner,
      @JsonKey(name: 'saved_post_id') required final int savedPostId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$SavedPostImpl;

  factory _SavedPost.fromJson(Map<String, dynamic> json) =
      _$SavedPostImpl.fromJson;

  @override
  Post? get post;
  @override
  @JsonKey(name: 'user')
  AppUser? get owner;
  @override
  @JsonKey(name: 'saved_post_id')
  int get savedPostId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedPostImplCopyWith<_$SavedPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
