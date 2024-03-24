part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  signedIn,
  signedUp,

  failure,
}

enum UserStatus { unAuthorized, authorized }

class AuthState extends Equatable {
  const AuthState({
    required this.authStatus,
    required this.userStatus,
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
  final User? firebaseUser;
  final AppUser? user;
  final Failure? failure;

  AuthState copyWith({
    AuthStatus? authStatus,
    UserStatus? userStatus,
    User? firebaseUser,
    AppUser? user,
    Failure? failure,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      userStatus: userStatus ?? this.userStatus,
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
        firebaseUser,
        user,
        failure,
      ];
}
