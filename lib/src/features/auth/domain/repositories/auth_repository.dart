import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser?>> signUp({
    required AppUser appUser,
  });

  Future<Either<Failure, AppUser?>> signIn({
    required String email,
  });

  Future<Either<Failure, ResponseMsg?>> sendOTP({
    required SendOtpReq sendOtpReq,
  });

  Future<Either<Failure, ResponseMsg?>> verifyOTP({
    required VerifyOtpReq verifyOtpReq,
  });

  Future<Either<Failure, AppUser?>> getUser({
    required String userId,
  });
}
