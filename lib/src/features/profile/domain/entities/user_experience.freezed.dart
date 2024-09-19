// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserExperience _$UserExperienceFromJson(Map<String, dynamic> json) {
  return _UserExperience.fromJson(json);
}

/// @nodoc
mixin _$UserExperience {
  @JsonKey(name: 'experience')
  Experience? get experience => throw _privateConstructorUsedError;
  @JsonKey(name: 'firm')
  Firm? get firm => throw _privateConstructorUsedError;

  /// Serializes this UserExperience to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserExperienceCopyWith<UserExperience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserExperienceCopyWith<$Res> {
  factory $UserExperienceCopyWith(
          UserExperience value, $Res Function(UserExperience) then) =
      _$UserExperienceCopyWithImpl<$Res, UserExperience>;
  @useResult
  $Res call(
      {@JsonKey(name: 'experience') Experience? experience,
      @JsonKey(name: 'firm') Firm? firm});

  $ExperienceCopyWith<$Res>? get experience;
  $FirmCopyWith<$Res>? get firm;
}

/// @nodoc
class _$UserExperienceCopyWithImpl<$Res, $Val extends UserExperience>
    implements $UserExperienceCopyWith<$Res> {
  _$UserExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experience = freezed,
    Object? firm = freezed,
  }) {
    return _then(_value.copyWith(
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as Experience?,
      firm: freezed == firm
          ? _value.firm
          : firm // ignore: cast_nullable_to_non_nullable
              as Firm?,
    ) as $Val);
  }

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExperienceCopyWith<$Res>? get experience {
    if (_value.experience == null) {
      return null;
    }

    return $ExperienceCopyWith<$Res>(_value.experience!, (value) {
      return _then(_value.copyWith(experience: value) as $Val);
    });
  }

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$UserExperienceImplCopyWith<$Res>
    implements $UserExperienceCopyWith<$Res> {
  factory _$$UserExperienceImplCopyWith(_$UserExperienceImpl value,
          $Res Function(_$UserExperienceImpl) then) =
      __$$UserExperienceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'experience') Experience? experience,
      @JsonKey(name: 'firm') Firm? firm});

  @override
  $ExperienceCopyWith<$Res>? get experience;
  @override
  $FirmCopyWith<$Res>? get firm;
}

/// @nodoc
class __$$UserExperienceImplCopyWithImpl<$Res>
    extends _$UserExperienceCopyWithImpl<$Res, _$UserExperienceImpl>
    implements _$$UserExperienceImplCopyWith<$Res> {
  __$$UserExperienceImplCopyWithImpl(
      _$UserExperienceImpl _value, $Res Function(_$UserExperienceImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experience = freezed,
    Object? firm = freezed,
  }) {
    return _then(_$UserExperienceImpl(
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as Experience?,
      firm: freezed == firm
          ? _value.firm
          : firm // ignore: cast_nullable_to_non_nullable
              as Firm?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserExperienceImpl implements _UserExperience {
  const _$UserExperienceImpl(
      {@JsonKey(name: 'experience') required this.experience,
      @JsonKey(name: 'firm') required this.firm});

  factory _$UserExperienceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserExperienceImplFromJson(json);

  @override
  @JsonKey(name: 'experience')
  final Experience? experience;
  @override
  @JsonKey(name: 'firm')
  final Firm? firm;

  @override
  String toString() {
    return 'UserExperience(experience: $experience, firm: $firm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserExperienceImpl &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.firm, firm) || other.firm == firm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, experience, firm);

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserExperienceImplCopyWith<_$UserExperienceImpl> get copyWith =>
      __$$UserExperienceImplCopyWithImpl<_$UserExperienceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserExperienceImplToJson(
      this,
    );
  }
}

abstract class _UserExperience implements UserExperience {
  const factory _UserExperience(
      {@JsonKey(name: 'experience') required final Experience? experience,
      @JsonKey(name: 'firm') required final Firm? firm}) = _$UserExperienceImpl;

  factory _UserExperience.fromJson(Map<String, dynamic> json) =
      _$UserExperienceImpl.fromJson;

  @override
  @JsonKey(name: 'experience')
  Experience? get experience;
  @override
  @JsonKey(name: 'firm')
  Firm? get firm;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserExperienceImplCopyWith<_$UserExperienceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
