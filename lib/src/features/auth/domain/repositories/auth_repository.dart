import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpResponse?>> signUp({
    required AppUser appUser,
  });

  Future<Either<Failure, AppUser?>> signIn({
    required String email,
  });

  Future<Either<Failure, SendEmailOtpRes?>> sendEmailOtp({
    required SendEmailOtpReq sendEmailOtpReq,
  });

  Future<Either<Failure, ResponseMsg?>> verifyEmailOtp({
    required VerifyEmailOtpReq verifyEmailOtpReq,
  });

  // Future<Either<Failure, AppUser>> getUser({
  //   required String? id,
  // });
}
