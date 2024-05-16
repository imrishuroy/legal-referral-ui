import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';

@lazySingleton
class ChatUseCase {
  ChatUseCase({
    required ChatRepository chatRepository,
  }) : _chatRepository = chatRepository;

  final ChatRepository _chatRepository;

  Future<Either<Failure, List<ChatMessage>>> fetchMessages({
    required String roomId,
    required int limit,
    required int offset,
  }) async {
    return _chatRepository.fetchMessages(
      roomId: roomId,
      limit: limit,
      offset: offset,
    );
  }

  Future<Either<Failure, ChatRoom?>> createChatRoom({
    required ChatRoom chatRoom,
  }) async {
    return _chatRepository.createChatRoom(
      chatRoom: chatRoom,
    );
  }

  Future<Either<Failure, List<ChatRoom?>>> fetchChatRooms({
    required String userId,
  }) async {
    return _chatRepository.fetchChatRooms(
      userId: userId,
    );
  }
}
