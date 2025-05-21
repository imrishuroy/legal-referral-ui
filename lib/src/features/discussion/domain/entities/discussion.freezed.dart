// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discussion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Discussion {
  @JsonKey(name: 'discussion_id', includeIfNull: false)
  int? get discussionId;
  @JsonKey(name: 'topic', includeIfNull: false)
  String? get topic;
  @JsonKey(name: 'author_id')
  String? get authorId;
  @DateTimeJsonConverter()
  @JsonKey(name: 'created_at', includeIfNull: false)
  DateTime? get createdAt;
  @JsonKey(name: 'active_member_count', includeIfNull: false)
  int? get activeMemberCount;

  /// Create a copy of Discussion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiscussionCopyWith<Discussion> get copyWith =>
      _$DiscussionCopyWithImpl<Discussion>(this as Discussion, _$identity);

  /// Serializes this Discussion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Discussion &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, discussionId, topic, authorId, createdAt, activeMemberCount);

  @override
  String toString() {
    return 'Discussion(discussionId: $discussionId, topic: $topic, authorId: $authorId, createdAt: $createdAt, activeMemberCount: $activeMemberCount)';
  }
}

/// @nodoc
abstract mixin class $DiscussionCopyWith<$Res> {
  factory $DiscussionCopyWith(
          Discussion value, $Res Function(Discussion) _then) =
      _$DiscussionCopyWithImpl;
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
class _$DiscussionCopyWithImpl<$Res> implements $DiscussionCopyWith<$Res> {
  _$DiscussionCopyWithImpl(this._self, this._then);

  final Discussion _self;
  final $Res Function(Discussion) _then;

  /// Create a copy of Discussion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionId = freezed,
    Object? topic = freezed,
    Object? authorId = freezed,
    Object? createdAt = freezed,
    Object? activeMemberCount = freezed,
  }) {
    return _then(_self.copyWith(
      discussionId: freezed == discussionId
          ? _self.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int?,
      topic: freezed == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeMemberCount: freezed == activeMemberCount
          ? _self.activeMemberCount
          : activeMemberCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Discussion implements Discussion {
  _Discussion(
      {@JsonKey(name: 'discussion_id', includeIfNull: false) this.discussionId,
      @JsonKey(name: 'topic', includeIfNull: false) this.topic,
      @JsonKey(name: 'author_id') this.authorId,
      @DateTimeJsonConverter()
      @JsonKey(name: 'created_at', includeIfNull: false)
      this.createdAt,
      @JsonKey(name: 'active_member_count', includeIfNull: false)
      this.activeMemberCount});
  factory _Discussion.fromJson(Map<String, dynamic> json) =>
      _$DiscussionFromJson(json);

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

  /// Create a copy of Discussion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiscussionCopyWith<_Discussion> get copyWith =>
      __$DiscussionCopyWithImpl<_Discussion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiscussionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Discussion &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, discussionId, topic, authorId, createdAt, activeMemberCount);

  @override
  String toString() {
    return 'Discussion(discussionId: $discussionId, topic: $topic, authorId: $authorId, createdAt: $createdAt, activeMemberCount: $activeMemberCount)';
  }
}

/// @nodoc
abstract mixin class _$DiscussionCopyWith<$Res>
    implements $DiscussionCopyWith<$Res> {
  factory _$DiscussionCopyWith(
          _Discussion value, $Res Function(_Discussion) _then) =
      __$DiscussionCopyWithImpl;
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
class __$DiscussionCopyWithImpl<$Res> implements _$DiscussionCopyWith<$Res> {
  __$DiscussionCopyWithImpl(this._self, this._then);

  final _Discussion _self;
  final $Res Function(_Discussion) _then;

  /// Create a copy of Discussion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? discussionId = freezed,
    Object? topic = freezed,
    Object? authorId = freezed,
    Object? createdAt = freezed,
    Object? activeMemberCount = freezed,
  }) {
    return _then(_Discussion(
      discussionId: freezed == discussionId
          ? _self.discussionId
          : discussionId // ignore: cast_nullable_to_non_nullable
              as int?,
      topic: freezed == topic
          ? _self.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      activeMemberCount: freezed == activeMemberCount
          ? _self.activeMemberCount
          : activeMemberCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
