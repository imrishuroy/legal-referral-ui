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

  @override
  Future<Either<Failure, ResponseMsg?>> saveAboutYou({
    required AboutYouReq aboutYouReq,
  }) async {
    try {
      final response = await _wizardDataSource.saveAboutYou(
        aboutYouReq: aboutYouReq,
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
  Future<Either<Failure, ResponseMsg?>> uploadUserImage({
    required UploadUserImageReq uploadUserImageReq,
  }) async {
    try {
      final response = await _wizardDataSource.uploadProfileImage(
        uploadUserImageReq: uploadUserImageReq,
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
  Future<Either<Failure, ResponseMsg?>> uploadLicense({
    required UploadLicenseReq uploadLicenseReq,
  }) async {
    try {
      final response = await _wizardDataSource.uploadLicense(
        uploadLicenseReq: uploadLicenseReq,
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
