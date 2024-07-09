// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Discussion _$DiscussionFromJson(Map<String, dynamic> json) {
  return _Discussion.fromJson(json);
}

/// @nodoc
mixin _$Discussion {
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  int? get discussionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'topic', includeIfNull: false)
  String? get topic => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_id')
  String? get authorId => throw _privateConstructorUsedError;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_member_count', includeIfNull: false)
  int? get activeMemberCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussionCopyWith<Discussion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussionCopyWith<$Res> {
  factory $DiscussionCopyWith(
          Discussion value, $Res Function(Discussion) then) =
      _$DiscussionCopyWithImpl<$Res, Discussion>;
  @useResult
  $Res call(
      {@JsonKey(name: 'discussion_id', includeIfNull: false) int? discussionId,
      @JsonKey(name: 'topic', includeIfNull: false) String? topic,
      @JsonKey(name: 'author_id') String? authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      DateTime? createdAt,
      @JsonKey(name: 'active_member_count', includeIfNull: false)
      int? activeMemberCount});
}

/// @nodoc
class _$DiscussionCopyWithImpl<$Res, $Val extends Discussion>
    implements $DiscussionCopyWith<$Res> {
  _$DiscussionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionId = freezed,
    Object? topic = freezed,
    Object? authorId = freezed,
    Object? createdAt = freezed,
    Object? activeMemberCount = freezed,
  }) {
    return _then(_value.copyWith(
      discussionId: freezed == discussionId
          ? _value.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeMemberCount: freezed == activeMemberCount
          ? _value.activeMemberCount
          : activeMemberCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscussionImplCopyWith<$Res>
    implements $DiscussionCopyWith<$Res> {
  factory _$$DiscussionImplCopyWith(
          _$DiscussionImpl value, $Res Function(_$DiscussionImpl) then) =
      __$$DiscussionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'discussion_id', includeIfNull: false) int? discussionId,
      @JsonKey(name: 'topic', includeIfNull: false) String? topic,
      @JsonKey(name: 'author_id') String? authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      DateTime? createdAt,
      @JsonKey(name: 'active_member_count', includeIfNull: false)
      int? activeMemberCount});
}

/// @nodoc
class __$$DiscussionImplCopyWithImpl<$Res>
    extends _$DiscussionCopyWithImpl<$Res, _$DiscussionImpl>
    implements _$$DiscussionImplCopyWith<$Res> {
  __$$DiscussionImplCopyWithImpl(
      _$DiscussionImpl _value, $Res Function(_$DiscussionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionId = freezed,
    Object? topic = freezed,
    Object? authorId = freezed,
    Object? createdAt = freezed,
    Object? activeMemberCount = freezed,
  }) {
    return _then(_$DiscussionImpl(
      discussionId: freezed == discussionId
          ? _value.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int?,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeMemberCount: freezed == activeMemberCount
          ? _value.activeMemberCount
          : activeMemberCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscussionImpl implements _Discussion {
  _$DiscussionImpl(
      {@JsonKey(name: 'discussion_id', includeIfNull: false) this.discussionId,
      @JsonKey(name: 'topic', includeIfNull: false) this.topic,
      @JsonKey(name: 'author_id') this.authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      this.createdAt,
      @JsonKey(name: 'active_member_count', includeIfNull: false)
      this.activeMemberCount});

  factory _$DiscussionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscussionImplFromJson(json);

  @override
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  final int? discussionId;
  @override
  @JsonKey(name: 'topic', includeIfNull: false)
  final String? topic;
  @override
  @JsonKey(name: 'author_id')
  final String? authorId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'active_member_count', includeIfNull: false)
  final int? activeMemberCount;

  @override
  String toString() {
    return 'Discussion(discussionId: $discussionId, topic: $topic, authorId: $authorId, createdAt: $createdAt, activeMemberCount: $activeMemberCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscussionImpl &&
            (identical(other.discussionId, discussionId) ||
                other.discussionId == discussionId) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.activeMemberCount, activeMemberCount) ||
                other.activeMemberCount == activeMemberCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, discussionId, topic, authorId, createdAt, activeMemberCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscussionImplCopyWith<_$DiscussionImpl> get copyWith =>
      __$$DiscussionImplCopyWithImpl<_$DiscussionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscussionImplToJson(
      this,
    );
  }
}

abstract class _Discussion implements Discussion {
  factory _Discussion(
      {@JsonKey(name: 'discussion_id', includeIfNull: false)
      final int? discussionId,
      @JsonKey(name: 'topic', includeIfNull: false) final String? topic,
      @JsonKey(name: 'author_id') final String? authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      final DateTime? createdAt,
      @JsonKey(name: 'active_member_count', includeIfNull: false)
      final int? activeMemberCount}) = _$DiscussionImpl;

  factory _Discussion.fromJson(Map<String, dynamic> json) =
      _$DiscussionImpl.fromJson;

  @override
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  int? get discussionId;
  @override
  @JsonKey(name: 'topic', includeIfNull: false)
  String? get topic;
  @override
  @JsonKey(name: 'author_id')
  String? get authorId;
  @override
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'active_member_count', includeIfNull: false)
  int? get activeMemberCount;
  @override
  @JsonKey(ignore: true)
  _$$DiscussionImplCopyWith<_$DiscussionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
