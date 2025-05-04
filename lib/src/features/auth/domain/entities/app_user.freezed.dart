// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {
  String? get email;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  @JsonKey(name: 'about', includeIfNull: false)
  String? get about;
  @JsonKey(name: 'signup_method', includeIfNull: false)
  int? get signupMethod;
  @JsonKey(name: 'email_verified', includeIfNull: false)
  bool? get emailVerified;
  @JsonKey(name: 'mobile_verified', includeIfNull: false)
  bool? get mobileVerified;
  @JsonKey(name: 'wizard_step', includeIfNull: false)
  int? get wizardStep;
  @JsonKey(name: 'wizard_completed', includeIfNull: false)
  bool? get wizardCompleted;
  @DateTimeConverter()
  @JsonKey(name: 'join_date', includeToJson: false)
  DateTime? get joinDate;
  String? get mobile;
  String? get address;
  @JsonKey(name: 'avatar_url', includeIfNull: false)
  String? get avatarUrl;
  @JsonKey(name: 'banner_url', includeIfNull: false)
  String? get bannerUrl;
  @JsonKey(name: 'user_id', includeIfNull: false)
  String? get userId;
  @JsonKey(name: 'practice_area', includeIfNull: false)
  String? get practiceArea;
  @JsonKey(name: 'practice_location', includeIfNull: false)
  String? get practiceLocation;
  @JsonKey(name: 'case_resolution_rate', includeIfNull: false)
  int? get caseResolutionRate;
  @JsonKey(name: 'average_billing_per_client', includeIfNull: false)
  int? get averageBillingPerClient;
  @JsonKey(name: 'experience', includeIfNull: false)
  String? get experience;
  @JsonKey(name: 'open_to_referral', includeIfNull: false)
  bool? get openToReferral;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<AppUser> get copyWith =>
      _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUser &&
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

  @override
  String toString() {
    return 'AppUser(email: $email, firstName: $firstName, lastName: $lastName, about: $about, signupMethod: $signupMethod, emailVerified: $emailVerified, mobileVerified: $mobileVerified, wizardStep: $wizardStep, wizardCompleted: $wizardCompleted, joinDate: $joinDate, mobile: $mobile, address: $address, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, userId: $userId, practiceArea: $practiceArea, practiceLocation: $practiceLocation, caseResolutionRate: $caseResolutionRate, averageBillingPerClient: $averageBillingPerClient, experience: $experience, openToReferral: $openToReferral)';
  }
}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) =
      _$AppUserCopyWithImpl;
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
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

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
    return _then(_self.copyWith(
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      signupMethod: freezed == signupMethod
          ? _self.signupMethod
          : signupMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileVerified: freezed == mobileVerified
          ? _self.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      wizardStep: freezed == wizardStep
          ? _self.wizardStep
          : wizardStep // ignore: cast_nullable_to_non_nullable
              as int?,
      wizardCompleted: freezed == wizardCompleted
          ? _self.wizardCompleted
          : wizardCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinDate: freezed == joinDate
          ? _self.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _self.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _self.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _self.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: freezed == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      openToReferral: freezed == openToReferral
          ? _self.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppUser implements AppUser {
  const _AppUser(
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
  factory _AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

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

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUser &&
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

  @override
  String toString() {
    return 'AppUser(email: $email, firstName: $firstName, lastName: $lastName, about: $about, signupMethod: $signupMethod, emailVerified: $emailVerified, mobileVerified: $mobileVerified, wizardStep: $wizardStep, wizardCompleted: $wizardCompleted, joinDate: $joinDate, mobile: $mobile, address: $address, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, userId: $userId, practiceArea: $practiceArea, practiceLocation: $practiceLocation, caseResolutionRate: $caseResolutionRate, averageBillingPerClient: $averageBillingPerClient, experience: $experience, openToReferral: $openToReferral)';
  }
}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) =
      __$AppUserCopyWithImpl;
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
class __$AppUserCopyWithImpl<$Res> implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AppUser(
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _self.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      signupMethod: freezed == signupMethod
          ? _self.signupMethod
          : signupMethod // ignore: cast_nullable_to_non_nullable
              as int?,
      emailVerified: freezed == emailVerified
          ? _self.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileVerified: freezed == mobileVerified
          ? _self.mobileVerified
          : mobileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      wizardStep: freezed == wizardStep
          ? _self.wizardStep
          : wizardStep // ignore: cast_nullable_to_non_nullable
              as int?,
      wizardCompleted: freezed == wizardCompleted
          ? _self.wizardCompleted
          : wizardCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      joinDate: freezed == joinDate
          ? _self.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _self.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _self.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceArea: freezed == practiceArea
          ? _self.practiceArea
          : practiceArea // ignore: cast_nullable_to_non_nullable
              as String?,
      practiceLocation: freezed == practiceLocation
          ? _self.practiceLocation
          : practiceLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      caseResolutionRate: freezed == caseResolutionRate
          ? _self.caseResolutionRate
          : caseResolutionRate // ignore: cast_nullable_to_non_nullable
              as int?,
      averageBillingPerClient: freezed == averageBillingPerClient
          ? _self.averageBillingPerClient
          : averageBillingPerClient // ignore: cast_nullable_to_non_nullable
              as int?,
      experience: freezed == experience
          ? _self.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as String?,
      openToReferral: freezed == openToReferral
          ? _self.openToReferral
          : openToReferral // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
