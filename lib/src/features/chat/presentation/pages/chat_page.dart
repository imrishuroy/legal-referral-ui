import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:toastification/toastification.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  static const String name = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatBloc = getIt<ChatBloc>();

  @override
  void initState() {
    _chatBloc.add(const ChatInitialized());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _chatBloc.add(
            const ChatAdded(
              message: Message(
                type: 'message',
                content: 'Hello',
                sender: 'user2',
                recipient: 'user1',
                id: 'room1',
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: _chatBloc,
        listener: (context, state) {
          if (state.status == ChatStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: chat_ui.Chat(
                  // messages: state.messages
                  //     .map(
                  //       (message) => types.TextMessage(
                  //         author: types.User(id: '${message?.sender}'),
                  //         id: const Uuid().v4(),
                  //         text: message?.content ?? 'N/A',
                  //       ),
                  //     )
                  //     .toList(),
                  messages: state.chatMessages,
                  onAttachmentPressed: () {},
                  onMessageTap: (context, message) {},
                  onPreviewDataFetched: (_, __) {},
                  onSendPressed: (_) {},
                  showUserAvatars: true,
                  showUserNames: true,
                  user: const types.User(id: 'user1'),
                  theme: const chat_ui.DefaultChatTheme(
                    seenIcon: Text(
                      'read',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
          // return Column(
          //   children: [
          //     Expanded(
          //       child: ListView.builder(
          //         itemCount: state.messages.length,
          //         itemBuilder: (context, index) {
          //           final message = state.messages[index];
          //           return ListTile(
          //             title: Text(message?.content ?? 'N/A'),
          //             subtitle: Text(message?.sender ?? 'N/A'),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // );
        },
      ),
    );
  }
}
