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
  @JsonKey(name: 'firm')
  Firm? get firm => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_location')
  String? get practiceLocation => throw _privateConstructorUsedError;
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @ExperienceDateTimeConverter()
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get current => throw _privateConstructorUsedError;
  List<String> get skills => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_id', includeToJson: false)
  int? get experienceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      @JsonKey(name: 'firm') Firm? firm,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      DateTime? startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      DateTime? endDate,
      bool current,
      List<String> skills,
      String? description,
      @JsonKey(name: 'experience_id', includeToJson: false) int? experienceId});

  $FirmCopyWith<$Res>? get firm;
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? practiceArea = freezed,
    Object? firm = freezed,
    Object? practiceLocation = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? current = null,
    Object? skills = null,
    Object? description = freezed,
    Object? experienceId = freezed,
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
      firm: freezed == firm
          ? _value.firm
          : firm // ignore: cast_nullable_to_non_nullable
              as Firm?,
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
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceId: freezed == experienceId
          ? _value.experienceId
          : experienceId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FirmCopyWith<$Res>? get firm {
    if (_value.firm == null) {
      return null;
    }

    return $FirmCopyWith<$Res>(_value.firm!, (value) {
      return _then(_value.copyWith(firm: value) as $Val);
    });
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
      @JsonKey(name: 'firm') Firm? firm,
      @JsonKey(name: 'practice_location') String? practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      DateTime? startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      DateTime? endDate,
      bool current,
      List<String> skills,
      String? description,
      @JsonKey(name: 'experience_id', includeToJson: false) int? experienceId});

  @override
  $FirmCopyWith<$Res>? get firm;
}

/// @nodoc
class __$$ExperienceImplCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$ExperienceImpl>
    implements _$$ExperienceImplCopyWith<$Res> {
  __$$ExperienceImplCopyWithImpl(
      _$ExperienceImpl _value, $Res Function(_$ExperienceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? practiceArea = freezed,
    Object? firm = freezed,
    Object? practiceLocation = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? current = null,
    Object? skills = null,
    Object? description = freezed,
    Object? experienceId = freezed,
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
      firm: freezed == firm
          ? _value.firm
          : firm // ignore: cast_nullable_to_non_nullable
              as Firm?,
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
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as bool,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceId: freezed == experienceId
          ? _value.experienceId
          : experienceId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperienceImpl implements _Experience {
  const _$ExperienceImpl(
      {required this.title,
      @JsonKey(name: 'practice_area') required this.practiceArea,
      @JsonKey(name: 'firm') required this.firm,
      @JsonKey(name: 'practice_location') required this.practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      required this.startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      required this.endDate,
      required this.current,
      required final List<String> skills,
      required this.description,
      @JsonKey(name: 'experience_id', includeToJson: false) this.experienceId})
      : _skills = skills;

  factory _$ExperienceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperienceImplFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: 'practice_area')
  final String? practiceArea;
  @override
  @JsonKey(name: 'firm')
  final Firm? firm;
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
  @override
  final bool current;
  final List<String> _skills;
  @override
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final String? description;
  @override
  @JsonKey(name: 'experience_id', includeToJson: false)
  final int? experienceId;

  @override
  String toString() {
    return 'Experience(title: $title, practiceArea: $practiceArea, firm: $firm, practiceLocation: $practiceLocation, startDate: $startDate, endDate: $endDate, current: $current, skills: $skills, description: $description, experienceId: $experienceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperienceImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.firm, firm) || other.firm == firm) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.experienceId, experienceId) ||
                other.experienceId == experienceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      practiceArea,
      firm,
      practiceLocation,
      startDate,
      endDate,
      current,
      const DeepCollectionEquality().hash(_skills),
      description,
      experienceId);

  @JsonKey(ignore: true)
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
      @JsonKey(name: 'firm') required final Firm? firm,
      @JsonKey(name: 'practice_location')
      required final String? practiceLocation,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'start_date')
      required final DateTime? startDate,
      @ExperienceDateTimeConverter()
      @JsonKey(name: 'end_date')
      required final DateTime? endDate,
      required final bool current,
      required final List<String> skills,
      required final String? description,
      @JsonKey(name: 'experience_id', includeToJson: false)
      final int? experienceId}) = _$ExperienceImpl;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$ExperienceImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: 'practice_area')
  String? get practiceArea;
  @override
  @JsonKey(name: 'firm')
  Firm? get firm;
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
  bool get current;
  @override
  List<String> get skills;
  @override
  String? get description;
  @override
  @JsonKey(name: 'experience_id', includeToJson: false)
  int? get experienceId;
  @override
  @JsonKey(ignore: true)
  _$$ExperienceImplCopyWith<_$ExperienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
