import 'package:dartz/dartz.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/chat/data/data.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<ChatMessage>>> fetchMessages({
    required String roomId,
    required int limit,
    required int offset,
  });

  Future<Either<Failure, ChatRoom?>> createChatRoom({
    required CreateChatRoomReq createChatRoomReq,
  });

  Future<Either<Failure, List<ChatRoom?>>> fetchChatRooms({
    required String userId,
  });
}
