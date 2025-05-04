// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Firm {
  String get name;
  @JsonKey(name: 'org_type')
  String get orgType;
  @JsonKey(name: 'logo_url')
  String get logoUrl;
  String get website;
  String get location;
  String get about;
  @JsonKey(name: 'owner_user_id')
  String get ownerUserId;
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  DateTime get createdAt;
  @JsonKey(name: 'firm_id', includeToJson: false)
  int? get firmId;

  /// Create a copy of Firm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirmCopyWith<Firm> get copyWith =>
      _$FirmCopyWithImpl<Firm>(this as Firm, _$identity);

  /// Serializes this Firm to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Firm &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orgType, orgType) || other.orgType == orgType) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firmId, firmId) || other.firmId == firmId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, orgType, logoUrl, website,
      location, about, ownerUserId, createdAt, firmId);

  @override
  String toString() {
    return 'Firm(name: $name, orgType: $orgType, logoUrl: $logoUrl, website: $website, location: $location, about: $about, ownerUserId: $ownerUserId, createdAt: $createdAt, firmId: $firmId)';
  }
}

/// @nodoc
abstract mixin class $FirmCopyWith<$Res> {
  factory $FirmCopyWith(Firm value, $Res Function(Firm) _then) =
      _$FirmCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'org_type') String orgType,
      @JsonKey(name: 'logo_url') String logoUrl,
      String website,
      String location,
      String about,
      @JsonKey(name: 'owner_user_id') String ownerUserId,
      @JsonKey(name: 'created_at') @DateTimeJsonConverter() DateTime createdAt,
      @JsonKey(name: 'firm_id', includeToJson: false) int? firmId});
}

/// @nodoc
class _$FirmCopyWithImpl<$Res> implements $FirmCopyWith<$Res> {
  _$FirmCopyWithImpl(this._self, this._then);

  final Firm _self;
  final $Res Function(Firm) _then;

  /// Create a copy of Firm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? orgType = null,
    Object? logoUrl = null,
    Object? website = null,
    Object? location = null,
    Object? about = null,
    Object? ownerUserId = null,
    Object? createdAt = null,
    Object? firmId = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: null == orgType
          ? _self.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _self.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _self.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmId: freezed == firmId
          ? _self.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Firm implements Firm {
  const _Firm(
      {required this.name,
      @JsonKey(name: 'org_type') required this.orgType,
      @JsonKey(name: 'logo_url') required this.logoUrl,
      required this.website,
      required this.location,
      required this.about,
      @JsonKey(name: 'owner_user_id') required this.ownerUserId,
      @JsonKey(name: 'created_at')
      @DateTimeJsonConverter()
      required this.createdAt,
      @JsonKey(name: 'firm_id', includeToJson: false) this.firmId});
  factory _Firm.fromJson(Map<String, dynamic> json) => _$FirmFromJson(json);

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
  @JsonKey(name: 'owner_user_id')
  final String ownerUserId;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeJsonConverter()
  final DateTime createdAt;
  @override
  @JsonKey(name: 'firm_id', includeToJson: false)
  final int? firmId;

  /// Create a copy of Firm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FirmCopyWith<_Firm> get copyWith =>
      __$FirmCopyWithImpl<_Firm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FirmToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Firm &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orgType, orgType) || other.orgType == orgType) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.firmId, firmId) || other.firmId == firmId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, orgType, logoUrl, website,
      location, about, ownerUserId, createdAt, firmId);

  @override
  String toString() {
    return 'Firm(name: $name, orgType: $orgType, logoUrl: $logoUrl, website: $website, location: $location, about: $about, ownerUserId: $ownerUserId, createdAt: $createdAt, firmId: $firmId)';
  }
}

/// @nodoc
abstract mixin class _$FirmCopyWith<$Res> implements $FirmCopyWith<$Res> {
  factory _$FirmCopyWith(_Firm value, $Res Function(_Firm) _then) =
      __$FirmCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'org_type') String orgType,
      @JsonKey(name: 'logo_url') String logoUrl,
      String website,
      String location,
      String about,
      @JsonKey(name: 'owner_user_id') String ownerUserId,
      @JsonKey(name: 'created_at') @DateTimeJsonConverter() DateTime createdAt,
      @JsonKey(name: 'firm_id', includeToJson: false) int? firmId});
}

/// @nodoc
class __$FirmCopyWithImpl<$Res> implements _$FirmCopyWith<$Res> {
  __$FirmCopyWithImpl(this._self, this._then);

  final _Firm _self;
  final $Res Function(_Firm) _then;

  /// Create a copy of Firm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? orgType = null,
    Object? logoUrl = null,
    Object? website = null,
    Object? location = null,
    Object? about = null,
    Object? ownerUserId = null,
    Object? createdAt = null,
    Object? firmId = freezed,
  }) {
    return _then(_Firm(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orgType: null == orgType
          ? _self.orgType
          : orgType // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _self.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _self.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      firmId: freezed == firmId
          ? _self.firmId
          : firmId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
