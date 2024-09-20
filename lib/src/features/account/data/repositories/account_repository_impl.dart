import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/account/data/data.dart';
import 'package:legal_referral_ui/src/features/account/domain/domain.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  AccountRepositoryImpl({
    required AccountDatasource accountDatasource,
  }) : _accountDatasource = accountDatasource;

  final AccountDatasource _accountDatasource;

  @override
  Future<Either<Failure, FAQ>> createFAQ({
    required FAQ faq,
  }) async {
    try {
      final response = await _accountDatasource.createFAQ(faq: faq);
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
  Future<Either<Failure, List<FAQ>>> fetchFAQs() async {
    try {
      final response = await _accountDatasource.fetchFAQs();
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
