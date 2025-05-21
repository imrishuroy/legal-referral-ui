// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Education {
  String? get degree;
  String? get school;
  @JsonKey(name: 'field_of_study')
  String? get fieldOfStudy;
  @EducationDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @EducationDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @JsonKey(name: 'current')
  bool get current;
  String? get grade;
  String? get achievements;
  List<String> get skills;
  @JsonKey(name: 'education_id', includeToJson: false)
  int? get educationId;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EducationCopyWith<Education> get copyWith =>
      _$EducationCopyWithImpl<Education>(this as Education, _$identity);

  /// Serializes this Education to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Education &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.fieldOfStudy, fieldOfStudy) ||
                other.fieldOfStudy == fieldOfStudy) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.achievements, achievements) ||
                other.achievements == achievements) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
            (identical(other.educationId, educationId) ||
                other.educationId == educationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      degree,
      school,
      fieldOfStudy,
      startDate,
      endDate,
      current,
      grade,
      achievements,
      const DeepCollectionEquality().hash(skills),
      educationId);

  @override
  String toString() {
    return 'Education(degree: $degree, school: $school, fieldOfStudy: $fieldOfStudy, startDate: $startDate, endDate: $endDate, current: $current, grade: $grade, achievements: $achievements, skills: $skills, educationId: $educationId)';
  }
}

/// @nodoc
abstract mixin class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) _then) =
      _$EducationCopyWithImpl;
  @useResult
  $Res call(
      {String? degree,
      String? school,
      @JsonKey(name: 'field_of_study') String? fieldOfStudy,
      @EducationDateTimeConverter()
      @JsonKey(name: 'start_date')
      DateTime? startDate,
      @EducationDateTimeConverter()
      @JsonKey(name: 'end_date')
      DateTime? endDate,
      @JsonKey(name: 'current') bool current,
      String? grade,
      String? achievements,
      List<String> skills,
      @JsonKey(name: 'education_id', includeToJson: false) int? educationId});
}

/// @nodoc
class _$EducationCopyWithImpl<$Res> implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._self, this._then);

  final Education _self;
  final $Res Function(Education) _then;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degree = freezed,
    Object? school = freezed,
    Object? fieldOfStudy = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? current = null,
    Object? grade = freezed,
    Object? achievements = freezed,
    Object? skills = null,
    Object? educationId = freezed,
  }) {
    return _then(_self.copyWith(
      degree: freezed == degree
          ? _self.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      school: freezed == school
          ? _self.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldOfStudy: freezed == fieldOfStudy
          ? _self.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: freezed == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      achievements: freezed == achievements
          ? _self.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: null == skills
          ? _self.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      educationId: freezed == educationId
          ? _self.educationId
          : educationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Education implements Education {
  const _Education(
      {required this.degree,
      required this.school,
      @JsonKey(name: 'field_of_study') required this.fieldOfStudy,
      @EducationDateTimeConverter()
      @JsonKey(name: 'start_date')
      required this.startDate,
      @EducationDateTimeConverter()
      @JsonKey(name: 'end_date')
      required this.endDate,
      @JsonKey(name: 'current') required this.current,
      required this.grade,
      required this.achievements,
      required final List<String> skills,
      @JsonKey(name: 'education_id', includeToJson: false) this.educationId})
      : _skills = skills;
  factory _Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  @override
  final String? degree;
  @override
  final String? school;
  @override
  @JsonKey(name: 'field_of_study')
  final String? fieldOfStudy;
  @override
  @EducationDateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @EducationDateTimeConverter()
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'current')
  final bool current;
  @override
  final String? grade;
  @override
  final String? achievements;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey(name: 'education_id', includeToJson: false)
  final int? educationId;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EducationCopyWith<_Education> get copyWith =>
      __$EducationCopyWithImpl<_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EducationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Education &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.fieldOfStudy, fieldOfStudy) ||
                other.fieldOfStudy == fieldOfStudy) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.achievements, achievements) ||
                other.achievements == achievements) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.educationId, educationId) ||
                other.educationId == educationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      degree,
      school,
      fieldOfStudy,
      startDate,
      endDate,
      current,
      grade,
      achievements,
      const DeepCollectionEquality().hash(_skills),
      educationId);

  @override
  String toString() {
    return 'Education(degree: $degree, school: $school, fieldOfStudy: $fieldOfStudy, startDate: $startDate, endDate: $endDate, current: $current, grade: $grade, achievements: $achievements, skills: $skills, educationId: $educationId)';
  }
}

/// @nodoc
abstract mixin class _$EducationCopyWith<$Res>
    implements $EducationCopyWith<$Res> {
  factory _$EducationCopyWith(
          _Education value, $Res Function(_Education) _then) =
      __$EducationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? degree,
      String? school,
      @JsonKey(name: 'field_of_study') String? fieldOfStudy,
      @EducationDateTimeConverter()
      @JsonKey(name: 'start_date')
      DateTime? startDate,
      @EducationDateTimeConverter()
      @JsonKey(name: 'end_date')
      DateTime? endDate,
      @JsonKey(name: 'current') bool current,
      String? grade,
      String? achievements,
      List<String> skills,
      @JsonKey(name: 'education_id', includeToJson: false) int? educationId});
}

/// @nodoc
class __$EducationCopyWithImpl<$Res> implements _$EducationCopyWith<$Res> {
  __$EducationCopyWithImpl(this._self, this._then);

  final _Education _self;
  final $Res Function(_Education) _then;

  /// Create a copy of Education
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? degree = freezed,
    Object? school = freezed,
    Object? fieldOfStudy = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? current = null,
    Object? grade = freezed,
    Object? achievements = freezed,
    Object? skills = null,
    Object? educationId = freezed,
  }) {
    return _then(_Education(
      degree: freezed == degree
          ? _self.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      school: freezed == school
          ? _self.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldOfStudy: freezed == fieldOfStudy
          ? _self.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: freezed == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      achievements: freezed == achievements
          ? _self.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: null == skills
          ? _self._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      educationId: freezed == educationId
          ? _self.educationId
          : educationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
