part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

class ChatState extends Equatable {
  const ChatState({
    required this.status,
    this.messages = const <Message>[],
    this.chatMessages = const <types.Message>[],
    this.failure,
  });

  factory ChatState.initial() {
    return const ChatState(
      status: ChatStatus.initial,
    );
  }

  final ChatStatus status;
  final List<Message?> messages;
  final List<types.Message> chatMessages;
  final Failure? failure;

  ChatState copyWith({
    ChatStatus? status,
    List<Message?>? messages,
    List<types.Message>? chatMessages,
    Failure? failure,
  }) {
    return ChatState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      chatMessages: chatMessages ?? this.chatMessages,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        messages,
        chatMessages,
        failure,
      ];
}
