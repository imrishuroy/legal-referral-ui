// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return _Experience.fromJson(json);
}

/// @nodoc
mixin _$Experience {
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_area')
  String? get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation => throw _privateConstructorUsedError;
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  List<String?> get skills => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get current => throw _privateConstructorUsedError;
  @JsonKey(name: 'firm_id', includeIfNull: false)
  int? get firmId => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_id', includeToJson: false)
  int? get experienceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeToJson: false)
  String? get userId => throw _privateConstructorUsedError;

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperienceCopyWith<Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
          Experience value, $Res Function(Experience) then) =
      _$ExperienceCopyWithImpl<$Res, Experience>;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      DateTime? startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      DateTime? endDate,
      List<String?> skills,
      String? description,
      bool? current,
      @JsonKey(name: 'firm_id', includeIfNull: false) int? firmId,
      @JsonKey(name: 'experience_id', includeToJson: false) int? experienceId,
      @JsonKey(name: 'user_id', includeToJson: false) String? userId});
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? skills = null,
    Object? description = freezed,
    Object? current = freezed,
    Object? firmId = freezed,
    Object? experienceId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool?,
      firmId: freezed == firmId
          ? _value.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceId: freezed == experienceId
          ? _value.experienceId
          : experienceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperienceImplCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$$ExperienceImplCopyWith(
          _$ExperienceImpl value, $Res Function(_$ExperienceImpl) then) =
      __$$ExperienceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: 'practice_area') String? practiceArea,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      DateTime? startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      DateTime? endDate,
      List<String?> skills,
      String? description,
      bool? current,
      @JsonKey(name: 'firm_id', includeIfNull: false) int? firmId,
      @JsonKey(name: 'experience_id', includeToJson: false) int? experienceId,
      @JsonKey(name: 'user_id', includeToJson: false) String? userId});
}

/// @nodoc
class __$$ExperienceImplCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$ExperienceImpl>
    implements _$$ExperienceImplCopyWith<$Res> {
  __$$ExperienceImplCopyWithImpl(
      _$ExperienceImpl _value, $Res Function(_$ExperienceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? skills = null,
    Object? description = freezed,
    Object? current = freezed,
    Object? firmId = freezed,
    Object? experienceId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$ExperienceImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool?,
      firmId: freezed == firmId
          ? _value.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceId: freezed == experienceId
          ? _value.experienceId
          : experienceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceImpl implements _Experience {
  const _$ExperienceImpl(
      {required this.title,
      @JsonKey(name: 'practice_area') required this.practiceArea,
      @JsonKey(name: 'practice_location') required this.practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      required this.startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      required this.endDate,
      required final List<String?> skills,
      required this.description,
      this.current = false,
      @JsonKey(name: 'firm_id', includeIfNull: false) this.firmId,
      @JsonKey(name: 'experience_id', includeToJson: false) this.experienceId,
      @JsonKey(name: 'user_id', includeToJson: false) this.userId})
      : _skills = skills;

  factory _$ExperienceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceImplFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'practice_area')
  final String? practiceArea;
  @override
  @JsonKey(name: 'practice_location')
  final String? practiceLocation;
  @override
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  final List<String?> _skills;
  @override
  List<String?> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final String? description;
  @override
  @JsonKey()
  final bool? current;
  @override
  @JsonKey(name: 'firm_id', includeIfNull: false)
  final int? firmId;
  @override
  @JsonKey(name: 'experience_id', includeToJson: false)
  final int? experienceId;
  @override
  @JsonKey(name: 'user_id', includeToJson: false)
  final String? userId;

  @override
  String toString() {
    return 'Experience(title: $title, practiceArea: $practiceArea, practiceLocation: $practiceLocation, startDate: $startDate, endDate: $endDate, skills: $skills, description: $description, current: $current, firmId: $firmId, experienceId: $experienceId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.firmId, firmId) || other.firmId == firmId) &&
            (identical(other.experienceId, experienceId) ||
                other.experienceId == experienceId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      practiceArea,
      practiceLocation,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_skills),
      description,
      current,
      firmId,
      experienceId,
      userId);

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      __$$ExperienceImplCopyWithImpl<_$ExperienceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperienceImplToJson(
      this,
    );
  }
}

abstract class _Experience implements Experience {
  const factory _Experience(
      {required final String title,
      @JsonKey(name: 'practice_area') required final String? practiceArea,
      @JsonKey(name: 'practice_location')
      required final String? practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      required final DateTime? startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      required final DateTime? endDate,
      required final List<String?> skills,
      required final String? description,
      final bool? current,
      @JsonKey(name: 'firm_id', includeIfNull: false) final int? firmId,
      @JsonKey(name: 'experience_id', includeToJson: false)
      final int? experienceId,
      @JsonKey(name: 'user_id', includeToJson: false)
      final String? userId}) = _$ExperienceImpl;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$ExperienceImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @override
  @JsonKey(name: 'practice_location')
  String? get practiceLocation;
  @override
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  List<String?> get skills;
  @override
  String? get description;
  @override
  bool? get current;
  @override
  @JsonKey(name: 'firm_id', includeIfNull: false)
  int? get firmId;
  @override
  @JsonKey(name: 'experience_id', includeToJson: false)
  int? get experienceId;
  @override
  @JsonKey(name: 'user_id', includeToJson: false)
  String? get userId;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
