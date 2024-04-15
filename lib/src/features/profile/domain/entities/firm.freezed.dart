// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Firm _$FirmFromJson(Map<String, dynamic> json) {
  return _Firm.fromJson(json);
}

/// @nodoc
mixin _$Firm {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'org_type')
  String get orgType => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String get logoUrl => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'firm_id', includeToJson: false)
  int? get firmId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirmCopyWith<Firm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirmCopyWith<$Res> {
  factory $FirmCopyWith(Firm value, $Res Function(Firm) then) =
      _$FirmCopyWithImpl<$Res, Firm>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'org_type') String orgType,
      @JsonKey(name: 'logo_url') String logoUrl,
      String website,
      String location,
      String about,
      @JsonKey(name: 'firm_id', includeToJson: false) int? firmId});
}

/// @nodoc
class _$FirmCopyWithImpl<$Res, $Val extends Firm>
    implements $FirmCopyWith<$Res> {
  _$FirmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orgType = null,
    Object? logoUrl = null,
    Object? website = null,
    Object? location = null,
    Object? about = null,
    Object? firmId = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      firmId: freezed == firmId
          ? _value.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirmImplCopyWith<$Res> implements $FirmCopyWith<$Res> {
  factory _$$FirmImplCopyWith(
          _$FirmImpl value, $Res Function(_$FirmImpl) then) =
      __$$FirmImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'org_type') String orgType,
      @JsonKey(name: 'logo_url') String logoUrl,
      String website,
      String location,
      String about,
      @JsonKey(name: 'firm_id', includeToJson: false) int? firmId});
}

/// @nodoc
class __$$FirmImplCopyWithImpl<$Res>
    extends _$FirmCopyWithImpl<$Res, _$FirmImpl>
    implements _$$FirmImplCopyWith<$Res> {
  __$$FirmImplCopyWithImpl(_$FirmImpl _value, $Res Function(_$FirmImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orgType = null,
    Object? logoUrl = null,
    Object? website = null,
    Object? location = null,
    Object? about = null,
    Object? firmId = freezed,
  }) {
    return _then(_$FirmImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: null == orgType
          ? _value.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      firmId: freezed == firmId
          ? _value.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirmImpl implements _Firm {
  const _$FirmImpl(
      {required this.name,
      @JsonKey(name: 'org_type') required this.orgType,
      @JsonKey(name: 'logo_url') required this.logoUrl,
      required this.website,
      required this.location,
      required this.about,
      @JsonKey(name: 'firm_id', includeToJson: false) this.firmId});

  factory _$FirmImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirmImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'org_type')
  final String orgType;
  @override
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  @override
  final String website;
  @override
  final String location;
  @override
  final String about;
  @override
  @JsonKey(name: 'firm_id', includeToJson: false)
  final int? firmId;

  @override
  String toString() {
    return 'Firm(name: $name, orgType: $orgType, logoUrl: $logoUrl, website: $website, location: $location, about: $about, firmId: $firmId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirmImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orgType, orgType) || other.orgType == orgType) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.firmId, firmId) || other.firmId == firmId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, orgType, logoUrl, website, location, about, firmId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirmImplCopyWith<_$FirmImpl> get copyWith =>
      __$$FirmImplCopyWithImpl<_$FirmImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirmImplToJson(
      this,
    );
  }
}

abstract class _Firm implements Firm {
  const factory _Firm(
          {required final String name,
          @JsonKey(name: 'org_type') required final String orgType,
          @JsonKey(name: 'logo_url') required final String logoUrl,
          required final String website,
          required final String location,
          required final String about,
          @JsonKey(name: 'firm_id', includeToJson: false) final int? firmId}) =
      _$FirmImpl;

  factory _Firm.fromJson(Map<String, dynamic> json) = _$FirmImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'org_type')
  String get orgType;
  @override
  @JsonKey(name: 'logo_url')
  String get logoUrl;
  @override
  String get website;
  @override
  String get location;
  @override
  String get about;
  @override
  @JsonKey(name: 'firm_id', includeToJson: false)
  int? get firmId;
  @override
  @JsonKey(ignore: true)
  _$$FirmImplCopyWith<_$FirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
