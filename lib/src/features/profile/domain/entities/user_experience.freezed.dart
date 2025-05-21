// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserExperience {
  @JsonKey(name: 'experience')
  Experience? get experience;
  @JsonKey(name: 'firm')
  Firm? get firm;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserExperienceCopyWith<UserExperience> get copyWith =>
      _$UserExperienceCopyWithImpl<UserExperience>(
          this as UserExperience, _$identity);

  /// Serializes this UserExperience to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserExperience &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.firm, firm) || other.firm == firm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, experience, firm);

  @override
  String toString() {
    return 'UserExperience(experience: $experience, firm: $firm)';
  }
}

/// @nodoc
abstract mixin class $UserExperienceCopyWith<$Res> {
  factory $UserExperienceCopyWith(
          UserExperience value, $Res Function(UserExperience) _then) =
      _$UserExperienceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'experience') Experience? experience,
      @JsonKey(name: 'firm') Firm? firm});

  $ExperienceCopyWith<$Res>? get experience;
  $FirmCopyWith<$Res>? get firm;
}

/// @nodoc
class _$UserExperienceCopyWithImpl<$Res>
    implements $UserExperienceCopyWith<$Res> {
  _$UserExperienceCopyWithImpl(this._self, this._then);

  final UserExperience _self;
  final $Res Function(UserExperience) _then;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experience = freezed,
    Object? firm = freezed,
  }) {
    return _then(_self.copyWith(
      experience: freezed == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as Experience?,
      firm: freezed == firm
          ? _self.firm
          : firm // ignore: cast_nullable_to_non_nullable
              as Firm?,
    ));
  }

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExperienceCopyWith<$Res>? get experience {
    if (_self.experience == null) {
      return null;
    }

    return $ExperienceCopyWith<$Res>(_self.experience!, (value) {
      return _then(_self.copyWith(experience: value));
    });
  }

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirmCopyWith<$Res>? get firm {
    if (_self.firm == null) {
      return null;
    }

    return $FirmCopyWith<$Res>(_self.firm!, (value) {
      return _then(_self.copyWith(firm: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserExperience implements UserExperience {
  const _UserExperience(
      {@JsonKey(name: 'experience') required this.experience,
      @JsonKey(name: 'firm') required this.firm});
  factory _UserExperience.fromJson(Map<String, dynamic> json) =>
      _$UserExperienceFromJson(json);

  @override
  @JsonKey(name: 'experience')
  final Experience? experience;
  @override
  @JsonKey(name: 'firm')
  final Firm? firm;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserExperienceCopyWith<_UserExperience> get copyWith =>
      __$UserExperienceCopyWithImpl<_UserExperience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserExperienceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserExperience &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.firm, firm) || other.firm == firm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, experience, firm);

  @override
  String toString() {
    return 'UserExperience(experience: $experience, firm: $firm)';
  }
}

/// @nodoc
abstract mixin class _$UserExperienceCopyWith<$Res>
    implements $UserExperienceCopyWith<$Res> {
  factory _$UserExperienceCopyWith(
          _UserExperience value, $Res Function(_UserExperience) _then) =
      __$UserExperienceCopyWithImpl;
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
class __$UserExperienceCopyWithImpl<$Res>
    implements _$UserExperienceCopyWith<$Res> {
  __$UserExperienceCopyWithImpl(this._self, this._then);

  final _UserExperience _self;
  final $Res Function(_UserExperience) _then;

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? experience = freezed,
    Object? firm = freezed,
  }) {
    return _then(_UserExperience(
      experience: freezed == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as Experience?,
      firm: freezed == firm
          ? _self.firm
          : firm // ignore: cast_nullable_to_non_nullable
              as Firm?,
    ));
  }

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExperienceCopyWith<$Res>? get experience {
    if (_self.experience == null) {
      return null;
    }

    return $ExperienceCopyWith<$Res>(_self.experience!, (value) {
      return _then(_self.copyWith(experience: value));
    });
  }

  /// Create a copy of UserExperience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirmCopyWith<$Res>? get firm {
    if (_self.firm == null) {
      return null;
    }

    return $FirmCopyWith<$Res>(_self.firm!, (value) {
      return _then(_self.copyWith(firm: value));
    });
  }
}

// dart format on
