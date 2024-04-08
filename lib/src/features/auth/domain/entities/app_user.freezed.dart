// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'signup_method')
  int get signupMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_verified')
  bool get mobileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'wizard_step')
  int get wizardStep => throw _privateConstructorUsedError;
  @JsonKey(name: 'wizard_completed')
  bool get wizardCompleted => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  DateTime? get joinDate => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'signup_method') int signupMethod,
      @JsonKey(name: 'email_verified') bool emailVerified,
      @JsonKey(name: 'mobile_verified') bool mobileVerified,
      @JsonKey(name: 'wizard_step') int wizardStep,
      @JsonKey(name: 'wizard_completed') bool wizardCompleted,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      DateTime? joinDate,
      String? mobile,
      String? address,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? signupMethod = null,
    Object? emailVerified = null,
    Object? mobileVerified = null,
    Object? wizardStep = null,
    Object? wizardCompleted = null,
    Object? joinDate = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? imageUrl = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      signupMethod: null == signupMethod
          ? _value.signupMethod
          : signupMethod // ignore: cast_nullable_to_non_nullable
              as int,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileVerified: null == mobileVerified
          ? _value.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      wizardStep: null == wizardStep
          ? _value.wizardStep
          : wizardStep // ignore: cast_nullable_to_non_nullable
              as int,
      wizardCompleted: null == wizardCompleted
          ? _value.wizardCompleted
          : wizardCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'signup_method') int signupMethod,
      @JsonKey(name: 'email_verified') bool emailVerified,
      @JsonKey(name: 'mobile_verified') bool mobileVerified,
      @JsonKey(name: 'wizard_step') int wizardStep,
      @JsonKey(name: 'wizard_completed') bool wizardCompleted,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      DateTime? joinDate,
      String? mobile,
      String? address,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'user_id') String? userId});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? signupMethod = null,
    Object? emailVerified = null,
    Object? mobileVerified = null,
    Object? wizardStep = null,
    Object? wizardCompleted = null,
    Object? joinDate = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? imageUrl = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$AppUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      signupMethod: null == signupMethod
          ? _value.signupMethod
          : signupMethod // ignore: cast_nullable_to_non_nullable
              as int,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileVerified: null == mobileVerified
          ? _value.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      wizardStep: null == wizardStep
          ? _value.wizardStep
          : wizardStep // ignore: cast_nullable_to_non_nullable
              as int,
      wizardCompleted: null == wizardCompleted
          ? _value.wizardCompleted
          : wizardCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl implements _AppUser {
  const _$AppUserImpl(
      {required this.email,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'signup_method') this.signupMethod = 0,
      @JsonKey(name: 'email_verified') this.emailVerified = false,
      @JsonKey(name: 'mobile_verified') this.mobileVerified = false,
      @JsonKey(name: 'wizard_step') this.wizardStep = 0,
      @JsonKey(name: 'wizard_completed') this.wizardCompleted = false,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      this.joinDate,
      this.mobile,
      this.address,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'user_id') this.userId});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'signup_method')
  final int signupMethod;
  @override
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @override
  @JsonKey(name: 'mobile_verified')
  final bool mobileVerified;
  @override
  @JsonKey(name: 'wizard_step')
  final int wizardStep;
  @override
  @JsonKey(name: 'wizard_completed')
  final bool wizardCompleted;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  final DateTime? joinDate;
  @override
  final String? mobile;
  @override
  final String? address;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;

  @override
  String toString() {
    return 'AppUser(email: $email, firstName: $firstName, lastName: $lastName, signupMethod: $signupMethod, emailVerified: $emailVerified, mobileVerified: $mobileVerified, wizardStep: $wizardStep, wizardCompleted: $wizardCompleted, joinDate: $joinDate, mobile: $mobile, address: $address, imageUrl: $imageUrl, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.signupMethod, signupMethod) ||
                other.signupMethod == signupMethod) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.mobileVerified, mobileVerified) ||
                other.mobileVerified == mobileVerified) &&
            (identical(other.wizardStep, wizardStep) ||
                other.wizardStep == wizardStep) &&
            (identical(other.wizardCompleted, wizardCompleted) ||
                other.wizardCompleted == wizardCompleted) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      firstName,
      lastName,
      signupMethod,
      emailVerified,
      mobileVerified,
      wizardStep,
      wizardCompleted,
      joinDate,
      mobile,
      address,
      imageUrl,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {required final String email,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      @JsonKey(name: 'signup_method') final int signupMethod,
      @JsonKey(name: 'email_verified') final bool emailVerified,
      @JsonKey(name: 'mobile_verified') final bool mobileVerified,
      @JsonKey(name: 'wizard_step') final int wizardStep,
      @JsonKey(name: 'wizard_completed') final bool wizardCompleted,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      final DateTime? joinDate,
      final String? mobile,
      final String? address,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'user_id') final String? userId}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'signup_method')
  int get signupMethod;
  @override
  @JsonKey(name: 'email_verified')
  bool get emailVerified;
  @override
  @JsonKey(name: 'mobile_verified')
  bool get mobileVerified;
  @override
  @JsonKey(name: 'wizard_step')
  int get wizardStep;
  @override
  @JsonKey(name: 'wizard_completed')
  bool get wizardCompleted;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  DateTime? get joinDate;
  @override
  String? get mobile;
  @override
  String? get address;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
