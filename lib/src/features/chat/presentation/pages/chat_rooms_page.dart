import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class ChatRoomsPage extends StatefulWidget {
  const ChatRoomsPage({super.key});
  static const String name = 'ChatRoomsPage';

  @override
  State<ChatRoomsPage> createState() => _ChatRoomsPageState();
}

class _ChatRoomsPageState extends State<ChatRoomsPage> {
  final _authBloc = getIt<AuthBloc>();
  final _chatBloc = getIt<ChatBloc>();

  @override
  void initState() {
    if (_authBloc.state.user?.userId != null) {
      _chatBloc.add(
        ChatRoomFetched(
          userId: _authBloc.state.user!.userId!,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Rooms'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LegalReferralColors.buttonPrimary,
        onPressed: () => context.pushNamed(
          UserConnectionsPage.name,
          extra: _chatBloc,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: _chatBloc,
        listener: (context, state) {
          if (state.status == ChatStatus.failure) {
            ToastUtil.showToast(
              context,
              title: 'Error',
              description: state.failure?.message ?? 'Something went wrong',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state.status == ChatStatus.loading) {
            return const CustomLoadingIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.chatRooms.length,
                  itemBuilder: (context, index) {
                    final chatRoom = state.chatRooms[index];
                    return ListTile(
                      title: Text(
                        '${chatRoom?.user2FirstName ?? 'N/A'}'
                        ' ${chatRoom?.user2LastName ?? 'N/A'}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(chatRoom?.lastMessage ?? ''),
                      leading: CustomAvatar(
                        imageUrl: chatRoom?.user2AvatarUrl,
                        radius: 24,
                      ),
                      splashColor: Colors.transparent,
                      onTap: () => context.pushNamed(
                        ChatMessagesPage.name,
                        extra: chatRoom,
                      ),
                      trailing: Text(
                        chatRoom?.lastMessageAt != null
                            ? DateTimeUtil.timeAgo(chatRoom!.lastMessageAt)
                            : '',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
