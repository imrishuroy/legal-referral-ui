import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/network/data/data.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';

@LazySingleton(as: NetworkRepository)
class NetworkRepositoryImpl extends NetworkRepository {
  NetworkRepositoryImpl({
    required NetworkDataSource networkDataSource,
  }) : _networkDataSource = networkDataSource;

  final NetworkDataSource _networkDataSource;

  @override
  Future<Either<Failure, ResponseMsg?>> sendConnection({
    required SendConnectionReq sendConnectionReq,
  }) async {
    try {
      final responseMsg = await _networkDataSource.sendConnection(
        sendConnectionReq: sendConnectionReq,
      );
      return Right(responseMsg);
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
  Future<Either<Failure, Connection?>> acceptConnection({
    required int id,
  }) async {
    try {
      final responseMsg = await _networkDataSource.acceptConnection(
        id: id,
      );
      return Right(responseMsg);
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
  Future<Either<Failure, ResponseMsg?>> rejectConnection({
    required int id,
  }) async {
    try {
      final responseMsg = await _networkDataSource.rejectConnection(
        id: id,
      );
      return Right(responseMsg);
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
  Future<Either<Failure, List<ConnectionInvitation?>>>
      fetchConnectionInvitations({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    try {
      final connectionInvitations =
          await _networkDataSource.fetchConnectionInvitations(
        userId: userId,
        offset: offset,
        limit: limit,
      );
      return Right(connectionInvitations);
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
  Future<Either<Failure, List<Connection?>>> fetchConnections({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    try {
      final connections = await _networkDataSource.fetchConnections(
        userId: userId,
        offset: offset,
        limit: limit,
      );
      return Right(connections);
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
  Future<Either<Failure, List<Recommendation?>>> fetchRecommendations({
    required String userId,
    required int offset,
    required int limit,
  }) async {
    try {
      final recommendations = await _networkDataSource.fetchRecommendations(
        userId: userId,
        offset: offset,
        limit: limit,
      );
      return Right(recommendations);
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
  Future<Either<Failure, ResponseMsg?>> cancelRecommendation({
    required CancelRecommendationReq cancelRecommendationReq,
  }) async {
    try {
      final responseMsg = await _networkDataSource.cancelRecommendation(
        cancelRecommendationReq: cancelRecommendationReq,
      );
      return Right(responseMsg);
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
  Future<Either<Failure, UserConnectionStatus>> checkConnection({
    required String userId,
    required String otherUserId,
  }) async {
    try {
      final responseMsg = await _networkDataSource.checkConnection(
        userId: userId,
        otherUserId: otherUserId,
      );

      return Right(
        responseMsg,
      );
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
