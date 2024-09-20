// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @JsonKey(name: 'comment_id')
  int get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_user_id')
  String get authorUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_comment_id')
  int? get parentCommentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_first_name')
  String? get authorFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_last_name')
  String? get authorLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_practice_area')
  String? get authorPracticeArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_avatar_url')
  String? get authorAvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_liked')
  bool get isLiked => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int get likesCount => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
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
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authorUserId: null == authorUserId
          ? _value.authorUserId
          : authorUserId // ignore: cast_nullable_to_non_nullable
              as String,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      authorFirstName: freezed == authorFirstName
          ? _value.authorFirstName
          : authorFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorLastName: freezed == authorLastName
          ? _value.authorLastName
          : authorLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPracticeArea: freezed == authorPracticeArea
          ? _value.authorPracticeArea
          : authorPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatarUrl: freezed == authorAvatarUrl
          ? _value.authorAvatarUrl
          : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
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
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

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
    return _then(_$CommentImpl(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      authorUserId: null == authorUserId
          ? _value.authorUserId
          : authorUserId // ignore: cast_nullable_to_non_nullable
              as String,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as int?,
      authorFirstName: freezed == authorFirstName
          ? _value.authorFirstName
          : authorFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorLastName: freezed == authorLastName
          ? _value.authorLastName
          : authorLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      authorPracticeArea: freezed == authorPracticeArea
          ? _value.authorPracticeArea
          : authorPracticeArea // ignore: cast_nullable_to_non_nullable
              as String?,
      authorAvatarUrl: freezed == authorAvatarUrl
          ? _value.authorAvatarUrl
          : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
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

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

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

  @override
  String toString() {
    return 'Comment(commentId: $commentId, postId: $postId, content: $content, createdAt: $createdAt, authorUserId: $authorUserId, parentCommentId: $parentCommentId, authorFirstName: $authorFirstName, authorLastName: $authorLastName, authorPracticeArea: $authorPracticeArea, authorAvatarUrl: $authorAvatarUrl, isLiked: $isLiked, likesCount: $likesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
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

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {@JsonKey(name: 'comment_id') required final int commentId,
      @JsonKey(name: 'post_id') required final int postId,
      required final String content,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required final DateTime createdAt,
      @JsonKey(name: 'author_user_id') required final String authorUserId,
      @JsonKey(name: 'parent_comment_id') final int? parentCommentId,
      @JsonKey(name: 'author_first_name') final String? authorFirstName,
      @JsonKey(name: 'author_last_name') final String? authorLastName,
      @JsonKey(name: 'author_practice_area') final String? authorPracticeArea,
      @JsonKey(name: 'author_avatar_url') final String? authorAvatarUrl,
      @JsonKey(name: 'is_liked') final bool isLiked,
      @JsonKey(name: 'likes_count') final int likesCount}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  @JsonKey(name: 'comment_id')
  int get commentId;
  @override
  @JsonKey(name: 'post_id')
  int get postId;
  @override
  String get content;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @JsonKey(name: 'author_user_id')
  String get authorUserId;
  @override
  @JsonKey(name: 'parent_comment_id')
  int? get parentCommentId;
  @override
  @JsonKey(name: 'author_first_name')
  String? get authorFirstName;
  @override
  @JsonKey(name: 'author_last_name')
  String? get authorLastName;
  @override
  @JsonKey(name: 'author_practice_area')
  String? get authorPracticeArea;
  @override
  @JsonKey(name: 'author_avatar_url')
  String? get authorAvatarUrl;
  @override
  @JsonKey(name: 'is_liked')
  bool get isLiked;
  @override
  @JsonKey(name: 'likes_count')
  int get likesCount;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
