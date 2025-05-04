// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Comment {
  @JsonKey(name: 'comment_id')
  int get commentId;
  @JsonKey(name: 'post_id')
  int get postId;
  String get content;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @JsonKey(name: 'author_user_id')
  String get authorUserId;
  @JsonKey(name: 'parent_comment_id')
  int? get parentCommentId;
  @JsonKey(name: 'author_first_name')
  String? get authorFirstName;
  @JsonKey(name: 'author_last_name')
  String? get authorLastName;
  @JsonKey(name: 'author_practice_area')
  String? get authorPracticeArea;
  @JsonKey(name: 'author_avatar_url')
  String? get authorAvatarUrl;
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @JsonKey(name: 'likes_count')
  int get likesCount;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommentCopyWith<Comment> get copyWith =>
      _$CommentCopyWithImpl<Comment>(this as Comment, _$identity);

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Comment &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.authorUserId, authorUserId) ||
                other.authorUserId == authorUserId) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.authorFirstName, authorFirstName) ||
                other.authorFirstName == authorFirstName) &&
            (identical(other.authorLastName, authorLastName) ||
                other.authorLastName == authorLastName) &&
            (identical(other.authorPracticeArea, authorPracticeArea) ||
                other.authorPracticeArea == authorPracticeArea) &&
            (identical(other.authorAvatarUrl, authorAvatarUrl) ||
                other.authorAvatarUrl == authorAvatarUrl) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentId,
      postId,
      content,
      createdAt,
      authorUserId,
      parentCommentId,
      authorFirstName,
      authorLastName,
      authorPracticeArea,
      authorAvatarUrl,
      isLiked,
      likesCount);

  @override
  String toString() {
    return 'Comment(commentId: $commentId, postId: $postId, content: $content, createdAt: $createdAt, authorUserId: $authorUserId, parentCommentId: $parentCommentId, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorPracticeArea: $authorPracticeArea, authorAvatarUrl: $authorAvatarUrl, isLiked: $isLiked, likesCount: $likesCount)';
  }
}

