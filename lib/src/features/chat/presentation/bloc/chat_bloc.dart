import 'dart:async';
import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/data/data.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:legal_referral_ui/src/features/network/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_event.dart';
part 'chat_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const limit = 10;

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required AuthBloc authBloc,
    required NetworkUseCase networkUseCase,
    required ChatUseCase chatUseCase,
  })  : _authBloc = authBloc,
        _networkUseCase = networkUseCase,
        _chatUseCase = chatUseCase,
        super(ChatState.initial()) {
    if (_channel != null) {
      _chatSubscription = _channel?.stream
          .map((event) => ChatMessage.fromJson(jsonDecode(event)))
          .listen(
        (event) {
          add(
            ChatUpdated(
              message: event,
              chatRoom: state.currentChatRoom,
            ),
          );
        },
      );
    }
    on<ChatRoomCreated>(_onChatRoomCreated);
    on<ConnectionFetched>(_onConnectionFetched);
    on<ChatInitialized>(_onChatInitialized);
    on<ChatUpdated>(_onChatUpdated);
    on<MessagesFetched>(
      _onMessagesFetched,
      transformer: throttleDroppable(throttleDuration),
    );

    on<ChatRoomFetched>(_onChatRoomFetched);
    on<ChatMessageSent>(_onChatMessageSent);
    on<ParentMesssgeUpdated>(_onParentMessageUpdated);
  }
  final AuthBloc _authBloc;
  final NetworkUseCase _networkUseCase;
  final ChatUseCase _chatUseCase;
  StreamSubscription<ChatMessage?>? _chatSubscription;
  WebSocketChannel? _channel;

  Future<void> _onConnectionFetched(
    ConnectionFetched event,
    Emitter<ChatState> emit,
  ) async {
    final connections = await _networkUseCase.fetchConnections(
      userId: event.userId,
      offset: event.offset,
      limit: event.limit,
    );

    connections.fold(
      (failure) => emit(
        state.copyWith(
          status: ChatStatus.failure,
          failure: failure,
        ),
      ),
      (connections) => emit(
        state.copyWith(
          status: ChatStatus.success,
          connections: connections,
        ),
      ),
    );
  }

  void _onChatInitialized(
    ChatInitialized event,
    Emitter<ChatState> emit,
  ) {
    emit(
      state.copyWith(
        status: ChatStatus.loading,
        chatMessages: [],
        messages: [],
      ),
    );

    _channel = IOWebSocketChannel.connect(
      Uri.parse(
        'ws://${APIConstants.host}/api/chat/${state.currentChatRoom.roomId}',
      ),
      headers: {
        'Authorization': 'Bearer ${SharedPrefs.getIDToken()}',
      },
    );

    _chatSubscription = _channel?.stream
        .map((e) => ChatMessage.fromJson(jsonDecode(e)))
        .listen((e) {
      add(ChatUpdated(chatRoom: state.currentChatRoom, message: e));
    });
  }

  Future<void> _onMessagesFetched(
    MessagesFetched event,
    Emitter<ChatState> emit,
  ) async {
    if (state.hasReachedMax) return;
    final chatMessages = await _chatUseCase.fetchMessages(
      roomId: state.currentChatRoom.roomId,
      limit: limit,
      offset: state.offset,
    );

    chatMessages.fold((failure) {
      return emit(
        state.copyWith(
          status: ChatStatus.failure,
          failure: failure,
        ),
      );
    }, (messages) {
      if (messages.isEmpty) {
        return emit(
          state.copyWith(
            hasReachedMax: true,
            status: ChatStatus.success,
          ),
        );
      }

      emit(
        state.copyWith(
          status: ChatStatus.success,
          chatMessages: messages,
          messages: List.from(state.messages)
            ..addAll(
              messages.map((e) {
                final currentUserId = _authBloc.state.user?.userId;
                final currentUserAvatarUrl = _authBloc.state.user?.avatarUrl;
                final senderId = e.senderId;
                final otherUserAatarUrl = state.currentChatRoom.avatarUrl;

                final recepientAvatarUrl = currentUserId == senderId
                    ? currentUserAvatarUrl
                    : otherUserAatarUrl;

                return types.TextMessage(
                  author: types.User(
                    id: senderId,
                    imageUrl: recepientAvatarUrl,
                  ),
                  id: '${e.messageId}',
                  text: e.message,
                  createdAt: e.sentAt?.millisecondsSinceEpoch,
                  repliedMessage: e.repliedMessage != null
                      ? types.TextMessage(
                          author: types.User(
                            id: e.repliedMessage!.senderId,
                            imageUrl:
                                e.repliedMessage!.senderId == currentUserId
                                    ? currentUserAvatarUrl
                                    : otherUserAatarUrl,
                          ),
                          id: '${e.repliedMessage!.messageId}',
                          text: e.repliedMessage!.message,
                          createdAt:
                              e.repliedMessage!.sentAt?.millisecondsSinceEpoch,
                        )
                      : null,
                );
              }).toList(),
            ),
          offset: state.offset + 1,
        ),
      );
    });
  }

  void _onChatUpdated(
    ChatUpdated event,
    Emitter<ChatState> emit,
  ) {
    final currentUserId = _authBloc.state.user?.userId;
    final currentUserAvatarUrl = _authBloc.state.user?.avatarUrl;
    final senderId = event.message?.senderId ?? '';
    final otherUserAatarUrl = event.chatRoom.avatarUrl;

    final recepientAvatarUrl =
        currentUserId == senderId ? currentUserAvatarUrl : otherUserAatarUrl;

    emit(
      state.copyWith(
        messages: [
          types.TextMessage(
            author: types.User(
              id: senderId,
              imageUrl: recepientAvatarUrl,
            ),
            id: '${event.message?.messageId}',
            text: event.message?.message ?? 'N/A',
            createdAt: DateTime.now().millisecondsSinceEpoch,
            repliedMessage: state.parentMessage == null
                ? null
                : types.TextMessage(
                    author: types.User(
                      id: state.parentMessage?.senderId ?? '',
                      imageUrl: state.parentMessage?.senderId == currentUserId
                          ? currentUserAvatarUrl
                          : otherUserAatarUrl,
                    ),
                    text: state.parentMessage?.message ?? '',
                    id: '${state.parentMessage?.messageId ?? {
                          const Uuid().v4(),
                        }}',
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                  ),
          ),
          ...state.messages,
        ],
        // ignore: avoid_redundant_argument_values
        parentMessage: null,
      ),
    );
  }

  Future<void> _onChatRoomCreated(
    ChatRoomCreated event,
    Emitter<ChatState> emit,
  ) async {
    final roomID = createRoomID(
      event.senderId,
      event.recipientId,
    );

    AppLogger.info('Room ID: $roomID');

    final createChatRoomReq = CreateChatRoomReq(
      roomId: roomID,
      user1Id: event.senderId,
      user2Id: event.recipientId,
    );

    final res = await _chatUseCase.createChatRoom(
      createChatRoomReq: createChatRoomReq,
    );

    res.fold(
      (failure) => emit(
        state.copyWith(
          status: ChatStatus.failure,
          failure: failure,
        ),
      ),
      (chatRoom) => emit(
        state.copyWith(
          status: ChatStatus.chatRoomCreated,
          // chatRooms: state.chatRooms.contains(chatRoom)
          //     ? state.chatRooms
          //     : [
          //         chatRoom,
          //         ...state.chatRooms,
          //       ],
          currentChatRoom: chatRoom,
        ),
      ),
    );

    add(const ChatInitialized());
    add(MessagesFetched());
  }

  Future<void> _onChatRoomFetched(
    ChatRoomFetched event,
    Emitter<ChatState> emit,
  ) async {
    final chatRooms = await _chatUseCase.fetchChatRooms(
      userId: event.userId,
    );

    chatRooms.fold(
      (failure) => emit(
        state.copyWith(
          status: ChatStatus.failure,
          failure: failure,
        ),
      ),
      (chatRooms) => emit(
        state.copyWith(
          status: ChatStatus.success,
          chatRooms: chatRooms,
        ),
      ),
    );
  }

  Future<void> _onChatMessageSent(
    ChatMessageSent event,
    Emitter<ChatState> emit,
  ) async {
    _channel?.sink.add(jsonEncode(event.message.toJson()));
  }

  void _onParentMessageUpdated(
    ParentMesssgeUpdated event,
    Emitter<ChatState> emit,
  ) {
    emit(
      state.copyWith(
        parentMessage: event.message,
      ),
    );
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    _channel?.sink.close();
    return super.close();
  }

  String createRoomID(String userID1, String userID2) {
    // Sort the user IDs lexicographically
    final sortedUserIDs = [userID1, userID2]..sort();

    // Concatenate the sorted user IDs
    final concatenated = sortedUserIDs[0] + sortedUserIDs[1];

    // Hash the concatenated string using SHA-1
    final List<int> bytes = utf8.encode(concatenated);
    final hash = sha1.convert(bytes);

    // Convert the hashed bytes to a hexadecimal string
    final roomID = hash.toString();

    return roomID;
  }
}
