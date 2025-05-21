// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedPost {
  Post? get post;
  @JsonKey(name: 'user')
  AppUser? get owner;
  @JsonKey(name: 'saved_post_id')
  int get savedPostId;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt;

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedPostCopyWith<SavedPost> get copyWith =>
      _$SavedPostCopyWithImpl<SavedPost>(this as SavedPost, _$identity);

  /// Serializes this SavedPost to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedPost &&
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

  @override
  String toString() {
    return 'SavedPost(post: $post, owner: $owner, savedPostId: $savedPostId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SavedPostCopyWith<$Res> {
  factory $SavedPostCopyWith(SavedPost value, $Res Function(SavedPost) _then) =
      _$SavedPostCopyWithImpl;
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
class _$SavedPostCopyWithImpl<$Res> implements $SavedPostCopyWith<$Res> {
  _$SavedPostCopyWithImpl(this._self, this._then);

  final SavedPost _self;
  final $Res Function(SavedPost) _then;

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
    return _then(_self.copyWith(
      post: freezed == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      savedPostId: null == savedPostId
          ? _self.savedPostId
          : savedPostId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_self.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_self.post!, (value) {
      return _then(_self.copyWith(post: value));
    });
  }

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SavedPost implements SavedPost {
  const _SavedPost(
      {required this.post,
      @JsonKey(name: 'user') required this.owner,
      @JsonKey(name: 'saved_post_id') required this.savedPostId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at')
      required this.createdAt});
  factory _SavedPost.fromJson(Map<String, dynamic> json) =>
      _$SavedPostFromJson(json);

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

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedPostCopyWith<_SavedPost> get copyWith =>
      __$SavedPostCopyWithImpl<_SavedPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedPostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedPost &&
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

  @override
  String toString() {
    return 'SavedPost(post: $post, owner: $owner, savedPostId: $savedPostId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SavedPostCopyWith<$Res>
    implements $SavedPostCopyWith<$Res> {
  factory _$SavedPostCopyWith(
          _SavedPost value, $Res Function(_SavedPost) _then) =
      __$SavedPostCopyWithImpl;
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
class __$SavedPostCopyWithImpl<$Res> implements _$SavedPostCopyWith<$Res> {
  __$SavedPostCopyWithImpl(this._self, this._then);

  final _SavedPost _self;
  final $Res Function(_SavedPost) _then;

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? post = freezed,
    Object? owner = freezed,
    Object? savedPostId = null,
    Object? createdAt = null,
  }) {
    return _then(_SavedPost(
      post: freezed == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      savedPostId: null == savedPostId
          ? _self.savedPostId
          : savedPostId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_self.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_self.post!, (value) {
      return _then(_self.copyWith(post: value));
    });
  }

  /// Create a copy of SavedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

// dart format on
