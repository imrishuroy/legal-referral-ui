part of 'auth_bloc.dart';

enum SignUpStep {
  signUp,
  contact,
  socialAvatar,
}

enum AuthStatus {
  initial,
  loading,
  success,
  signedIn,
  signedUp,
  failure,
}

enum EmailOTPStatus {
  initial,
  loading,
  sent,
  verified,
  failure,
}

enum MobileOTPStatus {
  initial,
  loading,
  sent,
  verified,
  failed,
}

enum SocialAvatarStatus {
  initial,
  loading,
  success,
  failure,
}

enum UserStatus {
  unAuthorized,
  authorized,
}

enum ResetPasswordStatus {
  initial,
  loading,
  sent,
  failed,
}

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    required this.userStatus,
    this.emailOTPStatus = EmailOTPStatus.initial,
    this.mobileOTPStatus = MobileOTPStatus.initial,
    this.resetPasswordStatus = ResetPasswordStatus.initial,
    this.socialAvatarStatus = SocialAvatarStatus.initial,
    this.signUpStep = SignUpStep.signUp,
    this.firebaseUser,
    this.user,
    this.failure,
  });

  factory AuthState.initial() => const AuthState(
        authStatus: AuthStatus.initial,
        userStatus: UserStatus.unAuthorized,
      );

  final AuthStatus authStatus;
  final UserStatus userStatus;
  final EmailOTPStatus emailOTPStatus;
  final MobileOTPStatus mobileOTPStatus;
  final ResetPasswordStatus resetPasswordStatus;
  final SocialAvatarStatus socialAvatarStatus;
  final SignUpStep signUpStep;
  final User? firebaseUser;
  final AppUser? user;
  final Failure? failure;

  AuthState copyWith({
    AuthStatus? authStatus,
    UserStatus? userStatus,
    EmailOTPStatus? emailOTPStatus,
    MobileOTPStatus? mobileOTPStatus,
    ResetPasswordStatus? resetPasswordStatus,
    SocialAvatarStatus? socialAvatarStatus,
    SignUpStep? signUpStep,
    User? firebaseUser,
    AppUser? user,
    Failure? failure,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      userStatus: userStatus ?? this.userStatus,
      emailOTPStatus: emailOTPStatus ?? this.emailOTPStatus,
      mobileOTPStatus: mobileOTPStatus ?? this.mobileOTPStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      socialAvatarStatus: socialAvatarStatus ?? this.socialAvatarStatus,
      signUpStep: signUpStep ?? this.signUpStep,
      firebaseUser: firebaseUser ?? this.firebaseUser,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        authStatus,
        userStatus,
        emailOTPStatus,
        mobileOTPStatus,
        resetPasswordStatus,
        socialAvatarStatus,
        signUpStep,
        firebaseUser,
        user,
        failure,
      ];
}
