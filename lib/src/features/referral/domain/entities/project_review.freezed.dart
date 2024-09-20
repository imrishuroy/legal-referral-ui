// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectReview _$ProjectReviewFromJson(Map<String, dynamic> json) {
  return _ProjectReview.fromJson(json);
}

/// @nodoc
mixin _$ProjectReview {
  @JsonKey(name: 'project_id')
  int? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_id', includeIfNull: false)
  int? get reviewId => throw _privateConstructorUsedError;

  /// Serializes this ProjectReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectReviewCopyWith<ProjectReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectReviewCopyWith<$Res> {
  factory $ProjectReviewCopyWith(
          ProjectReview value, $Res Function(ProjectReview) then) =
      _$ProjectReviewCopyWithImpl<$Res, ProjectReview>;
  @useResult
  $Res call(
      {@JsonKey(name: 'project_id') int? projectId,
      @JsonKey(name: 'user_id') String? userId,
      String? review,
      double rating,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'review_id', includeIfNull: false) int? reviewId});
}

/// @nodoc
class _$ProjectReviewCopyWithImpl<$Res, $Val extends ProjectReview>
    implements $ProjectReviewCopyWith<$Res> {
  _$ProjectReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? review = freezed,
    Object? rating = null,
    Object? createdAt = freezed,
    Object? reviewId = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectReviewImplCopyWith<$Res>
    implements $ProjectReviewCopyWith<$Res> {
  factory _$$ProjectReviewImplCopyWith(
          _$ProjectReviewImpl value, $Res Function(_$ProjectReviewImpl) then) =
      __$$ProjectReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'project_id') int? projectId,
      @JsonKey(name: 'user_id') String? userId,
      String? review,
      double rating,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'review_id', includeIfNull: false) int? reviewId});
}

/// @nodoc
class __$$ProjectReviewImplCopyWithImpl<$Res>
    extends _$ProjectReviewCopyWithImpl<$Res, _$ProjectReviewImpl>
    implements _$$ProjectReviewImplCopyWith<$Res> {
  __$$ProjectReviewImplCopyWithImpl(
      _$ProjectReviewImpl _value, $Res Function(_$ProjectReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? review = freezed,
    Object? rating = null,
    Object? createdAt = freezed,
    Object? reviewId = freezed,
  }) {
    return _then(_$ProjectReviewImpl(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewId: freezed == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectReviewImpl implements _ProjectReview {
  const _$ProjectReviewImpl(
      {@JsonKey(name: 'project_id') required this.projectId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.review,
      required this.rating,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.createdAt,
      @JsonKey(name: 'review_id', includeIfNull: false) this.reviewId});

  factory _$ProjectReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectReviewImplFromJson(json);

  @override
  @JsonKey(name: 'project_id')
  final int? projectId;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? review;
  @override
  final double rating;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'review_id', includeIfNull: false)
  final int? reviewId;

  @override
  String toString() {
    return 'ProjectReview(projectId: $projectId, userId: $userId, review: $review, rating: $rating, createdAt: $createdAt, reviewId: $reviewId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectReviewImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, projectId, userId, review, rating, createdAt, reviewId);

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectReviewImplCopyWith<_$ProjectReviewImpl> get copyWith =>
      __$$ProjectReviewImplCopyWithImpl<_$ProjectReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectReviewImplToJson(
      this,
    );
  }
}

abstract class _ProjectReview implements ProjectReview {
  const factory _ProjectReview(
      {@JsonKey(name: 'project_id') required final int? projectId,
      @JsonKey(name: 'user_id') required final String? userId,
      required final String? review,
      required final double rating,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'review_id', includeIfNull: false)
      final int? reviewId}) = _$ProjectReviewImpl;

  factory _ProjectReview.fromJson(Map<String, dynamic> json) =
      _$ProjectReviewImpl.fromJson;

  @override
  @JsonKey(name: 'project_id')
  int? get projectId;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get review;
  @override
  double get rating;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'review_id', includeIfNull: false)
  int? get reviewId;

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectReviewImplCopyWith<_$ProjectReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
