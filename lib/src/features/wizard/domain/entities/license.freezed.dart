// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

License _$LicenseFromJson(Map<String, dynamic> json) {
  return _License.fromJson(json);
}

/// @nodoc
mixin _$License {
  @JsonKey(name: 'user_id', includeToJson: false)
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String get licenseNumber => throw _privateConstructorUsedError;
  @LicenseDateTimeConverter()
  @JsonKey(name: 'issue_date')
  DateTime get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_state')
  String get issueState => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_id', includeToJson: false)
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this License to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LicenseCopyWith<License> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseCopyWith<$Res> {
  factory $LicenseCopyWith(License value, $Res Function(License) then) =
      _$LicenseCopyWithImpl<$Res, License>;
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
class _$LicenseCopyWithImpl<$Res, $Val extends License>
    implements $LicenseCopyWith<$Res> {
  _$LicenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issueState: null == issueState
          ? _value.issueState
          : issueState // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LicenseImplCopyWith<$Res> implements $LicenseCopyWith<$Res> {
  factory _$$LicenseImplCopyWith(
          _$LicenseImpl value, $Res Function(_$LicenseImpl) then) =
      __$$LicenseImplCopyWithImpl<$Res>;
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
class __$$LicenseImplCopyWithImpl<$Res>
    extends _$LicenseCopyWithImpl<$Res, _$LicenseImpl>
    implements _$$LicenseImplCopyWith<$Res> {
  __$$LicenseImplCopyWithImpl(
      _$LicenseImpl _value, $Res Function(_$LicenseImpl) _then)
      : super(_value, _then);

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
    return _then(_$LicenseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNumber: null == licenseNumber
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      issueState: null == issueState
          ? _value.issueState
          : issueState // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LicenseImpl implements _License {
  const _$LicenseImpl(
      {@JsonKey(name: 'user_id', includeToJson: false) required this.userId,
      required this.name,
      @JsonKey(name: 'license_number') required this.licenseNumber,
      @LicenseDateTimeConverter()
      @JsonKey(name: 'issue_date')
      required this.issueDate,
      @JsonKey(name: 'issue_state') required this.issueState,
      @JsonKey(name: 'license_id', includeToJson: false) this.id});

  factory _$LicenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicenseImplFromJson(json);

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

  @override
  String toString() {
    return 'License(userId: $userId, name: $name, licenseNumber: $licenseNumber, issueDate: $issueDate, issueState: $issueState, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseImpl &&
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

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseImplCopyWith<_$LicenseImpl> get copyWith =>
      __$$LicenseImplCopyWithImpl<_$LicenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseImplToJson(
      this,
    );
  }
}

abstract class _License implements License {
  const factory _License(
          {@JsonKey(name: 'user_id', includeToJson: false)
          required final String userId,
          required final String name,
          @JsonKey(name: 'license_number') required final String licenseNumber,
          @LicenseDateTimeConverter()
          @JsonKey(name: 'issue_date')
          required final DateTime issueDate,
          @JsonKey(name: 'issue_state') required final String issueState,
          @JsonKey(name: 'license_id', includeToJson: false) final int? id}) =
      _$LicenseImpl;

  factory _License.fromJson(Map<String, dynamic> json) = _$LicenseImpl.fromJson;

  @override
  @JsonKey(name: 'user_id', includeToJson: false)
  String get userId;
  @override
  String get name;
  @override
  @JsonKey(name: 'license_number')
  String get licenseNumber;
  @override
  @LicenseDateTimeConverter()
  @JsonKey(name: 'issue_date')
  DateTime get issueDate;
  @override
  @JsonKey(name: 'issue_state')
  String get issueState;
  @override
  @JsonKey(name: 'license_id', includeToJson: false)
  int? get id;

  /// Create a copy of License
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LicenseImplCopyWith<_$LicenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
