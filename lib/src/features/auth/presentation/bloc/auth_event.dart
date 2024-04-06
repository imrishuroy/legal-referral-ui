part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialized extends AuthEvent {}

class AuthTempSignedUp extends AuthEvent {
  const AuthTempSignedUp({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  final String email;
  final String firstName;
  final String lastName;

  @override
  List<Object> get props => [email, firstName, lastName];
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
    required this.password,
    required this.userImageFile,
  });

  final String password;
  final XFile userImageFile;

  @override
  List<Object> get props => [password, userImageFile];
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

class AuthGoogleSignedIn extends AuthEvent {}

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

class EmailOTPSent extends AuthEvent {}

class EmailOTPVerified extends AuthEvent {
  const EmailOTPVerified({
    required this.otp,
    this.email,
  });

  final String? email;
  final String otp;
}

class MobileOTPRSent extends AuthEvent {
  const MobileOTPRSent({
    required this.mobile,
  });

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class MobileOTPVerified extends AuthEvent {
  const MobileOTPVerified({
    required this.otp,
    required this.mobile,
  });

  final String otp;
  final String mobile;

  @override
  List<Object> get props => [otp, mobile];
}

class AuthResetPassword extends AuthEvent {
  const AuthResetPassword({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}
