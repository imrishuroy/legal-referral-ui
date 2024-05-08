part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatInitialized extends ChatEvent {
  const ChatInitialized();
}

class ChatUpdated extends ChatEvent {
  const ChatUpdated({
    required this.message,
  });

  final Message? message;
}

class ChatAdded extends ChatEvent {
  const ChatAdded({
    required this.message,
  });

  final Message? message;
}
