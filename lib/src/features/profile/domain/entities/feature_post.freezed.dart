// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeaturePost _$FeaturePostFromJson(Map<String, dynamic> json) {
  return _FeaturePost.fromJson(json);
}

/// @nodoc
mixin _$FeaturePost {
  @JsonKey(name: 'feature_post_id')
  int get featurePostId => throw _privateConstructorUsedError;
  Post? get post => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeaturePost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeaturePostCopyWith<FeaturePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturePostCopyWith<$Res> {
  factory $FeaturePostCopyWith(
          FeaturePost value, $Res Function(FeaturePost) then) =
      _$FeaturePostCopyWithImpl<$Res, FeaturePost>;
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
class _$FeaturePostCopyWithImpl<$Res, $Val extends FeaturePost>
    implements $FeaturePostCopyWith<$Res> {
  _$FeaturePostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featurePostId = null,
    Object? post = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      featurePostId: null == featurePostId
          ? _value.featurePostId
          : featurePostId // ignore: cast_nullable_to_non_nullable
              as int,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res>? get post {
    if (_value.post == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.post!, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeaturePostImplCopyWith<$Res>
    implements $FeaturePostCopyWith<$Res> {
  factory _$$FeaturePostImplCopyWith(
          _$FeaturePostImpl value, $Res Function(_$FeaturePostImpl) then) =
      __$$FeaturePostImplCopyWithImpl<$Res>;
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
class __$$FeaturePostImplCopyWithImpl<$Res>
    extends _$FeaturePostCopyWithImpl<$Res, _$FeaturePostImpl>
    implements _$$FeaturePostImplCopyWith<$Res> {
  __$$FeaturePostImplCopyWithImpl(
      _$FeaturePostImpl _value, $Res Function(_$FeaturePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featurePostId = null,
    Object? post = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$FeaturePostImpl(
      featurePostId: null == featurePostId
          ? _value.featurePostId
          : featurePostId // ignore: cast_nullable_to_non_nullable
              as int,
      post: freezed == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturePostImpl implements _FeaturePost {
  const _$FeaturePostImpl(
      {@JsonKey(name: 'feature_post_id') required this.featurePostId,
      required this.post,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required this.createdAt});

  factory _$FeaturePostImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturePostImplFromJson(json);

  @override
  @JsonKey(name: 'feature_post_id')
  final int featurePostId;
  @override
  final Post? post;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'FeaturePost(featurePostId: $featurePostId, post: $post, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturePostImpl &&
            (identical(other.featurePostId, featurePostId) ||
                other.featurePostId == featurePostId) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, featurePostId, post, createdAt);

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturePostImplCopyWith<_$FeaturePostImpl> get copyWith =>
      __$$FeaturePostImplCopyWithImpl<_$FeaturePostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturePostImplToJson(
      this,
    );
  }
}

abstract class _FeaturePost implements FeaturePost {
  const factory _FeaturePost(
      {@JsonKey(name: 'feature_post_id') required final int featurePostId,
      required final Post? post,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required final DateTime createdAt}) = _$FeaturePostImpl;

  factory _FeaturePost.fromJson(Map<String, dynamic> json) =
      _$FeaturePostImpl.fromJson;

  @override
  @JsonKey(name: 'feature_post_id')
  int get featurePostId;
  @override
  Post? get post;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;

  /// Create a copy of FeaturePost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeaturePostImplCopyWith<_$FeaturePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
