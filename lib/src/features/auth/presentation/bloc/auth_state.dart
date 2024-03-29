part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  signedIn,
  signedUp,
  failure,
}

enum EmailOtpStatus {
  initial,
  verifying,
  sent,
  resent,
  verified,
  failed,
}

enum UserStatus { unAuthorized, authorized }

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    required this.userStatus,
    this.emailOtpStatus = EmailOtpStatus.initial,
    this.firebaseUser,
    this.user,
    this.sessionId,
    this.failure,
  });

  factory AuthState.initial() => const AuthState(
        authStatus: AuthStatus.initial,
        userStatus: UserStatus.unAuthorized,
      );

  final AuthStatus authStatus;
  final UserStatus userStatus;
  final EmailOtpStatus emailOtpStatus;
  final User? firebaseUser;
  final AppUser? user;
  final int? sessionId;
  final Failure? failure;

  AuthState copyWith({
    AuthStatus? authStatus,
    UserStatus? userStatus,
    EmailOtpStatus? emailOtpStatus,
    User? firebaseUser,
    AppUser? user,
    int? sessionId,
    Failure? failure,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      userStatus: userStatus ?? this.userStatus,
      emailOtpStatus: emailOtpStatus ?? this.emailOtpStatus,
      firebaseUser: firebaseUser ?? this.firebaseUser,
      user: user ?? this.user,
      sessionId: sessionId ?? this.sessionId,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        authStatus,
        userStatus,
        emailOtpStatus,
        firebaseUser,
        user,
        sessionId,
        failure,
      ];
}
