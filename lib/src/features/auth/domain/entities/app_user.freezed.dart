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
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'about', includeIfNull: false)
  String? get about => throw _privateConstructorUsedError;
  @JsonKey(name: 'signup_method', includeIfNull: false)
  int? get signupMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified', includeIfNull: false)
  bool? get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_verified', includeIfNull: false)
  bool? get mobileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'wizard_step', includeIfNull: false)
  int? get wizardStep => throw _privateConstructorUsedError;
  @JsonKey(name: 'wizard_completed', includeIfNull: false)
  bool? get wizardCompleted => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  DateTime? get joinDate => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url', includeIfNull: false)
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'banner_url', includeIfNull: false)
  String? get bannerUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_area', includeIfNull: false)
  String? get practiceArea => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_location', includeIfNull: false)
  String? get practiceLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
  int? get caseResolutionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
  int? get averageBillingPerClient => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience', includeIfNull: false)
  String? get experience => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_to_referral', includeIfNull: false)
  bool? get openToReferral => throw _privateConstructorUsedError;

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'about', includeIfNull: false) String? about,
      @JsonKey(name: 'signup_method', includeIfNull: false) int? signupMethod,
      @JsonKey(name: 'email_verified', includeIfNull: false)
      bool? emailVerified,
      @JsonKey(name: 'mobile_verified', includeIfNull: false)
      bool? mobileVerified,
      @JsonKey(name: 'wizard_step', includeIfNull: false) int? wizardStep,
      @JsonKey(name: 'wizard_completed', includeIfNull: false)
      bool? wizardCompleted,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      DateTime? joinDate,
      String? mobile,
      String? address,
      @JsonKey(name: 'avatar_url', includeIfNull: false) String? avatarUrl,
      @JsonKey(name: 'banner_url', includeIfNull: false) String? bannerUrl,
      @JsonKey(name: 'user_id', includeIfNull: false) String? userId,
      @JsonKey(name: 'practice_area', includeIfNull: false)
      String? practiceArea,
      @JsonKey(name: 'practice_location', includeIfNull: false)
      String? practiceLocation,
      @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
      int? caseResolutionRate,
      @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
      int? averageBillingPerClient,
      @JsonKey(name: 'experience', includeIfNull: false) String? experience,
      @JsonKey(name: 'open_to_referral', includeIfNull: false)
      bool? openToReferral});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? about = freezed,
    Object? signupMethod = freezed,
    Object? emailVerified = freezed,
    Object? mobileVerified = freezed,
    Object? wizardStep = freezed,
    Object? wizardCompleted = freezed,
    Object? joinDate = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? avatarUrl = freezed,
    Object? bannerUrl = freezed,
    Object? userId = freezed,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? caseResolutionRate = freezed,
    Object? averageBillingPerClient = freezed,
    Object? experience = freezed,
    Object? openToReferral = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      signupMethod: freezed == signupMethod
          ? _value.signupMethod
          : signupMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileVerified: freezed == mobileVerified
          ? _value.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      wizardStep: freezed == wizardStep
          ? _value.wizardStep
          : wizardStep // ignore: cast_nullable_to_non_nullable
              as int?,
      wizardCompleted: freezed == wizardCompleted
          ? _value.wizardCompleted
          : wizardCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _value.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _value.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      openToReferral: freezed == openToReferral
          ? _value.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      {String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'about', includeIfNull: false) String? about,
      @JsonKey(name: 'signup_method', includeIfNull: false) int? signupMethod,
      @JsonKey(name: 'email_verified', includeIfNull: false)
      bool? emailVerified,
      @JsonKey(name: 'mobile_verified', includeIfNull: false)
      bool? mobileVerified,
      @JsonKey(name: 'wizard_step', includeIfNull: false) int? wizardStep,
      @JsonKey(name: 'wizard_completed', includeIfNull: false)
      bool? wizardCompleted,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      DateTime? joinDate,
      String? mobile,
      String? address,
      @JsonKey(name: 'avatar_url', includeIfNull: false) String? avatarUrl,
      @JsonKey(name: 'banner_url', includeIfNull: false) String? bannerUrl,
      @JsonKey(name: 'user_id', includeIfNull: false) String? userId,
      @JsonKey(name: 'practice_area', includeIfNull: false)
      String? practiceArea,
      @JsonKey(name: 'practice_location', includeIfNull: false)
      String? practiceLocation,
      @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
      int? caseResolutionRate,
      @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
      int? averageBillingPerClient,
      @JsonKey(name: 'experience', includeIfNull: false) String? experience,
      @JsonKey(name: 'open_to_referral', includeIfNull: false)
      bool? openToReferral});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? about = freezed,
    Object? signupMethod = freezed,
    Object? emailVerified = freezed,
    Object? mobileVerified = freezed,
    Object? wizardStep = freezed,
    Object? wizardCompleted = freezed,
    Object? joinDate = freezed,
    Object? mobile = freezed,
    Object? address = freezed,
    Object? avatarUrl = freezed,
    Object? bannerUrl = freezed,
    Object? userId = freezed,
    Object? practiceArea = freezed,
    Object? practiceLocation = freezed,
    Object? caseResolutionRate = freezed,
    Object? averageBillingPerClient = freezed,
    Object? experience = freezed,
    Object? openToReferral = freezed,
  }) {
    return _then(_$AppUserImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      signupMethod: freezed == signupMethod
          ? _value.signupMethod
          : signupMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileVerified: freezed == mobileVerified
          ? _value.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      wizardStep: freezed == wizardStep
          ? _value.wizardStep
          : wizardStep // ignore: cast_nullable_to_non_nullable
              as int?,
      wizardCompleted: freezed == wizardCompleted
          ? _value.wizardCompleted
          : wizardCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _value.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _value.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _value.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _value.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      openToReferral: freezed == openToReferral
          ? _value.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      @JsonKey(name: 'about', includeIfNull: false) this.about,
      @JsonKey(name: 'signup_method', includeIfNull: false)
      this.signupMethod = 0,
      @JsonKey(name: 'email_verified', includeIfNull: false)
      this.emailVerified = false,
      @JsonKey(name: 'mobile_verified', includeIfNull: false)
      this.mobileVerified = false,
      @JsonKey(name: 'wizard_step', includeIfNull: false) this.wizardStep = 0,
      @JsonKey(name: 'wizard_completed', includeIfNull: false)
      this.wizardCompleted = false,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      this.joinDate,
      this.mobile,
      this.address,
      @JsonKey(name: 'avatar_url', includeIfNull: false) this.avatarUrl,
      @JsonKey(name: 'banner_url', includeIfNull: false) this.bannerUrl,
      @JsonKey(name: 'user_id', includeIfNull: false) this.userId,
      @JsonKey(name: 'practice_area', includeIfNull: false) this.practiceArea,
      @JsonKey(name: 'practice_location', includeIfNull: false)
      this.practiceLocation,
      @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
      this.caseResolutionRate,
      @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
      this.averageBillingPerClient,
      @JsonKey(name: 'experience', includeIfNull: false) this.experience,
      @JsonKey(name: 'open_to_referral', includeIfNull: false)
      this.openToReferral = false});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String? email;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'about', includeIfNull: false)
  final String? about;
  @override
  @JsonKey(name: 'signup_method', includeIfNull: false)
  final int? signupMethod;
  @override
  @JsonKey(name: 'email_verified', includeIfNull: false)
  final bool? emailVerified;
  @override
  @JsonKey(name: 'mobile_verified', includeIfNull: false)
  final bool? mobileVerified;
  @override
  @JsonKey(name: 'wizard_step', includeIfNull: false)
  final int? wizardStep;
  @override
  @JsonKey(name: 'wizard_completed', includeIfNull: false)
  final bool? wizardCompleted;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  final DateTime? joinDate;
  @override
  final String? mobile;
  @override
  final String? address;
  @override
  @JsonKey(name: 'avatar_url', includeIfNull: false)
  final String? avatarUrl;
  @override
  @JsonKey(name: 'banner_url', includeIfNull: false)
  final String? bannerUrl;
  @override
  @JsonKey(name: 'user_id', includeIfNull: false)
  final String? userId;
  @override
  @JsonKey(name: 'practice_area', includeIfNull: false)
  final String? practiceArea;
  @override
  @JsonKey(name: 'practice_location', includeIfNull: false)
  final String? practiceLocation;
  @override
  @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
  final int? caseResolutionRate;
  @override
  @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
  final int? averageBillingPerClient;
  @override
  @JsonKey(name: 'experience', includeIfNull: false)
  final String? experience;
  @override
  @JsonKey(name: 'open_to_referral', includeIfNull: false)
  final bool? openToReferral;

  @override
  String toString() {
    return 'AppUser(email: $email, firstName: $firstName, lastName: $lastName, about: $about, signupMethod: $signupMethod, emailVerified: $emailVerified, mobileVerified: $mobileVerified, wizardStep: $wizardStep, wizardCompleted: $wizardCompleted, joinDate: $joinDate, mobile: $mobile, address: $address, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, userId: $userId, practiceArea: $practiceArea, practiceLocation: $practiceLocation, caseResolutionRate: $caseResolutionRate, averageBillingPerClient: $averageBillingPerClient, experience: $experience, openToReferral: $openToReferral)';
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
            (identical(other.about, about) || other.about == about) &&
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
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.practiceArea, practiceArea) ||
                other.practiceArea == practiceArea) &&
            (identical(other.practiceLocation, practiceLocation) ||
                other.practiceLocation == practiceLocation) &&
            (identical(other.caseResolutionRate, caseResolutionRate) ||
                other.caseResolutionRate == caseResolutionRate) &&
            (identical(
                    other.averageBillingPerClient, averageBillingPerClient) ||
                other.averageBillingPerClient == averageBillingPerClient) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.openToReferral, openToReferral) ||
                other.openToReferral == openToReferral));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        email,
        firstName,
        lastName,
        about,
        signupMethod,
        emailVerified,
        mobileVerified,
        wizardStep,
        wizardCompleted,
        joinDate,
        mobile,
        address,
        avatarUrl,
        bannerUrl,
        userId,
        practiceArea,
        practiceLocation,
        caseResolutionRate,
        averageBillingPerClient,
        experience,
        openToReferral
      ]);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String? email,
      @JsonKey(name: 'first_name') required final String? firstName,
      @JsonKey(name: 'last_name') required final String? lastName,
      @JsonKey(name: 'about', includeIfNull: false) final String? about,
      @JsonKey(name: 'signup_method', includeIfNull: false)
      final int? signupMethod,
      @JsonKey(name: 'email_verified', includeIfNull: false)
      final bool? emailVerified,
      @JsonKey(name: 'mobile_verified', includeIfNull: false)
      final bool? mobileVerified,
      @JsonKey(name: 'wizard_step', includeIfNull: false) final int? wizardStep,
      @JsonKey(name: 'wizard_completed', includeIfNull: false)
      final bool? wizardCompleted,
      @DateTimeConverter()
      @JsonKey(name: 'join_date', includeToJson: false)
      final DateTime? joinDate,
      final String? mobile,
      final String? address,
      @JsonKey(name: 'avatar_url', includeIfNull: false)
      final String? avatarUrl,
      @JsonKey(name: 'banner_url', includeIfNull: false)
      final String? bannerUrl,
      @JsonKey(name: 'user_id', includeIfNull: false) final String? userId,
      @JsonKey(name: 'practice_area', includeIfNull: false)
      final String? practiceArea,
      @JsonKey(name: 'practice_location', includeIfNull: false)
      final String? practiceLocation,
      @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
      final int? caseResolutionRate,
      @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
      final int? averageBillingPerClient,
      @JsonKey(name: 'experience', includeIfNull: false)
      final String? experience,
      @JsonKey(name: 'open_to_referral', includeIfNull: false)
      final bool? openToReferral}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String? get email;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'about', includeIfNull: false)
  String? get about;
  @override
  @JsonKey(name: 'signup_method', includeIfNull: false)
  int? get signupMethod;
  @override
  @JsonKey(name: 'email_verified', includeIfNull: false)
  bool? get emailVerified;
  @override
  @JsonKey(name: 'mobile_verified', includeIfNull: false)
  bool? get mobileVerified;
  @override
  @JsonKey(name: 'wizard_step', includeIfNull: false)
  int? get wizardStep;
  @override
  @JsonKey(name: 'wizard_completed', includeIfNull: false)
  bool? get wizardCompleted;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  DateTime? get joinDate;
  @override
  String? get mobile;
  @override
  String? get address;
  @override
  @JsonKey(name: 'avatar_url', includeIfNull: false)
  String? get avatarUrl;
  @override
  @JsonKey(name: 'banner_url', includeIfNull: false)
  String? get bannerUrl;
  @override
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId;
  @override
  @JsonKey(name: 'practice_area', includeIfNull: false)
  String? get practiceArea;
  @override
  @JsonKey(name: 'practice_location', includeIfNull: false)
  String? get practiceLocation;
  @override
  @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
  int? get caseResolutionRate;
  @override
  @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
  int? get averageBillingPerClient;
  @override
  @JsonKey(name: 'experience', includeIfNull: false)
  String? get experience;
  @override
  @JsonKey(name: 'open_to_referral', includeIfNull: false)
  bool? get openToReferral;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
