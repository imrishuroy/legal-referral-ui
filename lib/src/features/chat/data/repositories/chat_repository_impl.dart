import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/failure.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/chat/data/data.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  ChatRepositoryImpl({required ChatDataSource chatDataSource})
      : _chatDataSource = chatDataSource;

  final ChatDataSource _chatDataSource;

  @override
  Future<Either<Failure, List<ChatMessage>>> fetchMessages({
    required String roomId,
    required int limit,
    required int offset,
  }) async {
    try {
      final messages = await _chatDataSource.fetchMessages(
        roomId: roomId,
        limit: limit,
        offset: offset,
      );
      return Right(messages);
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
  Future<Either<Failure, ChatRoom?>> createChatRoom({
    required CreateChatRoomReq createChatRoomReq,
  }) async {
    try {
      final res = await _chatDataSource.createChatRoom(
        createChatRoomReq: createChatRoomReq,
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
  Future<Either<Failure, List<ChatRoom?>>> fetchChatRooms({
    required String userId,
  }) async {
    try {
      final chatRooms = await _chatDataSource.fetchChatRooms(
        userId: userId,
      );
      return Right(chatRooms);
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
