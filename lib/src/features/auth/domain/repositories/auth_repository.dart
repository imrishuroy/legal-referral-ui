import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, EmailAuthRes?>> signInWithEmail({
    required EmailSignInReq emailSignInReq,
  });

  Future<Either<Failure, EmailAuthRes?>> signUpWithEmail({
    required EmailSignUpReq emailSignUpReq,
  });

  Future<Either<Failure, RefreshTokenRes?>> refreshToken({
    required RefreshTokenReq refreshTokenReq,
  });

  Future<Either<Failure, AppUser?>> createUser({
    required String email,
    required String firstName,
    required String lastName,
    required String? mobile,
    required int signUpMethod,
    String? imageUrl,
    File? userImage,
  });

  Future<Either<Failure, String?>> customSignUp({
    required AppUser appUser,
  });

  Future<Either<Failure, AppUser?>> signUp({
    required AppUser appUser,
  });

  Future<Either<Failure, AppUser?>> signIn({
    required String email,
  });

  Future<Either<Failure, LinkedinSignInRes?>> signInWithLinkedIn({
    required LinkedinSignInReq signInWithLinkedInReq,
  });

  Future<Either<Failure, ResponseMsg?>> sendOTP({
    required SendOtpReq sendOtpReq,
  });

  Future<Either<Failure, ResponseMsg?>> verifyOTP({
    required VerifyOtpReq verifyOtpReq,
  });

  Future<Either<Failure, ResponseMsg?>> resetPassword({
    required ResetPasswordReq resetPasswordReq,
  });

  Future<Either<Failure, AppUser?>> getUser({
    required String userId,
  });

  Future<Either<Failure, void>> saveDeviceDetails({
    required DeviceDetails deviceDetails,
  });
}
