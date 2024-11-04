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
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_type')
  PostType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_first_name')
  String? get ownerFirstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_last_name')
  String? get ownerLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_avatar_url')
  String? get ownerAvatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_practice_area')
  String? get ownerPracticeArea => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  List<String?> get filesUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'poll_id', includeIfNull: false)
  int? get pollId => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'post_type') PostType type,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime createdAt,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'owner_first_name') String? ownerFirstName,
      @JsonKey(name: 'owner_last_name') String? ownerLastName,
      @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
      String? content,
      @JsonKey(name: 'media') List<String?> filesUrls,
      @JsonKey(name: 'poll_id', includeIfNull: false) int? pollId});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? type = null,
    Object? createdAt = null,
    Object? postId = null,
    Object? ownerFirstName = freezed,
    Object? ownerLastName = freezed,
    Object? ownerAvatarUrl = freezed,
    Object? ownerPracticeArea = freezed,
    Object? content = freezed,
    Object? filesUrls = null,
    Object? pollId = freezed,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
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
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      filesUrls: null == filesUrls
          ? _value.filesUrls
          : filesUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'post_type') PostType type,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime createdAt,
      @JsonKey(name: 'post_id') int postId,
      @JsonKey(name: 'owner_first_name') String? ownerFirstName,
      @JsonKey(name: 'owner_last_name') String? ownerLastName,
      @JsonKey(name: 'owner_avatar_url') String? ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') String? ownerPracticeArea,
      String? content,
      @JsonKey(name: 'media') List<String?> filesUrls,
      @JsonKey(name: 'poll_id', includeIfNull: false) int? pollId});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? type = null,
    Object? createdAt = null,
    Object? postId = null,
    Object? ownerFirstName = freezed,
    Object? ownerLastName = freezed,
    Object? ownerAvatarUrl = freezed,
    Object? ownerPracticeArea = freezed,
    Object? content = freezed,
    Object? filesUrls = null,
    Object? pollId = freezed,
  }) {
    return _then(_$PostImpl(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
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
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      filesUrls: null == filesUrls
          ? _value._filesUrls
          : filesUrls // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {@JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'post_type') required this.type,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      required this.createdAt,
      @JsonKey(name: 'post_id') required this.postId,
      @JsonKey(name: 'owner_first_name') this.ownerFirstName,
      @JsonKey(name: 'owner_last_name') this.ownerLastName,
      @JsonKey(name: 'owner_avatar_url') this.ownerAvatarUrl,
      @JsonKey(name: 'owner_practice_area') this.ownerPracticeArea,
      this.content,
      @JsonKey(name: 'media') final List<String?> filesUrls = const [],
      @JsonKey(name: 'poll_id', includeIfNull: false) this.pollId})
      : _filesUrls = filesUrls;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'post_type')
  final PostType type;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @JsonKey(name: 'post_id')
  final int postId;
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
  final List<String?> _filesUrls;
  @override
  @JsonKey(name: 'media')
  List<String?> get filesUrls {
    if (_filesUrls is EqualUnmodifiableListView) return _filesUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filesUrls);
  }

  @override
  @JsonKey(name: 'poll_id', includeIfNull: false)
  final int? pollId;

  @override
  String toString() {
    return 'Post(ownerId: $ownerId, type: $type, createdAt: $createdAt, postId: $postId, ownerFirstName: $ownerFirstName, ownerLastName: $ownerLastName, ownerAvatarUrl: $ownerAvatarUrl, ownerPracticeArea: $ownerPracticeArea, content: $content, filesUrls: $filesUrls, pollId: $pollId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.ownerFirstName, ownerFirstName) ||
                other.ownerFirstName == ownerFirstName) &&
            (identical(other.ownerLastName, ownerLastName) ||
                other.ownerLastName == ownerLastName) &&
            (identical(other.ownerAvatarUrl, ownerAvatarUrl) ||
                other.ownerAvatarUrl == ownerAvatarUrl) &&
            (identical(other.ownerPracticeArea, ownerPracticeArea) ||
                other.ownerPracticeArea == ownerPracticeArea) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._filesUrls, _filesUrls) &&
            (identical(other.pollId, pollId) || other.pollId == pollId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ownerId,
      type,
      createdAt,
      postId,
      ownerFirstName,
      ownerLastName,
      ownerAvatarUrl,
      ownerPracticeArea,
      content,
      const DeepCollectionEquality().hash(_filesUrls),
      pollId);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          {@JsonKey(name: 'owner_id') required final String ownerId,
          @JsonKey(name: 'post_type') required final PostType type,
          @JsonKey(name: 'created_at', includeToJson: false)
          @DateTimeJsonConverter()
          required final DateTime createdAt,
          @JsonKey(name: 'post_id') required final int postId,
          @JsonKey(name: 'owner_first_name') final String? ownerFirstName,
          @JsonKey(name: 'owner_last_name') final String? ownerLastName,
          @JsonKey(name: 'owner_avatar_url') final String? ownerAvatarUrl,
          @JsonKey(name: 'owner_practice_area') final String? ownerPracticeArea,
          final String? content,
          @JsonKey(name: 'media') final List<String?> filesUrls,
          @JsonKey(name: 'poll_id', includeIfNull: false) final int? pollId}) =
      _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'post_type')
  PostType get type;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @override
  @JsonKey(name: 'post_id')
  int get postId;
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
  String? get content;
  @override
  @JsonKey(name: 'media')
  List<String?> get filesUrls;
  @override
  @JsonKey(name: 'poll_id', includeIfNull: false)
  int? get pollId;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
