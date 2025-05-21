// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId;
  @JsonKey(name: 'case_description', includeToJson: false)
  String? get description;
  String? get title;
  @JsonKey(name: 'preferred_practice_area', includeToJson: false)
  String? get practiceArea;
  @JsonKey(name: 'preferred_practice_location', includeToJson: false)
  String? get practiceLocation;
  @JsonKey(name: 'status', includeToJson: false)
  ProjectStatus get status;
  @JsonKey(name: 'user', includeToJson: false)
  AppUser? get user;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @JsonKey(name: 'started_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get startedAt;
  @JsonKey(name: 'completed_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get completedAt;
  @JsonKey(name: 'project_id')
  int? get projectId;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<Project> get copyWith =>
      _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Project &&
            (identical(other.referrerUserId, referrerUserId) ||
                other.referrerUserId == referrerUserId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referrerUserId,
      description,
      title,
      practiceArea,
      practiceLocation,
      status,
      user,
      createdAt,
      startedAt,
      completedAt,
      projectId);

  @override
  String toString() {
    return 'Project(referrerUserId: $referrerUserId, description: $description, title: $title, practiceArea: $practiceArea, practiceLocation: $practiceLocation, status: $status, user: $user, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) =
      _$ProjectCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'referrer_user_id') String? referrerUserId,
      @JsonKey(name: 'case_description', includeToJson: false)
      String? description,
      String? title,
      @JsonKey(name: 'preferred_practice_area', includeToJson: false)
      String? practiceArea,
      @JsonKey(name: 'preferred_practice_location', includeToJson: false)
      String? practiceLocation,
      @JsonKey(name: 'status', includeToJson: false) ProjectStatus status,
      @JsonKey(name: 'user', includeToJson: false) AppUser? user,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'started_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? startedAt,
      @JsonKey(name: 'completed_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? completedAt,
      @JsonKey(name: 'project_id') int? projectId});

  $AppUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referrerUserId = freezed,
    Object? description = freezed,
    Object? title = freezed,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? status = null,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_self.copyWith(
      referrerUserId: freezed == referrerUserId
          ? _self.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Project implements Project {
  const _Project(
      {@JsonKey(name: 'referrer_user_id') required this.referrerUserId,
      @JsonKey(name: 'case_description', includeToJson: false) this.description,
      this.title,
      @JsonKey(name: 'preferred_practice_area', includeToJson: false)
      this.practiceArea,
      @JsonKey(name: 'preferred_practice_location', includeToJson: false)
      this.practiceLocation,
      @JsonKey(name: 'status', includeToJson: false)
      this.status = ProjectStatus.active,
      @JsonKey(name: 'user', includeToJson: false) this.user,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.createdAt,
      @JsonKey(name: 'started_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.startedAt,
      @JsonKey(name: 'completed_at', includeToJson: false)
      @DateTimeJsonConverter()
      this.completedAt,
      @JsonKey(name: 'project_id') this.projectId});
  factory _Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @override
  @JsonKey(name: 'referrer_user_id')
  final String? referrerUserId;
  @override
  @JsonKey(name: 'case_description', includeToJson: false)
  final String? description;
  @override
  final String? title;
  @override
  @JsonKey(name: 'preferred_practice_area', includeToJson: false)
  final String? practiceArea;
  @override
  @JsonKey(name: 'preferred_practice_location', includeToJson: false)
  final String? practiceLocation;
  @override
  @JsonKey(name: 'status', includeToJson: false)
  final ProjectStatus status;
  @override
  @JsonKey(name: 'user', includeToJson: false)
  final AppUser? user;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'started_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? startedAt;
  @override
  @JsonKey(name: 'completed_at', includeToJson: false)
  @DateTimeJsonConverter()
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'project_id')
  final int? projectId;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            (identical(other.referrerUserId, referrerUserId) ||
                other.referrerUserId == referrerUserId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      referrerUserId,
      description,
      title,
      practiceArea,
      practiceLocation,
      status,
      user,
      createdAt,
      startedAt,
      completedAt,
      projectId);

  @override
  String toString() {
    return 'Project(referrerUserId: $referrerUserId, description: $description, title: $title, practiceArea: $practiceArea, practiceLocation: $practiceLocation, status: $status, user: $user, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, projectId: $projectId)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) =
      __$ProjectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'referrer_user_id') String? referrerUserId,
      @JsonKey(name: 'case_description', includeToJson: false)
      String? description,
      String? title,
      @JsonKey(name: 'preferred_practice_area', includeToJson: false)
      String? practiceArea,
      @JsonKey(name: 'preferred_practice_location', includeToJson: false)
      String? practiceLocation,
      @JsonKey(name: 'status', includeToJson: false) ProjectStatus status,
      @JsonKey(name: 'user', includeToJson: false) AppUser? user,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? createdAt,
      @JsonKey(name: 'started_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? startedAt,
      @JsonKey(name: 'completed_at', includeToJson: false)
      @DateTimeJsonConverter()
      DateTime? completedAt,
      @JsonKey(name: 'project_id') int? projectId});

  @override
  $AppUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? referrerUserId = freezed,
    Object? description = freezed,
    Object? title = freezed,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? status = null,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? projectId = freezed,
  }) {
    return _then(_Project(
      referrerUserId: freezed == referrerUserId
          ? _self.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectId: freezed == projectId
          ? _self.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
