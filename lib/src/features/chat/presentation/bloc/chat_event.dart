part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatInitialized extends ChatEvent {
  const ChatInitialized();
}

class ConnectionFetched extends ChatEvent {
  const ConnectionFetched({
    required this.offset,
    required this.limit,
    required this.userId,
  });

  final int offset;
  final int limit;
  final String userId;

  @override
  List<Object> get props => [offset, limit, userId];
}

class ChatUpdated extends ChatEvent {
  const ChatUpdated({
    required this.chatRoom,
    required this.message,
  });

  final ChatRoom chatRoom;
  final ChatMessage? message;
}

class MessagesFetched extends ChatEvent {}

class ChatRoomCreated extends ChatEvent {
  const ChatRoomCreated({
    required this.senderId,
    required this.recipientId,
  });

  final String senderId;
  final String recipientId;

  @override
  List<Object> get props => [senderId, recipientId];
}

class ChatRoomFetched extends ChatEvent {
  const ChatRoomFetched({
    required this.userId,
  });

  final String userId;
}

class ChatMessageSent extends ChatEvent {
  const ChatMessageSent({
    required this.chatRoom,
    required this.message,
  });

  final ChatRoom chatRoom;
  final ChatMessage message;

  @override
  List<Object> get props => [chatRoom, message];
}

class ParentMesssgeUpdated extends ChatEvent {
  const ParentMesssgeUpdated({
    required this.message,
  });

  final ChatMessage message;

  @override
  List<Object> get props => [message];
}
