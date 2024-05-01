import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/data/data.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  final AuthDataSource _authDataSource;

  @override
  Future<Either<Failure, AppUser?>> createUser({
    required String email,
    required String firstName,
    required String lastName,
    required String? mobile,
    required int signUpMethod,
    String? imageUrl,
    File? userImage,
  }) async {
    try {
      final user = await _authDataSource.createUser(
        email: email,
        firstName: firstName,
        lastName: lastName,
        mobile: mobile,
        signUpMethod: signUpMethod,
        imageUrl: imageUrl,
        userImage: userImage,
      );
      return Right(user);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String?>> customSignUp({
    required AppUser appUser,
  }) async {
    try {
      final response = await _authDataSource.customSignUp(
        appUser: appUser,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppUser?>> signUp({
    required AppUser appUser,
  }) async {
    try {
      final response = await _authDataSource.signUp(
        appUser: appUser,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppUser?>> signIn({
    required String email,
  }) async {
    try {
      final userCredential = await _authDataSource.signIn(
        signInReq: SignInReq(
          email: email,
        ),
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (error) {
      return Left(
        Failure(
          message: error.message ?? error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, LinkedinSignInRes?>> signInWithLinkedIn({
    required LinkedinSignInReq signInWithLinkedInReq,
  }) async {
    try {
      final response = await _authDataSource.signInWithLinkedIn(
        signInWithLinkedInReq: signInWithLinkedInReq,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppUser?>> getUser({
    required String userId,
  }) async {
    try {
      final user = await _authDataSource.getUser(
        userId: userId,
      );
      return Right(user);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponseMsg?>> sendOTP({
    required SendOtpReq sendOtpReq,
  }) async {
    try {
      final response = await _authDataSource.sendOTP(
        sendOtpReq: sendOtpReq,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponseMsg?>> verifyOTP({
    required VerifyOtpReq verifyOtpReq,
  }) async {
    try {
      final response = await _authDataSource.verifyOTP(
        verifyOtpReq: verifyOtpReq,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponseMsg?>> resetPassword({
    required ResetPasswordReq resetPasswordReq,
  }) async {
    try {
      final response = await _authDataSource.resetPassword(
        resetPasswordReq: resetPasswordReq,
      );
      return Right(response);
    } on DioException catch (error) {
      final dioError = DioExceptions.fromDioError(error);
      return Left(
        Failure(
          statusCode: dioError.statusCode,
          message: dioError.message,
        ),
      );
    }
  }
}
