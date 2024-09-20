// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
mixin _$Project {
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'case_description', includeToJson: false)
  String? get description => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_area', includeToJson: false)
  String? get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_practice_location', includeToJson: false)
  String? get practiceLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', includeToJson: false)
  ProjectStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'user', includeToJson: false)
  AppUser? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  int? get projectId => throw _privateConstructorUsedError;

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res, Project>;
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
class _$ProjectCopyWithImpl<$Res, $Val extends Project>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      referrerUserId: freezed == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $AppUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectImplCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$$ProjectImplCopyWith(
          _$ProjectImpl value, $Res Function(_$ProjectImpl) then) =
      __$$ProjectImplCopyWithImpl<$Res>;
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
class __$$ProjectImplCopyWithImpl<$Res>
    extends _$ProjectCopyWithImpl<$Res, _$ProjectImpl>
    implements _$$ProjectImplCopyWith<$Res> {
  __$$ProjectImplCopyWithImpl(
      _$ProjectImpl _value, $Res Function(_$ProjectImpl) _then)
      : super(_value, _then);

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
    return _then(_$ProjectImpl(
      referrerUserId: freezed == referrerUserId
          ? _value.referrerUserId
          : referrerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectImpl implements _Project {
  const _$ProjectImpl(
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

  factory _$ProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectImplFromJson(json);

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

  @override
  String toString() {
    return 'Project(referrerUserId: $referrerUserId, description: $description, title: $title, practiceArea: $practiceArea, practiceLocation: $practiceLocation, status: $status, user: $user, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectImpl &&
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

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      __$$ProjectImplCopyWithImpl<_$ProjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectImplToJson(
      this,
    );
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {@JsonKey(name: 'referrer_user_id') required final String? referrerUserId,
      @JsonKey(name: 'case_description', includeToJson: false)
      final String? description,
      final String? title,
      @JsonKey(name: 'preferred_practice_area', includeToJson: false)
      final String? practiceArea,
      @JsonKey(name: 'preferred_practice_location', includeToJson: false)
      final String? practiceLocation,
      @JsonKey(name: 'status', includeToJson: false) final ProjectStatus status,
      @JsonKey(name: 'user', includeToJson: false) final AppUser? user,
      @JsonKey(name: 'created_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? createdAt,
      @JsonKey(name: 'started_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? startedAt,
      @JsonKey(name: 'completed_at', includeToJson: false)
      @DateTimeJsonConverter()
      final DateTime? completedAt,
      @JsonKey(name: 'project_id') final int? projectId}) = _$ProjectImpl;

  factory _Project.fromJson(Map<String, dynamic> json) = _$ProjectImpl.fromJson;

  @override
  @JsonKey(name: 'referrer_user_id')
  String? get referrerUserId;
  @override
  @JsonKey(name: 'case_description', includeToJson: false)
  String? get description;
  @override
  String? get title;
  @override
  @JsonKey(name: 'preferred_practice_area', includeToJson: false)
  String? get practiceArea;
  @override
  @JsonKey(name: 'preferred_practice_location', includeToJson: false)
  String? get practiceLocation;
  @override
  @JsonKey(name: 'status', includeToJson: false)
  ProjectStatus get status;
  @override
  @JsonKey(name: 'user', includeToJson: false)
  AppUser? get user;
  @override
  @JsonKey(name: 'created_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'started_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get startedAt;
  @override
  @JsonKey(name: 'completed_at', includeToJson: false)
  @DateTimeJsonConverter()
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'project_id')
  int? get projectId;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectImplCopyWith<_$ProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
