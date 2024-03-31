import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/wizard/data/data.dart';
import 'package:legal_referral_ui/src/features/wizard/domain/domain.dart';

@LazySingleton(as: WizardRepository)
class WizardRepositoryImpl implements WizardRepository {
  WizardRepositoryImpl({required WizardDataSource wizardDataSource})
      : _wizardDataSource = wizardDataSource;

  final WizardDataSource _wizardDataSource;

  @override
  Future<Either<Failure, ResponseMsg?>> sendMobileOtp({
    required SendMobileOtpReq sendMobileOtpReq,
  }) async {
    try {
      final response = await _wizardDataSource.sendMobileOtp(
        sendMobileOtpReq: sendMobileOtpReq,
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
  Future<Either<Failure, ResponseMsg?>> verifyMobileOtp({
    required VerifyMobileOtpReq verifyMobileOtpReq,
  }) async {
    try {
      final response = await _wizardDataSource.verifyMobileOtp(
        verifyMobileOtpReq: verifyMobileOtpReq,
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
  Future<Either<Failure, License?>> saveLicense({
    required License license,
  }) async {
    try {
      final response = await _wizardDataSource.saveLicense(
        license: license,
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
  Future<Either<Failure, int?>> getWizardStep({required String userId}) async {
    try {
      final response = await _wizardDataSource.getWizardStep(
        userId: userId,
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
