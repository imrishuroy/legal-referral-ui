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
  Future<Either<Failure, SignUpResponse?>> signUp({
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
  Future<Either<Failure, ResponseMsg?>> verifyEmailOtp({
    required VerifyEmailOtpReq verifyEmailOtpReq,
  }) async {
    try {
      final response = await _authDataSource.verifyEmailOtp(
        verifyEmailOtpReq: verifyEmailOtpReq,
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
  Future<Either<Failure, SendEmailOtpRes?>> sendEmailOtp({
    required SendEmailOtpReq sendEmailOtpReq,
  }) async {
    try {
      final response = await _authDataSource.sendEmailOtp(
        sendEmailOtpReq: sendEmailOtpReq,
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
