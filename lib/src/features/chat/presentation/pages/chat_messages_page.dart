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
    required this.recipientId,
    super.key,
  });

  final String recipientId;

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
    final currentUserId = _authBloc.state.user?.userId;
    if (currentUserId == null) {
      return;
    }

    _chatBloc.add(
      ChatRoomCreated(
        senderId: _authBloc.state.user?.userId ?? '',
        recipientId: widget.recipientId,
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

    return BlocConsumer<ChatBloc, ChatState>(
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
        final name = '${state.currentChatRoom.firstName ?? ''}'
            ' ${state.currentChatRoom.lastName ?? ''}';

        return Scaffold(
          appBar: AppBar(
            title: Text(name),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          body: state.status == ChatStatus.success
              ? chat_ui.Chat(
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
                    height: kBottomNavigationBarHeight +
                        26.h +
                        (state.parentMessage != null
                            ? (state.parentMessage!.message.length > 8
                                ? 44.h
                                : 24.h)
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 6.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Repling to: '
                                    '${state.parentMessage?.message}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
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
                                  onChanged: (value) {},
                                ),
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  IconStringConstants.send,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.blue,
                                    BlendMode.srcIn,
                                  ),
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                onPressed: () {
                                  _chatBloc.add(
                                    ChatMessageSent(
                                      chatRoom: state.currentChatRoom,
                                      message: ChatMessage(
                                        senderId: currentUser.userId ?? '',
                                        recipientId:
                                            state.currentChatRoom.userId,
                                        parentMessageId:
                                            state.parentMessage?.messageId ?? 0,
                                        message: _textEditingController.text,
                                        roomId: state.currentChatRoom.roomId,
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
                      MessagesFetched(),
                    );
                  },
                )
              : const CustomLoadingIndicator(),
        );
      },
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
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (repliedMessage != null)
            Text(
              'Replied to: ${repliedMessage.text}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 4.h,
            ),
            child: Text(
              p0.text,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 4.h,
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
                      roomId: _chatBloc.state.currentChatRoom.roomId,
                    );

                    _replyToMessage(parentMessage: parentMessage);
                  },
                  child: Row(
                    children: [
                      SvgButton(
                        imagePath: IconStringConstants.reply2,
                        color: Colors.grey.shade700,
                        onPressed: () {
                          final parentMessage = ChatMessage(
                            messageId: int.tryParse(p0.id) ?? 0,
                            senderId: p0.author.id,
                            recipientId: p0.author.id,
                            parentMessageId: 0,
                            message: p0.text,
                            roomId: _chatBloc.state.currentChatRoom.roomId,
                          );

                          _replyToMessage(parentMessage: parentMessage);
                        },
                        height: 16.8.h,
                        width: 16.8.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Reply',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14.sp,
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
                    fontSize: 14.sp,
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
