part of 'auth_bloc.dart';

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

enum ResetPasswordStatus {
  initial,
  loading,
  sent,
  failed,
  success,
}

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    this.emailOTPStatus = EmailOTPStatus.initial,
    this.mobileOTPStatus = MobileOTPStatus.initial,
    this.resetPasswordStatus = ResetPasswordStatus.initial,
    this.socialAvatarStatus = SocialAvatarStatus.initial,
    this.user,
    this.failure,
  });

  factory AuthState.initial() => const AuthState(
        authStatus: AuthStatus.initial,
      );

  final AuthStatus authStatus;
  final EmailOTPStatus emailOTPStatus;
  final MobileOTPStatus mobileOTPStatus;
  final ResetPasswordStatus resetPasswordStatus;
  final SocialAvatarStatus socialAvatarStatus;
  final AppUser? user;
  final Failure? failure;

  AuthState copyWith({
    AuthStatus? authStatus,
    EmailOTPStatus? emailOTPStatus,
    MobileOTPStatus? mobileOTPStatus,
    ResetPasswordStatus? resetPasswordStatus,
    SocialAvatarStatus? socialAvatarStatus,
    User? firebaseUser,
    AppUser? user,
    Failure? failure,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      emailOTPStatus: emailOTPStatus ?? this.emailOTPStatus,
      mobileOTPStatus: mobileOTPStatus ?? this.mobileOTPStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      socialAvatarStatus: socialAvatarStatus ?? this.socialAvatarStatus,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        authStatus,
        emailOTPStatus,
        mobileOTPStatus,
        resetPasswordStatus,
        socialAvatarStatus,
        user,
        failure,
      ];
}
