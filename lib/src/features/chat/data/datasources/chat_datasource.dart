import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/network/network.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';

@singleton
class ChatDataSource {
  ChatDataSource({
    required APIClient apiClient,
  }) : _apiClient = apiClient;

  final APIClient _apiClient;

  Future<List<ChatMessage>> fetchMessages({
    required String roomId,
    required int limit,
    required int offset,
  }) async {
    try {
      final messages = await _apiClient.fetchMessages(
        roomId,
        limit,
        offset,
      );
      return messages;
    } catch (error) {
      rethrow;
    }
  }

  Future<ChatRoom?> createChatRoom({
    required ChatRoom chatRoom,
  }) async {
    try {
      final res = await _apiClient.createChatRoom(
        chatRoom,
      );
      return res;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<ChatRoom?>> fetchChatRooms({
    required String userId,
  }) async {
    try {
      final chatRooms = await _apiClient.fetchChatRooms(
        userId,
      );
      return chatRooms;
    } catch (error) {
      rethrow;
    }
  }
}
