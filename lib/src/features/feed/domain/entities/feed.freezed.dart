// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
mixin _$Feed {
  @JsonKey(name: 'feed_type')
  FeedType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'feed_post')
  FeedPost? get feedPost => throw _privateConstructorUsedError;
  @JsonKey(name: 'ad')
  Ad? get ad => throw _privateConstructorUsedError;

  /// Serializes this Feed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res, Feed>;
  @useResult
  $Res call(
      {@JsonKey(name: 'feed_type') FeedType type,
      @JsonKey(name: 'feed_post') FeedPost? feedPost,
      @JsonKey(name: 'ad') Ad? ad});

  $FeedPostCopyWith<$Res>? get feedPost;
  $AdCopyWith<$Res>? get ad;
}

/// @nodoc
class _$FeedCopyWithImpl<$Res, $Val extends Feed>
    implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? feedPost = freezed,
    Object? ad = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedType,
      feedPost: freezed == feedPost
          ? _value.feedPost
          : feedPost // ignore: cast_nullable_to_non_nullable
              as FeedPost?,
      ad: freezed == ad
          ? _value.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as Ad?,
    ) as $Val);
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedPostCopyWith<$Res>? get feedPost {
    if (_value.feedPost == null) {
      return null;
    }

    return $FeedPostCopyWith<$Res>(_value.feedPost!, (value) {
      return _then(_value.copyWith(feedPost: value) as $Val);
    });
  }

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdCopyWith<$Res>? get ad {
    if (_value.ad == null) {
      return null;
    }

    return $AdCopyWith<$Res>(_value.ad!, (value) {
      return _then(_value.copyWith(ad: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedImplCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$$FeedImplCopyWith(
          _$FeedImpl value, $Res Function(_$FeedImpl) then) =
      __$$FeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'feed_type') FeedType type,
      @JsonKey(name: 'feed_post') FeedPost? feedPost,
      @JsonKey(name: 'ad') Ad? ad});

  @override
  $FeedPostCopyWith<$Res>? get feedPost;
  @override
  $AdCopyWith<$Res>? get ad;
}

/// @nodoc
class __$$FeedImplCopyWithImpl<$Res>
    extends _$FeedCopyWithImpl<$Res, _$FeedImpl>
    implements _$$FeedImplCopyWith<$Res> {
  __$$FeedImplCopyWithImpl(_$FeedImpl _value, $Res Function(_$FeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? feedPost = freezed,
    Object? ad = freezed,
  }) {
    return _then(_$FeedImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedType,
      feedPost: freezed == feedPost
          ? _value.feedPost
          : feedPost // ignore: cast_nullable_to_non_nullable
              as FeedPost?,
      ad: freezed == ad
          ? _value.ad
          : ad // ignore: cast_nullable_to_non_nullable
              as Ad?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedImpl implements _Feed {
  const _$FeedImpl(
      {@JsonKey(name: 'feed_type') required this.type,
      @JsonKey(name: 'feed_post') this.feedPost,
      @JsonKey(name: 'ad') this.ad});

  factory _$FeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedImplFromJson(json);

  @override
  @JsonKey(name: 'feed_type')
  final FeedType type;
  @override
  @JsonKey(name: 'feed_post')
  final FeedPost? feedPost;
  @override
  @JsonKey(name: 'ad')
  final Ad? ad;

  @override
  String toString() {
    return 'Feed(type: $type, feedPost: $feedPost, ad: $ad)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.feedPost, feedPost) ||
                other.feedPost == feedPost) &&
            (identical(other.ad, ad) || other.ad == ad));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, feedPost, ad);

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      __$$FeedImplCopyWithImpl<_$FeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedImplToJson(
      this,
    );
  }
}

abstract class _Feed implements Feed {
  const factory _Feed(
      {@JsonKey(name: 'feed_type') required final FeedType type,
      @JsonKey(name: 'feed_post') final FeedPost? feedPost,
      @JsonKey(name: 'ad') final Ad? ad}) = _$FeedImpl;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$FeedImpl.fromJson;

  @override
  @JsonKey(name: 'feed_type')
  FeedType get type;
  @override
  @JsonKey(name: 'feed_post')
  FeedPost? get feedPost;
  @override
  @JsonKey(name: 'ad')
  Ad? get ad;

  /// Create a copy of Feed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedImplCopyWith<_$FeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedPost _$FeedPostFromJson(Map<String, dynamic> json) {
  return _FeedPost.fromJson(json);
}

/// @nodoc
mixin _$FeedPost {
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_type')
  PostType get postType => throw _privateConstructorUsedError;
  @JsonKey(name: 'poll_id')
  int? get pollId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_first_name')
  String? get ownerFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_last_name')
  String? get ownerLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_avatar_url')
  String? get ownerAvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_practice_area')
  String? get ownerPracticeArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  List<String> get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int get commentsCount => throw _privateConstructorUsedError;

  /// Serializes this FeedPost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedPostCopyWith<FeedPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPostCopyWith<$Res> {
  factory $FeedPostCopyWith(FeedPost value, $Res Function(FeedPost) then) =
      _$FeedPostCopyWithImpl<$Res, FeedPost>;
  @useResult
  $Res call(
      {@DateTimeJsonConverter() @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'post_type') PostType postType,
      @JsonKey(name: 'poll_id') int? pollId,
      @JsonKey(name: 'owner_first_name') String? ownerFirstName,
      @JsonKey(name: 'owner_last_name') String? ownerLastName,
      @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
      @JsonKey(name: 'media') List<String> media,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'comments_count') int commentsCount});
}

