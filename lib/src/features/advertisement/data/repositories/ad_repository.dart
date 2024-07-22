import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/config/response_message.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/advertisement/data/data.dart';
import 'package:legal_referral_ui/src/features/advertisement/domain/domain.dart';

@LazySingleton(as: AdRepository)
class AdRepositoryImpl extends AdRepository {
  AdRepositoryImpl({
    required AdDatasource adDatasource,
  }) : _adDatasource = adDatasource;

  final AdDatasource _adDatasource;

  @override
  Future<Either<Failure, ResponseMsg?>> createAd({
    required CreateAdReq ad,
  }) async {
    try {
      final response = await _adDatasource.createAd(ad: ad);
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
  Future<Either<Failure, List<Ad?>>> fetchExpiredAds() async {
    try {
      final response = await _adDatasource.fetchExpiredAds();
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
  Future<Either<Failure, List<Ad?>>> fetchPlayingAds() async {
    try {
      final response = await _adDatasource.fetchPlayingAds();
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
  Future<Either<Failure, Ad?>> extendAdPeriod({
    required ExtendAdReq ad,
  }) async {
    try {
      final response = await _adDatasource.extendAdPeriod(ad: ad);
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
