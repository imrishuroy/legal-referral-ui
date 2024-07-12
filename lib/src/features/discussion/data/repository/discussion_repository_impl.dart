import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/config/response_message.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/auth/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/data/data.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

@LazySingleton(as: DiscussionRepository)
class DiscussionRepositoryImpl implements DiscussionRepository {
  DiscussionRepositoryImpl({
    required DiscussionDatasource discussionDatasource,
  }) : _discussionDatasource = discussionDatasource;

  final DiscussionDatasource _discussionDatasource;

  @override
  Future<Either<Failure, Discussion?>> createDiscussion({
    required CreateDiscussionReq createDiscussionReq,
  }) async {
    try {
      final discussion = await _discussionDatasource.createDiscussion(
        createDiscussionReq: createDiscussionReq,
      );
      return Right(discussion);
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
  Future<Either<Failure, List<AppUser?>>> fetchConnectedUsers({
    required String userId,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _discussionDatasource.fetchConnectedUsers(
        userId: userId,
        limit: limit,
        offset: offset,
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

  @override
  Future<Either<Failure, List<AppUser?>>> fetchUsers({
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _discussionDatasource.fetchUsers(
        limit: limit,
        offset: offset,
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

  @override
  Future<Either<Failure, List<Discussion?>>> fetchActiveDiscussions({
    required String userId,
  }) async {
    try {
      final res = await _discussionDatasource.fetchActiveDiscussions(
        userId: userId,
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

  @override
  Future<Either<Failure, List<DiscussionInviteRes?>>> fetchDiscussionInvites({
    required String userId,
  }) async {
    try {
      final res = await _discussionDatasource.fetchDiscussionInvites(
        userId: userId,
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

  @override
  Future<Either<Failure, List<DiscussionMessage>>> fetchDiscussionMessages({
    required int discussionId,
    required int limit,
    required int offset,
  }) async {
    try {
      final res = await _discussionDatasource.fetchDiscussionMessages(
        discussionId: discussionId,
        limit: limit,
        offset: offset,
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

  @override
  Future<Either<Failure, DiscussionMessage?>> sendMessageToDiscussion({
    required DiscussionMessage discussionMessage,
  }) async {
    try {
      final res = await _discussionDatasource.sendMessageToDiscussion(
        discussionMessage: discussionMessage,
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

  @override
  Future<Either<Failure, ResponseMsg>> joinDiscussion({
    required int discussionId,
  }) async {
    try {
      final res = await _discussionDatasource.joinDiscussion(
        discussionId: discussionId,
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

  @override
  Future<Either<Failure, ResponseMsg>> rejectDiscussion({
    required int discussionId,
  }) async {
    try {
      final res = await _discussionDatasource.rejectDiscussion(
        discussionId: discussionId,
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

  @override
  Future<Either<Failure, List<AppUser?>>> fetchDiscussionParticipants({
    required int discussionId,
  }) async {
    try {
      final res = await _discussionDatasource.fetchDiscussionParticipants(
        discussionId: discussionId,
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
