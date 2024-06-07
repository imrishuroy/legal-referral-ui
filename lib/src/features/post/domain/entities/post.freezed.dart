// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @JsonKey(name: 'post_id')
  String get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  PostType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'poll_id', includeIfNull: false)
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File> get files => throw _privateConstructorUsedError;
  String? get pollId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@JsonKey(name: 'post_id') String postId,
      @JsonKey(name: 'owner_id') String ownerId,
      String title,
      String content,
      PostType type,
      @JsonKey(name: 'poll_id', includeIfNull: false)
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      DateTime createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false) List<File> files,
      String? pollId});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? ownerId = null,
    Object? title = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
    Object? files = null,
    Object? pollId = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'post_id') String postId,
      @JsonKey(name: 'owner_id') String ownerId,
      String title,
      String content,
      PostType type,
      @JsonKey(name: 'poll_id', includeIfNull: false)
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      DateTime createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false) List<File> files,
      String? pollId});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? ownerId = null,
    Object? title = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
    Object? files = null,
    Object? pollId = freezed,
  }) {
    return _then(_$PostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<File>,
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {@JsonKey(name: 'post_id') required this.postId,
      @JsonKey(name: 'owner_id') required this.ownerId,
      required this.title,
      required this.content,
      required this.type,
      @JsonKey(name: 'poll_id', includeIfNull: false)
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required this.createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<File> files = const [],
      this.pollId})
      : _files = files;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @JsonKey(name: 'post_id')
  final String postId;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  final String title;
  @override
  final String content;
  @override
  final PostType type;
  @override
  @JsonKey(name: 'poll_id', includeIfNull: false)
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  final DateTime createdAt;
  final List<File> _files;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final String? pollId;

  @override
  String toString() {
    return 'Post(postId: $postId, ownerId: $ownerId, title: $title, content: $content, type: $type, createdAt: $createdAt, files: $files, pollId: $pollId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.pollId, pollId) || other.pollId == pollId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postId, ownerId, title, content,
      type, createdAt, const DeepCollectionEquality().hash(_files), pollId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {@JsonKey(name: 'post_id') required final String postId,
      @JsonKey(name: 'owner_id') required final String ownerId,
      required final String title,
      required final String content,
      required final PostType type,
      @JsonKey(name: 'poll_id', includeIfNull: false)
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required final DateTime createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<File> files,
      final String? pollId}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  @JsonKey(name: 'post_id')
  String get postId;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  String get title;
  @override
  String get content;
  @override
  PostType get type;
  @override
  @JsonKey(name: 'poll_id', includeIfNull: false)
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File> get files;
  @override
  String? get pollId;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