/// @nodoc
class _$FeedPostCopyWithImpl<$Res, $Val extends FeedPost>
    implements $FeedPostCopyWith<$Res> {
  _$FeedPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? ownerId = null,
    Object? postId = null,
    Object? content = freezed,
    Object? postType = null,
    Object? pollId = freezed,
    Object? ownerFirstName = freezed,
    Object? ownerLastName = freezed,
    Object? ownerAvatarUrl = freezed,
    Object? ownerPracticeArea = freezed,
    Object? media = null,
    Object? isLiked = null,
    Object? likesCount = null,
    Object? commentsCount = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      postType: null == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
      ownerFirstName: freezed == ownerFirstName
          ? _value.ownerFirstName
          : ownerFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerLastName: freezed == ownerLastName
          ? _value.ownerLastName
          : ownerLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerAvatarUrl: freezed == ownerAvatarUrl
          ? _value.ownerAvatarUrl
          : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerPracticeArea: freezed == ownerPracticeArea
          ? _value.ownerPracticeArea
          : ownerPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedPostImplCopyWith<$Res>
    implements $FeedPostCopyWith<$Res> {
  factory _$$FeedPostImplCopyWith(
          _$FeedPostImpl value, $Res Function(_$FeedPostImpl) then) =
      __$$FeedPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeJsonConverter() @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'post_type') PostType postType,
      @JsonKey(name: 'poll_id') int? pollId,
      @JsonKey(name: 'owner_first_name') String? ownerFirstName,
      @JsonKey(name: 'owner_last_name') String? ownerLastName,
      @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
      @JsonKey(name: 'media') List<String> media,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount,
      @JsonKey(name: 'comments_count') int commentsCount});
}