/// @nodoc
abstract mixin class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) _then) =
      _$CommentCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'comment_id') int commentId,
      @JsonKey(name: 'post_id') int postId,
      String content,
      @JsonKey(name: 'created_at') @DateTimeJsonConverter() DateTime createdAt,
      @JsonKey(name: 'author_user_id') String authorUserId,
      @JsonKey(name: 'parent_comment_id') int? parentCommentId,
      @JsonKey(name: 'author_first_name') String? authorFirstName,
      @JsonKey(name: 'author_last_name') String? authorLastName,
      @JsonKey(name: 'author_practice_area') String? authorPracticeArea,
      @JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._self, this._then);

  final Comment _self;
  final $Res Function(Comment) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? postId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? authorUserId = null,
    Object? parentCommentId = freezed,
    Object? authorFirstName = freezed,
    Object? authorLastName = freezed,
    Object? authorPracticeArea = freezed,
    Object? authorAvatarUrl = freezed,
    Object? isLiked = null,
    Object? likesCount = null,
  }) {
    return _then(_self.copyWith(
      commentId: null == commentId
          ? _self.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authorUserId: null == authorUserId
          ? _self.authorUserId
          : authorUserId // ignore: cast_nullable_to_non_nullable
              as String,
      parentCommentId: freezed == parentCommentId
          ? _self.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      authorFirstName: freezed == authorFirstName
          ? _self.authorFirstName
          : authorFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorLastName: freezed == authorLastName
          ? _self.authorLastName
          : authorLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPracticeArea: freezed == authorPracticeArea
          ? _self.authorPracticeArea
          : authorPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatarUrl: freezed == authorAvatarUrl
          ? _self.authorAvatarUrl
          : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Comment implements Comment {
  const _Comment(
      {@JsonKey(name: 'comment_id') required this.commentId,
      @JsonKey(name: 'post_id') required this.postId,
      required this.content,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required this.createdAt,
      @JsonKey(name: 'author_user_id') required this.authorUserId,
      @JsonKey(name: 'parent_comment_id') this.parentCommentId,
      @JsonKey(name: 'author_first_name') this.authorFirstName,
      @JsonKey(name: 'author_last_name') this.authorLastName,
      @JsonKey(name: 'author_practice_area') this.authorPracticeArea,
      @JsonKey(name: 'author_avatar_url') this.authorAvatarUrl,
      @JsonKey(name: 'is_liked') this.isLiked = false,
      @JsonKey(name: 'likes_count') this.likesCount = 0});
  factory _Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  @override
  @JsonKey(name: 'comment_id')
  final int commentId;
  @override
  @JsonKey(name: 'post_id')
  final int postId;
  @override
  final String content;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @JsonKey(name: 'author_user_id')
  final String authorUserId;
  @override
  @JsonKey(name: 'parent_comment_id')
  final int? parentCommentId;
  @override
  @JsonKey(name: 'author_first_name')
  final String? authorFirstName;
  @override
  @JsonKey(name: 'author_last_name')
  final String? authorLastName;
  @override
  @JsonKey(name: 'author_practice_area')
  final String? authorPracticeArea;
  @override
  @JsonKey(name: 'author_avatar_url')
  final String? authorAvatarUrl;
  @override
  @JsonKey(name: 'is_liked')
  final bool isLiked;
  @override
  @JsonKey(name: 'likes_count')
  final int likesCount;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CommentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Comment &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.authorUserId, authorUserId) ||
                other.authorUserId == authorUserId) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.authorFirstName, authorFirstName) ||
                other.authorFirstName == authorFirstName) &&
            (identical(other.authorLastName, authorLastName) ||
                other.authorLastName == authorLastName) &&
            (identical(other.authorPracticeArea, authorPracticeArea) ||
                other.authorPracticeArea == authorPracticeArea) &&
            (identical(other.authorAvatarUrl, authorAvatarUrl) ||
                other.authorAvatarUrl == authorAvatarUrl) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentId,
      postId,
      content,
      createdAt,
      authorUserId,
      parentCommentId,
      authorFirstName,
      authorLastName,
      authorPracticeArea,
      authorAvatarUrl,
      isLiked,
      likesCount);

  @override
  String toString() {
    return 'Comment(commentId: $commentId, postId: $postId, content: $content, createdAt: $createdAt, authorUserId: $authorUserId, parentCommentId: $parentCommentId, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorPracticeArea: $authorPracticeArea, authorAvatarUrl: $authorAvatarUrl, isLiked: $isLiked, likesCount: $likesCount)';
  }
}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) =
      __$CommentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'comment_id') int commentId,
      @JsonKey(name: 'post_id') int postId,
      String content,
      @JsonKey(name: 'created_at') @DateTimeJsonConverter() DateTime createdAt,
      @JsonKey(name: 'author_user_id') String authorUserId,
      @JsonKey(name: 'parent_comment_id') int? parentCommentId,
      @JsonKey(name: 'author_first_name') String? authorFirstName,
      @JsonKey(name: 'author_last_name') String? authorLastName,
      @JsonKey(name: 'author_practice_area') String? authorPracticeArea,
      @JsonKey(name: 'author_avatar_url') String? authorAvatarUrl,
      @JsonKey(name: 'is_liked') bool isLiked,
      @JsonKey(name: 'likes_count') int likesCount});
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? commentId = null,
    Object? postId = null,
    Object? content = null,
    Object? createdAt = null,
    Object? authorUserId = null,
    Object? parentCommentId = freezed,
    Object? authorFirstName = freezed,
    Object? authorLastName = freezed,
    Object? authorPracticeArea = freezed,
    Object? authorAvatarUrl = freezed,
    Object? isLiked = null,
    Object? likesCount = null,
  }) {
    return _then(_Comment(
      commentId: null == commentId
          ? _self.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authorUserId: null == authorUserId
          ? _self.authorUserId
          : authorUserId // ignore: cast_nullable_to_non_nullable
              as String,
      parentCommentId: freezed == parentCommentId
          ? _self.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      authorFirstName: freezed == authorFirstName
          ? _self.authorFirstName
          : authorFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorLastName: freezed == authorLastName
          ? _self.authorLastName
          : authorLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPracticeArea: freezed == authorPracticeArea
          ? _self.authorPracticeArea
          : authorPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatarUrl: freezed == authorAvatarUrl
          ? _self.authorAvatarUrl
          : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _self.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
