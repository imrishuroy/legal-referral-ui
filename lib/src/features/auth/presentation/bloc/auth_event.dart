part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
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

class EmailOtpResend extends AuthEvent {}

class EmailOtpVerified extends AuthEvent {
  const EmailOtpVerified({
    required this.otp,
  });

  final int otp;

  @override
  List<Object> get props => [otp];
}
