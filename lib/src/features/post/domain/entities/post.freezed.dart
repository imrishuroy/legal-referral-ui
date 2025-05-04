// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @JsonKey(name: 'post_type')
  PostType get postType;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @JsonKey(name: 'post_id')
  int get postId;
  @JsonKey(name: 'likes_count')
  int get likesCount;
  @JsonKey(name: 'comments_count')
  int get commentsCount;
  @JsonKey(name: 'is_liked')
  bool? get isLiked;
  @JsonKey(name: 'owner_first_name')
  String? get ownerFirstName;
  @JsonKey(name: 'owner_last_name')
  String? get ownerLastName;
  @JsonKey(name: 'owner_avatar_url')
  String? get ownerAvatarUrl;
  @JsonKey(name: 'owner_practice_area')
  String? get ownerPracticeArea;
  String? get content;
  @JsonKey(name: 'media')
  List<String> get media;
  @JsonKey(name: 'poll_id', includeIfNull: false)
  int? get pollId;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostCopyWith<Post> get copyWith =>
      _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Post &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.ownerFirstName, ownerFirstName) ||
                other.ownerFirstName == ownerFirstName) &&
            (identical(other.ownerLastName, ownerLastName) ||
                other.ownerLastName == ownerLastName) &&
            (identical(other.ownerAvatarUrl, ownerAvatarUrl) ||
                other.ownerAvatarUrl == ownerAvatarUrl) &&
            (identical(other.ownerPracticeArea, ownerPracticeArea) ||
                other.ownerPracticeArea == ownerPracticeArea) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            (identical(other.pollId, pollId) || other.pollId == pollId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ownerId,
      postType,
      createdAt,
      postId,
      likesCount,
      commentsCount,
      isLiked,
      ownerFirstName,
      ownerLastName,
      ownerAvatarUrl,
      ownerPracticeArea,
      content,
      const DeepCollectionEquality().hash(media),
      pollId);

  @override
  String toString() {
    return 'Post(ownerId: $ownerId, postType: $postType, createdAt: $createdAt, postId: $postId, likesCount: $likesCount, commentsCount: $commentsCount, isLiked: $isLiked, ownerFirstName: $ownerFirstName, ownerLastName: $ownerLastName, ownerAvatarUrl: $ownerAvatarUrl, ownerPracticeArea: $ownerPracticeArea, content: $content, media: $media, pollId: $pollId)';
  }
}

