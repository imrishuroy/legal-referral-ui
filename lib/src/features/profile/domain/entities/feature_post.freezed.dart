// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeaturePost {
  @JsonKey(name: 'feature_post_id')
  int get featurePostId;
  Post? get post;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeaturePostCopyWith<FeaturePost> get copyWith =>
      _$FeaturePostCopyWithImpl<FeaturePost>(this as FeaturePost, _$identity);

  /// Serializes this FeaturePost to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeaturePost &&
            (identical(other.featurePostId, featurePostId) ||
                other.featurePostId == featurePostId) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featurePostId, post, createdAt);

  @override
  String toString() {
    return 'FeaturePost(featurePostId: $featurePostId, post: $post, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $FeaturePostCopyWith<$Res> {
  factory $FeaturePostCopyWith(
          FeaturePost value, $Res Function(FeaturePost) _then) =
      _$FeaturePostCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'feature_post_id') int featurePostId,
      Post? post,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      DateTime createdAt});

  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class _$FeaturePostCopyWithImpl<$Res> implements $FeaturePostCopyWith<$Res> {
  _$FeaturePostCopyWithImpl(this._self, this._then);

  final FeaturePost _self;
  final $Res Function(FeaturePost) _then;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featurePostId = null,
    Object? post = freezed,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      featurePostId: null == featurePostId
          ? _self.featurePostId
          : featurePostId // ignore: cast_nullable_to_non_nullable
              as int,
      post: freezed == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of FeaturePost
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
}

/// @nodoc
@JsonSerializable()
class _FeaturePost implements FeaturePost {
  const _FeaturePost(
      {@JsonKey(name: 'feature_post_id') required this.featurePostId,
      required this.post,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required this.createdAt});
  factory _FeaturePost.fromJson(Map<String, dynamic> json) =>
      _$FeaturePostFromJson(json);

  @override
  @JsonKey(name: 'feature_post_id')
  final int featurePostId;
  @override
  final Post? post;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  final DateTime createdAt;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeaturePostCopyWith<_FeaturePost> get copyWith =>
      __$FeaturePostCopyWithImpl<_FeaturePost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeaturePostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeaturePost &&
            (identical(other.featurePostId, featurePostId) ||
                other.featurePostId == featurePostId) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featurePostId, post, createdAt);

  @override
  String toString() {
    return 'FeaturePost(featurePostId: $featurePostId, post: $post, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$FeaturePostCopyWith<$Res>
    implements $FeaturePostCopyWith<$Res> {
  factory _$FeaturePostCopyWith(
          _FeaturePost value, $Res Function(_FeaturePost) _then) =
      __$FeaturePostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'feature_post_id') int featurePostId,
      Post? post,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      DateTime createdAt});

  @override
  $PostCopyWith<$Res>? get post;
}

/// @nodoc
class __$FeaturePostCopyWithImpl<$Res> implements _$FeaturePostCopyWith<$Res> {
  __$FeaturePostCopyWithImpl(this._self, this._then);

  final _FeaturePost _self;
  final $Res Function(_FeaturePost) _then;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? featurePostId = null,
    Object? post = freezed,
    Object? createdAt = null,
  }) {
    return _then(_FeaturePost(
      featurePostId: null == featurePostId
          ? _self.featurePostId
          : featurePostId // ignore: cast_nullable_to_non_nullable
              as int,
      post: freezed == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of FeaturePost
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
}

// dart format on
