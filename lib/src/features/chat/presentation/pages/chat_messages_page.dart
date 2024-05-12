import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/chat/domain/domain.dart';
import 'package:legal_referral_ui/src/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:toastification/toastification.dart';

class ChatMessagesPage extends StatefulWidget {
  const ChatMessagesPage({
    required this.chatRoom,
    super.key,
  });

  final ChatRoom chatRoom;

  static const String name = 'ChatMessagesPage';

  @override
  State<ChatMessagesPage> createState() => _ChatMessagesPageState();
}

class _ChatMessagesPageState extends State<ChatMessagesPage> {
  final _authBloc = getIt<AuthBloc>();
  final _chatBloc = getIt<ChatBloc>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _chatBloc.add(
      ChatInitialized(
        chatRoom: widget.chatRoom,
      ),
    );
    _chatBloc.add(
      MessagesFetched(
        chatRoom: widget.chatRoom,
      ),
    );
    super.initState();
  }

  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final currentUser = _authBloc.state.user;
    if (currentUser == null) {
      return const Scaffold(body: CustomLoadingIndicator());
    }

    final user = types.User(
      id: currentUser.userId ?? '',
      imageUrl: currentUser.avatarUrl,
      firstName: currentUser.firstName,
      lastName: currentUser.lastName,
      createdAt: currentUser.joinDate?.millisecondsSinceEpoch,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.chatRoom.user2FirstName}'
            ' ${widget.chatRoom.user2LastName}'),
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
          if (state.status == ChatStatus.loading) {
            return const CustomLoadingIndicator();
          }
          return chat_ui.Chat(
            messages: state.messages,
            bubbleBuilder: _bubbleBuilder,
            onAttachmentPressed: () {},
            onMessageTap: (context, message) {},
            onPreviewDataFetched: (_, __) {},
            onSendPressed: (_) {},
            showUserAvatars: true,
            showUserNames: true,
            timeFormat: DateFormat('HH:mm'),
            dateFormat: DateFormat('yyyy-MM-dd'),
            user: user,
            textMessageBuilder: _textMessageBuilder,
            theme: chat_ui.DefaultChatTheme(
              sentMessageBodyTextStyle: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              seenIcon: Text(
                'read',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            customBottomWidget: SizedBox(
              height: kToolbarHeight +
                  18.h +
                  (state.parentMessage != null
                      ? (state.parentMessage!.message.length > 8 ? 44.h : 24.h)
                      : 0),
              child: BottomAppBar(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                shadowColor: Colors.grey,
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.parentMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Repling to: ${state.parentMessage?.message}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            focusNode: _focusNode,
                            hintText: 'Your message here',
                            controller: _textEditingController,
                            onChanged: (value) {
                              return null;
                            },
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            ImageStringConstants.send,
                            colorFilter: const ColorFilter.mode(
                              Colors.blue,
                              BlendMode.srcIn,
                            ),
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            _chatBloc.add(
                              ChatMessageSent(
                                chatRoom: widget.chatRoom,
                                message: ChatMessage(
                                  senderId: currentUser.userId ?? '',
                                  recipientId: widget.chatRoom.user2Id,
                                  parentMessageId:
                                      state.parentMessage?.messageId ?? 0,
                                  message: _textEditingController.text,
                                  roomId: widget.chatRoom.roomId,
                                  repliedMessage: state.parentMessage,
                                ),
                              ),
                            );
                            _textEditingController.clear();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            onEndReached: () async {
              _chatBloc.add(
                MessagesFetched(
                  chatRoom: widget.chatRoom,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _replyToMessage({required ChatMessage parentMessage}) {
    _chatBloc.add(
      ParentMesssgeUpdated(message: parentMessage),
    );
    FocusScope.of(context).requestFocus(_focusNode);
  }

  Widget _textMessageBuilder(
    types.TextMessage p0, {
    required int messageWidth,
    required bool showName,
  }) {
    final repliedMessage = p0.repliedMessage?.type == types.MessageType.text
        ? p0.repliedMessage as types.TextMessage
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (repliedMessage != null)
            Text(
              'Replied to: ${repliedMessage.text}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Text(
              p0.text,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    final parentMessage = ChatMessage(
                      messageId: int.tryParse(p0.id) ?? 0,
                      senderId: p0.author.id,
                      recipientId: p0.author.id,
                      parentMessageId: 0,
                      message: p0.text,
                      roomId: widget.chatRoom.roomId,
                    );

                    _replyToMessage(parentMessage: parentMessage);
                  },
                  child: Row(
                    children: [
                      SvgButton(
                        imagePath: ImageStringConstants.reply2,
                        color: Colors.grey.shade700,
                        onPressed: () {
                          final parentMessage = ChatMessage(
                            messageId: int.tryParse(p0.id) ?? 0,
                            senderId: p0.author.id,
                            recipientId: p0.author.id,
                            parentMessageId: 0,
                            message: p0.text,
                            roomId: widget.chatRoom.roomId,
                          );

                          _replyToMessage(parentMessage: parentMessage);
                        },
                        height: 16.8,
                        width: 16.8,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Reply',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  DateFormat.jm().format(
                    DateTime.fromMillisecondsSinceEpoch(
                      p0.createdAt ?? 0,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bubbleBuilder(
    Widget child, {
    required message,
    required nextMessageInGroup,
  }) {
    final currentUserId = _authBloc.state.user?.userId;
    return Bubble(
      color: currentUserId != message.author.id ||
              message.type == types.MessageType.image
          ? Colors.white
          : const Color(0XFFF9FFE7),
      margin: nextMessageInGroup
          ? const BubbleEdges.symmetric(horizontal: 6, vertical: 2)
          : null,
      nip: nextMessageInGroup
          ? BubbleNip.no
          : currentUserId != message.author.id
              ? BubbleNip.leftBottom
              : BubbleNip.rightBottom,
      child: child,
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
