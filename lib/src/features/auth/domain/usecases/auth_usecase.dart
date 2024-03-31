import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

@lazySingleton
class AuthUseCase {
  AuthUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  Future<Either<Failure, SignUpResponse?>> signUp({
    required AppUser appUser,
  }) async {
    return _authRepository.signUp(
      appUser: appUser,
    );
  }

  Future<Either<Failure, AppUser?>> signIn({
    required String email,
  }) async {
    return _authRepository.signIn(
      email: email,
    );
  }

  Future<Either<Failure, ResponseMsg?>> verifyEmailOtp({
    required VerifyEmailOtpReq verifyEmailOtpReq,
  }) async {
    return _authRepository.verifyEmailOtp(
      verifyEmailOtpReq: verifyEmailOtpReq,
    );
  }

  Future<Either<Failure, SendEmailOtpRes?>> sendEmailOtp({
    required SendEmailOtpReq sendEmailOtpReq,
  }) async {
    return _authRepository.sendEmailOtp(
      sendEmailOtpReq: sendEmailOtpReq,
    );
  }

  Future<Either<Failure, AppUser?>> getUser({
    required String userId,
  }) async {
    return _authRepository.getUser(
      userId: userId,
    );
  }
}
