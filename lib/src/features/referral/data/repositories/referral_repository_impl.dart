import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/referral/data/data.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

@LazySingleton(as: ReferralRepository)
class ReferralRepositoryImpl extends ReferralRepository {
  ReferralRepositoryImpl({
    required ReferralDataSource referralDataSource,
  }) : _referralDataSource = referralDataSource;

  final ReferralDataSource _referralDataSource;

  @override
  Future<Either<Failure, String?>> addReferral({
    required AddReferralReq referral,
  }) async {
    try {
      final res = await _referralDataSource.addReferral(
        referral: referral,
      );
      return Right(res);
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
