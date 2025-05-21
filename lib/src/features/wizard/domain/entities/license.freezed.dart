// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$License {
  @JsonKey(name: 'user_id', includeToJson: false)
  String get userId;
  String get name;
  @JsonKey(name: 'license_number')
  String get licenseNumber;
  @LicenseDateTimeConverter()
  @JsonKey(name: 'issue_date')
  DateTime get issueDate;
  @JsonKey(name: 'issue_state')
  String get issueState;
  @JsonKey(name: 'license_id', includeToJson: false)
  int? get id;

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LicenseCopyWith<License> get copyWith =>
      _$LicenseCopyWithImpl<License>(this as License, _$identity);

  /// Serializes this License to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is License &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.issueState, issueState) ||
                other.issueState == issueState) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, name, licenseNumber, issueDate, issueState, id);

  @override
  String toString() {
    return 'License(userId: $userId, name: $name, licenseNumber: $licenseNumber, issueDate: $issueDate, issueState: $issueState, id: $id)';
  }
}

/// @nodoc
abstract mixin class $LicenseCopyWith<$Res> {
  factory $LicenseCopyWith(License value, $Res Function(License) _then) =
      _$LicenseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id', includeToJson: false) String userId,
      String name,
      @JsonKey(name: 'license_number') String licenseNumber,
      @LicenseDateTimeConverter()
      @JsonKey(name: 'issue_date')
      DateTime issueDate,
      @JsonKey(name: 'issue_state') String issueState,
      @JsonKey(name: 'license_id', includeToJson: false) int? id});
}

/// @nodoc
class _$LicenseCopyWithImpl<$Res> implements $LicenseCopyWith<$Res> {
  _$LicenseCopyWithImpl(this._self, this._then);

  final License _self;
  final $Res Function(License) _then;

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? licenseNumber = null,
    Object? issueDate = null,
    Object? issueState = null,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _self.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issueState: null == issueState
          ? _self.issueState
          : issueState // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _License implements License {
  const _License(
      {@JsonKey(name: 'user_id', includeToJson: false) required this.userId,
      required this.name,
      @JsonKey(name: 'license_number') required this.licenseNumber,
      @LicenseDateTimeConverter()
      @JsonKey(name: 'issue_date')
      required this.issueDate,
      @JsonKey(name: 'issue_state') required this.issueState,
      @JsonKey(name: 'license_id', includeToJson: false) this.id});
  factory _License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  @override
  @JsonKey(name: 'user_id', includeToJson: false)
  final String userId;
  @override
  final String name;
  @override
  @JsonKey(name: 'license_number')
  final String licenseNumber;
  @override
  @LicenseDateTimeConverter()
  @JsonKey(name: 'issue_date')
  final DateTime issueDate;
  @override
  @JsonKey(name: 'issue_state')
  final String issueState;
  @override
  @JsonKey(name: 'license_id', includeToJson: false)
  final int? id;

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LicenseCopyWith<_License> get copyWith =>
      __$LicenseCopyWithImpl<_License>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LicenseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _License &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.licenseNumber, licenseNumber) ||
                other.licenseNumber == licenseNumber) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.issueState, issueState) ||
                other.issueState == issueState) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, name, licenseNumber, issueDate, issueState, id);

  @override
  String toString() {
    return 'License(userId: $userId, name: $name, licenseNumber: $licenseNumber, issueDate: $issueDate, issueState: $issueState, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$LicenseCopyWith<$Res> implements $LicenseCopyWith<$Res> {
  factory _$LicenseCopyWith(_License value, $Res Function(_License) _then) =
      __$LicenseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id', includeToJson: false) String userId,
      String name,
      @JsonKey(name: 'license_number') String licenseNumber,
      @LicenseDateTimeConverter()
      @JsonKey(name: 'issue_date')
      DateTime issueDate,
      @JsonKey(name: 'issue_state') String issueState,
      @JsonKey(name: 'license_id', includeToJson: false) int? id});
}

/// @nodoc
class __$LicenseCopyWithImpl<$Res> implements _$LicenseCopyWith<$Res> {
  __$LicenseCopyWithImpl(this._self, this._then);

  final _License _self;
  final $Res Function(_License) _then;

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? licenseNumber = null,
    Object? issueDate = null,
    Object? issueState = null,
    Object? id = freezed,
  }) {
    return _then(_License(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _self.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _self.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issueState: null == issueState
          ? _self.issueState
          : issueState // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
