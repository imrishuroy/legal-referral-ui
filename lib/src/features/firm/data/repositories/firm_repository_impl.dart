import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/firm/data/data.dart';
import 'package:legal_referral_ui/src/features/firm/domain/domain.dart';

@LazySingleton(as: FirmRepository)
class FirmRepositoryImpl extends FirmRepository {
  FirmRepositoryImpl({
    required FirmDataSource firmDataSource,
  }) : _firmDataSource = firmDataSource;

  final FirmDataSource _firmDataSource;

  @override
  Future<Either<Failure, Firm>> addFirm({required AddFirmReq firm}) async {
    try {
      final res = await _firmDataSource.addFirm(firm: firm);
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

  @override
  Future<Either<Failure, List<Firm>>> fetchMyFirms({
    required String ownerId,
  }) async {
    try {
      final firms = await _firmDataSource.fetchMyFirms(
        ownerId: ownerId,
      );
      return Right(firms);
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