/// @nodoc
abstract mixin class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) =
      _$PostCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'post_type') PostType postType,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime createdAt,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'comments_count') int commentsCount,
      @JsonKey(name: 'is_liked') bool? isLiked,
      @JsonKey(name: 'owner_first_name') String? ownerFirstName,
      @JsonKey(name: 'owner_last_name') String? ownerLastName,
      @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
      String? content,
      @JsonKey(name: 'media') List<String> media,
      @JsonKey(name: 'poll_id', includeIfNull: false) int? pollId});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? postType = null,
    Object? createdAt = null,
    Object? postId = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = freezed,
    Object? ownerFirstName = freezed,
    Object? ownerLastName = freezed,
    Object? ownerAvatarUrl = freezed,
    Object? ownerPracticeArea = freezed,
    Object? content = freezed,
    Object? media = null,
    Object? pollId = freezed,
  }) {
    return _then(_self.copyWith(
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      postType: null == postType
          ? _self.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _self.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: freezed == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerFirstName: freezed == ownerFirstName
          ? _self.ownerFirstName
          : ownerFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerLastName: freezed == ownerLastName
          ? _self.ownerLastName
          : ownerLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerAvatarUrl: freezed == ownerAvatarUrl
          ? _self.ownerAvatarUrl
          : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerPracticeArea: freezed == ownerPracticeArea
          ? _self.ownerPracticeArea
          : ownerPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _self.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pollId: freezed == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Post implements Post {
  const _Post(
      {@JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'post_type') required this.postType,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      required this.createdAt,
      @JsonKey(name: 'post_id') required this.postId,
      @JsonKey(name: 'likes_count') this.likesCount = 0,
      @JsonKey(name: 'comments_count') this.commentsCount = 0,
      @JsonKey(name: 'is_liked') this.isLiked,
      @JsonKey(name: 'owner_first_name') this.ownerFirstName,
      @JsonKey(name: 'owner_last_name') this.ownerLastName,
      @JsonKey(name: 'owner_avatar_url') this.ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') this.ownerPracticeArea,
      this.content,
      @JsonKey(name: 'media') final List<String> media = const [],
      @JsonKey(name: 'poll_id', includeIfNull: false) this.pollId})
      : _media = media;
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'post_type')
  final PostType postType;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @override
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @override
  @JsonKey(name: 'is_liked')
  final bool? isLiked;
  @override
  @JsonKey(name: 'owner_first_name')
  final String? ownerFirstName;
  @override
  @JsonKey(name: 'owner_last_name')
  final String? ownerLastName;
  @override
  @JsonKey(name: 'owner_avatar_url')
  final String? ownerAvatarUrl;
  @override
  @JsonKey(name: 'owner_practice_area')
  final String? ownerPracticeArea;
  @override
  final String? content;
  final List<String> _media;
  @override
  @JsonKey(name: 'media')
  List<String> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  @JsonKey(name: 'poll_id', includeIfNull: false)
  final int? pollId;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.ownerFirstName, ownerFirstName) ||
                other.ownerFirstName == ownerFirstName) &&
            (identical(other.ownerLastName, ownerLastName) ||
                other.ownerLastName == ownerLastName) &&
            (identical(other.ownerAvatarUrl, ownerAvatarUrl) ||
                other.ownerAvatarUrl == ownerAvatarUrl) &&
            (identical(other.ownerPracticeArea, ownerPracticeArea) ||
                other.ownerPracticeArea == ownerPracticeArea) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.pollId, pollId) || other.pollId == pollId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ownerId,
      postType,
      createdAt,
      postId,
      likesCount,
      commentsCount,
      isLiked,
      ownerFirstName,
      ownerLastName,
      ownerAvatarUrl,
      ownerPracticeArea,
      content,
      const DeepCollectionEquality().hash(_media),
      pollId);

  @override
  String toString() {
    return 'Post(ownerId: $ownerId, postType: $postType, createdAt: $createdAt, postId: $postId, likesCount: $likesCount, commentsCount: $commentsCount, isLiked: $isLiked, ownerFirstName: $ownerFirstName, ownerLastName: $ownerLastName, ownerAvatarUrl: $ownerAvatarUrl, ownerPracticeArea: $ownerPracticeArea, content: $content, media: $media, pollId: $pollId)';
  }
}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) =
      __$PostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'post_type') PostType postType,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime createdAt,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'comments_count') int commentsCount,
      @JsonKey(name: 'is_liked') bool? isLiked,
      @JsonKey(name: 'owner_first_name') String? ownerFirstName,
      @JsonKey(name: 'owner_last_name') String? ownerLastName,
      @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
      String? content,
      @JsonKey(name: 'media') List<String> media,
      @JsonKey(name: 'poll_id', includeIfNull: false) int? pollId});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ownerId = null,
    Object? postType = null,
    Object? createdAt = null,
    Object? postId = null,
    Object? likesCount = null,
    Object? commentsCount = null,
    Object? isLiked = freezed,
    Object? ownerFirstName = freezed,
    Object? ownerLastName = freezed,
    Object? ownerAvatarUrl = freezed,
    Object? ownerPracticeArea = freezed,
    Object? content = freezed,
    Object? media = null,
    Object? pollId = freezed,
  }) {
    return _then(_Post(
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      postType: null == postType
          ? _self.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _self.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: freezed == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerFirstName: freezed == ownerFirstName
          ? _self.ownerFirstName
          : ownerFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerLastName: freezed == ownerLastName
          ? _self.ownerLastName
          : ownerLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerAvatarUrl: freezed == ownerAvatarUrl
          ? _self.ownerAvatarUrl
          : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerPracticeArea: freezed == ownerPracticeArea
          ? _self.ownerPracticeArea
          : ownerPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _self._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pollId: freezed == pollId
          ? _self.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