/// @nodoc
class __$$FeedPostImplCopyWithImpl<$Res>
    extends _$FeedPostCopyWithImpl<$Res, _$FeedPostImpl>
    implements _$$FeedPostImplCopyWith<$Res> {
  __$$FeedPostImplCopyWithImpl(
      _$FeedPostImpl _value, $Res Function(_$FeedPostImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? ownerId = null,
    Object? postId = null,
    Object? content = freezed,
    Object? postType = null,
    Object? pollId = freezed,
    Object? ownerFirstName = freezed,
    Object? ownerLastName = freezed,
    Object? ownerAvatarUrl = freezed,
    Object? ownerPracticeArea = freezed,
    Object? media = null,
    Object? isLiked = null,
    Object? likesCount = null,
    Object? commentsCount = null,
  }) {
    return _then(_$FeedPostImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      postType: null == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as PostType,
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
      ownerFirstName: freezed == ownerFirstName
          ? _value.ownerFirstName
          : ownerFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerLastName: freezed == ownerLastName
          ? _value.ownerLastName
          : ownerLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerAvatarUrl: freezed == ownerAvatarUrl
          ? _value.ownerAvatarUrl
          : ownerAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerPracticeArea: freezed == ownerPracticeArea
          ? _value.ownerPracticeArea
          : ownerPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedPostImpl implements _FeedPost {
  const _$FeedPostImpl(
      {@DateTimeJsonConverter()
      @JsonKey(name: 'created_at')
      required this.createdAt,
      @JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'post_id') required this.postId,
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'post_type') required this.postType,
      @JsonKey(name: 'poll_id') this.pollId,
      @JsonKey(name: 'owner_first_name') this.ownerFirstName,
      @JsonKey(name: 'owner_last_name') this.ownerLastName,
      @JsonKey(name: 'owner_avatar_url') this.ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') this.ownerPracticeArea,
      @JsonKey(name: 'media') final List<String> media = const [],
      @JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'likes_count') this.likesCount = 0,
      @JsonKey(name: 'comments_count') this.commentsCount = 0})
      : _media = media;

  factory _$FeedPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedPostImplFromJson(json);

  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'post_type')
  final PostType postType;
  @override
  @JsonKey(name: 'poll_id')
  final int? pollId;
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
  final List<String> _media;
  @override
  @JsonKey(name: 'media')
  List<String> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;
  @override
  @JsonKey(name: 'comments_count')
  final int commentsCount;

  @override
  String toString() {
    return 'FeedPost(createdAt: $createdAt, ownerId: $ownerId, postId: $postId, content: $content, postType: $postType, pollId: $pollId, ownerFirstName: $ownerFirstName, ownerLastName: $ownerLastName, ownerAvatarUrl: $ownerAvatarUrl, ownerPracticeArea: $ownerPracticeArea, media: $media, isLiked: $isLiked, likesCount: $likesCount, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.ownerFirstName, ownerFirstName) ||
                other.ownerFirstName == ownerFirstName) &&
            (identical(other.ownerLastName, ownerLastName) ||
                other.ownerLastName == ownerLastName) &&
            (identical(other.ownerAvatarUrl, ownerAvatarUrl) ||
                other.ownerAvatarUrl == ownerAvatarUrl) &&
            (identical(other.ownerPracticeArea, ownerPracticeArea) ||
                other.ownerPracticeArea == ownerPracticeArea) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      ownerId,
      postId,
      content,
      postType,
      pollId,
      ownerFirstName,
      ownerLastName,
      ownerAvatarUrl,
      ownerPracticeArea,
      const DeepCollectionEquality().hash(_media),
      isLiked,
      likesCount,
      commentsCount);

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostImplCopyWith<_$FeedPostImpl> get copyWith =>
      __$$FeedPostImplCopyWithImpl<_$FeedPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedPostImplToJson(
      this,
    );
  }
}

abstract class _FeedPost implements FeedPost {
  const factory _FeedPost(
          {@DateTimeJsonConverter()
          @JsonKey(name: 'created_at')
          required final DateTime createdAt,
          @JsonKey(name: 'owner_id') required final String ownerId,
          @JsonKey(name: 'post_id') required final int postId,
          @JsonKey(name: 'content') required final String? content,
          @JsonKey(name: 'post_type') required final PostType postType,
          @JsonKey(name: 'poll_id') final int? pollId,
          @JsonKey(name: 'owner_first_name') final String? ownerFirstName,
          @JsonKey(name: 'owner_last_name') final String? ownerLastName,
          @JsonKey(name: 'owner_avatar_url') final String? ownerAvatarUrl,
          @JsonKey(name: 'owner_practice_area') final String? ownerPracticeArea,
          @JsonKey(name: 'media') final List<String> media,
          @JsonKey(name: 'is_liked') final bool isLiked,
          @JsonKey(name: 'likes_count') final int likesCount,
          @JsonKey(name: 'comments_count') final int commentsCount}) =
      _$FeedPostImpl;

  factory _FeedPost.fromJson(Map<String, dynamic> json) =
      _$FeedPostImpl.fromJson;

  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(name: 'post_type')
  PostType get postType;
  @override
  @JsonKey(name: 'poll_id')
  int? get pollId;
  @override
  @JsonKey(name: 'owner_first_name')
  String? get ownerFirstName;
  @override
  @JsonKey(name: 'owner_last_name')
  String? get ownerLastName;
  @override
  @JsonKey(name: 'owner_avatar_url')
  String? get ownerAvatarUrl;
  @override
  @JsonKey(name: 'owner_practice_area')
  String? get ownerPracticeArea;
  @override
  @JsonKey(name: 'media')
  List<String> get media;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @override
  @JsonKey(name: 'likes_count')
  int get likesCount;
  @override
  @JsonKey(name: 'comments_count')
  int get commentsCount;

  /// Create a copy of FeedPost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostImplCopyWith<_$FeedPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
