part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserRequested extends AuthEvent {
  const AuthUserRequested({
    required this.userId,
  });

  final String userId;

  @override
  List<Object> get props => [userId];
}

class AuthSignedUp extends AuthEvent {
  const AuthSignedUp({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  final String email;
  final String password;
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [email, password, firstName, lastName];
}

class AuthSignedIn extends AuthEvent {
  const AuthSignedIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class AuthUserCreated extends AuthEvent {
  const AuthUserCreated({
    required this.email,
    required this.name,
  });

  final String email;
  final String name;

  @override
  List<Object> get props => [email, name];
}

class AuthSignOutRequested extends AuthEvent {}

class EmailOtpResend extends AuthEvent {
  const EmailOtpResend({
    this.email,
  });

  final String? email;
}

class EmailOtpVerified extends AuthEvent {
  const EmailOtpVerified({
    required this.otp,
    this.email,
  });

  final String? email;
  final int otp;
}
