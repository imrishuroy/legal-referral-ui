// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Experience {
  String get title;
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation;
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  List<String?> get skills;
  String? get description;
  bool? get current;
  @JsonKey(name: 'firm_id', includeIfNull: false)
  int? get firmId;
  @JsonKey(name: 'experience_id', includeToJson: false)
  int? get experienceId;
  @JsonKey(name: 'user_id', includeToJson: false)
  String? get userId;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExperienceCopyWith<Experience> get copyWith =>
      _$ExperienceCopyWithImpl<Experience>(this as Experience, _$identity);

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Experience &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
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
      const DeepCollectionEquality().hash(skills),
      description,
      current,
      firmId,
      experienceId,
      userId);

  @override
  String toString() {
    return 'Experience(title: $title, practiceArea: $practiceArea, practiceLocation: $practiceLocation, startDate: $startDate, endDate: $endDate, skills: $skills, description: $description, current: $current, firmId: $firmId, experienceId: $experienceId, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
          Experience value, $Res Function(Experience) _then) =
      _$ExperienceCopyWithImpl;
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
class _$ExperienceCopyWithImpl<$Res> implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._self, this._then);

  final Experience _self;
  final $Res Function(Experience) _then;

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
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      skills: null == skills
          ? _self.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      current: freezed == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool?,
      firmId: freezed == firmId
          ? _self.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceId: freezed == experienceId
          ? _self.experienceId
          : experienceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Experience implements Experience {
  const _Experience(
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
  factory _Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

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

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExperienceCopyWith<_Experience> get copyWith =>
      __$ExperienceCopyWithImpl<_Experience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExperienceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Experience &&
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

  @override
  String toString() {
    return 'Experience(title: $title, practiceArea: $practiceArea, practiceLocation: $practiceLocation, startDate: $startDate, endDate: $endDate, skills: $skills, description: $description, current: $current, firmId: $firmId, experienceId: $experienceId, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$ExperienceCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$ExperienceCopyWith(
          _Experience value, $Res Function(_Experience) _then) =
      __$ExperienceCopyWithImpl;
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
class __$ExperienceCopyWithImpl<$Res> implements _$ExperienceCopyWith<$Res> {
  __$ExperienceCopyWithImpl(this._self, this._then);

  final _Experience _self;
  final $Res Function(_Experience) _then;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Experience(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      skills: null == skills
          ? _self._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      current: freezed == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool?,
      firmId: freezed == firmId
          ? _self.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
      experienceId: freezed == experienceId
          ? _self.experienceId
          : experienceId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
