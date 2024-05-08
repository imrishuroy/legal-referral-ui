import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@singleton
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    // checking if the client is initialized
    if (_channel != null) {
      _chatSubscription = _channel?.stream
          .map((event) => Message.fromJson(jsonDecode(event)))
          .listen((event) {
        add(ChatUpdated(message: event));
      });
    }

    on<ChatInitialized>(_onChatInitialized);
    on<ChatUpdated>(_onChatUpdated);
    on<ChatAdded>(_onChatAdded);
  }
  StreamSubscription<Message?>? _chatSubscription;
  WebSocketChannel? _channel;

  void _onChatInitialized(
    ChatInitialized event,
    Emitter<ChatState> emit,
  ) {
    emit(state.copyWith(status: ChatStatus.loading));
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.29.66:8080/api/chat/room1'),
    );
    _chatSubscription = _channel?.stream
        .map((event) => Message.fromJson(jsonDecode(event)))
        .listen((event) {
      add(ChatUpdated(message: event));
    });
    emit(state.copyWith(status: ChatStatus.success));
  }

  void _onChatUpdated(
    ChatUpdated event,
    Emitter<ChatState> emit,
  ) {
    emit(
      state.copyWith(
        messages: [...state.messages, event.message],
        chatMessages: [
          ...state.chatMessages,
          types.TextMessage(
            author: types.User(id: event.message?.sender ?? 'user1'),
            id: const Uuid().v4(),
            text: event.message?.content ?? '',
          ),
        ],
        status: ChatStatus.success,
      ),
    );
  }

  void _onChatAdded(
    ChatAdded event,
    Emitter<ChatState> emit,
  ) {
    _channel?.sink.add(jsonEncode(event.message?.toJson()));
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }
}
