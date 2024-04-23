// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  String? get degree => throw _privateConstructorUsedError;
  String? get school => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_of_study')
  String? get fieldOfStudy => throw _privateConstructorUsedError;
  @EducationDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @EducationDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'current')
  bool get current => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  String? get achievements => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'education_id', includeToJson: false)
  int? get educationId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
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
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldOfStudy: freezed == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      achievements: freezed == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      educationId: freezed == educationId
          ? _value.educationId
          : educationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationImplCopyWith<$Res>
    implements $EducationCopyWith<$Res> {
  factory _$$EducationImplCopyWith(
          _$EducationImpl value, $Res Function(_$EducationImpl) then) =
      __$$EducationImplCopyWithImpl<$Res>;
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
class __$$EducationImplCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$EducationImpl>
    implements _$$EducationImplCopyWith<$Res> {
  __$$EducationImplCopyWithImpl(
      _$EducationImpl _value, $Res Function(_$EducationImpl) _then)
      : super(_value, _then);

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
    return _then(_$EducationImpl(
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldOfStudy: freezed == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      achievements: freezed == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      educationId: freezed == educationId
          ? _value.educationId
          : educationId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EducationImpl implements _Education {
  const _$EducationImpl(
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

  factory _$EducationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationImplFromJson(json);

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

  @override
  String toString() {
    return 'Education(degree: $degree, school: $school, fieldOfStudy: $fieldOfStudy, startDate: $startDate, endDate: $endDate, current: $current, grade: $grade, achievements: $achievements, skills: $skills, educationId: $educationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationImplCopyWith<_$EducationImpl> get copyWith =>
      __$$EducationImplCopyWithImpl<_$EducationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationImplToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {required final String? degree,
      required final String? school,
      @JsonKey(name: 'field_of_study') required final String? fieldOfStudy,
      @EducationDateTimeConverter()
      @JsonKey(name: 'start_date')
      required final DateTime? startDate,
      @EducationDateTimeConverter()
      @JsonKey(name: 'end_date')
      required final DateTime? endDate,
      @JsonKey(name: 'current') required final bool current,
      required final String? grade,
      required final String? achievements,
      required final List<String> skills,
      @JsonKey(name: 'education_id', includeToJson: false)
      final int? educationId}) = _$EducationImpl;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$EducationImpl.fromJson;

  @override
  String? get degree;
  @override
  String? get school;
  @override
  @JsonKey(name: 'field_of_study')
  String? get fieldOfStudy;
  @override
  @EducationDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @EducationDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'current')
  bool get current;
  @override
  String? get grade;
  @override
  String? get achievements;
  @override
  List<String> get skills;
  @override
  @JsonKey(name: 'education_id', includeToJson: false)
  int? get educationId;
  @override
  @JsonKey(ignore: true)
  _$$EducationImplCopyWith<_$EducationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
