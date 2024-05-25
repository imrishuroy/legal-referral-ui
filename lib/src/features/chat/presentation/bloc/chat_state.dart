part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure, chatRoomCreated }

class ChatState extends Equatable {
  const ChatState({
    required this.status,
    required this.currentChatRoom,
    this.connections = const <Connection>[],
    this.chatRooms = const <ChatRoom>[],
    this.chatMessages = const <ChatMessage>[],
    this.messages = const <types.Message>[],
    this.parentMessage,
    this.offset = 1,
    this.hasReachedMax = false,
    this.failure,
  });

  factory ChatState.initial() {
    return const ChatState(
      status: ChatStatus.initial,
      currentChatRoom: ChatRoom(
        roomId: '',
        userId: '',
      ),
    );
  }

  final ChatStatus status;
  final List<Connection?> connections;
  final List<ChatRoom?> chatRooms;
  final List<ChatMessage?> chatMessages;
  final List<types.Message> messages;
  final ChatRoom currentChatRoom;
  final ChatMessage? parentMessage;
  final bool hasReachedMax;
  final int offset;
  final Failure? failure;

  ChatState copyWith({
    ChatStatus? status,
    List<Connection?>? connections,
    List<ChatRoom?>? chatRooms,
    List<ChatMessage?>? chatMessages,
    List<types.Message>? messages,
    ChatRoom? currentChatRoom,
    ChatMessage? parentMessage,
    int? offset,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return ChatState(
      status: status ?? this.status,
      connections: connections ?? this.connections,
      chatRooms: chatRooms ?? this.chatRooms,
      messages: messages ?? this.messages,
      chatMessages: chatMessages ?? this.chatMessages,
      currentChatRoom: currentChatRoom ?? this.currentChatRoom,
      parentMessage: parentMessage,
      offset: offset ?? this.offset,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        connections,
        chatRooms,
        messages,
        chatMessages,
        currentChatRoom,
        parentMessage,
        offset,
        hasReachedMax,
        failure,
      ];
}
