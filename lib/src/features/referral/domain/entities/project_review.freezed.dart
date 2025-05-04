// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectReview {
  @JsonKey(name: 'project_id')
  int? get projectId;
  @JsonKey(name: 'user_id')
  String? get userId;
  String? get review;
  double get rating;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @JsonKey(name: 'review_id', includeIfNull: false)
  int? get reviewId;

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectReviewCopyWith<ProjectReview> get copyWith =>
      _$ProjectReviewCopyWithImpl<ProjectReview>(
          this as ProjectReview, _$identity);

  /// Serializes this ProjectReview to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProjectReview &&
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

  @override
  String toString() {
    return 'ProjectReview(projectId: $projectId, userId: $userId, review: $review, rating: $rating, createdAt: $createdAt, reviewId: $reviewId)';
  }
}

/// @nodoc
abstract mixin class $ProjectReviewCopyWith<$Res> {
  factory $ProjectReviewCopyWith(
          ProjectReview value, $Res Function(ProjectReview) _then) =
      _$ProjectReviewCopyWithImpl;
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
class _$ProjectReviewCopyWithImpl<$Res>
    implements $ProjectReviewCopyWith<$Res> {
  _$ProjectReviewCopyWithImpl(this._self, this._then);

  final ProjectReview _self;
  final $Res Function(ProjectReview) _then;

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
    return _then(_self.copyWith(
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewId: freezed == reviewId
          ? _self.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProjectReview implements ProjectReview {
  const _ProjectReview(
      {@JsonKey(name: 'project_id') required this.projectId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.review,
      required this.rating,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.createdAt,
      @JsonKey(name: 'review_id', includeIfNull: false) this.reviewId});
  factory _ProjectReview.fromJson(Map<String, dynamic> json) =>
      _$ProjectReviewFromJson(json);

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

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectReviewCopyWith<_ProjectReview> get copyWith =>
      __$ProjectReviewCopyWithImpl<_ProjectReview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectReviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectReview &&
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

  @override
  String toString() {
    return 'ProjectReview(projectId: $projectId, userId: $userId, review: $review, rating: $rating, createdAt: $createdAt, reviewId: $reviewId)';
  }
}

/// @nodoc
abstract mixin class _$ProjectReviewCopyWith<$Res>
    implements $ProjectReviewCopyWith<$Res> {
  factory _$ProjectReviewCopyWith(
          _ProjectReview value, $Res Function(_ProjectReview) _then) =
      __$ProjectReviewCopyWithImpl;
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
class __$ProjectReviewCopyWithImpl<$Res>
    implements _$ProjectReviewCopyWith<$Res> {
  __$ProjectReviewCopyWithImpl(this._self, this._then);

  final _ProjectReview _self;
  final $Res Function(_ProjectReview) _then;

  /// Create a copy of ProjectReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
    Object? review = freezed,
    Object? rating = null,
    Object? createdAt = freezed,
    Object? reviewId = freezed,
  }) {
    return _then(_ProjectReview(
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reviewId: freezed == reviewId
          ? _self.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
