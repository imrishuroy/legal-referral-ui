import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/auth/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class DiscussionChatsPage extends StatefulWidget {
  const DiscussionChatsPage({
    required this.discussion,
    super.key,
  });

  final Discussion discussion;
  static const name = 'DiscussionChatsPage';

  @override
  State<DiscussionChatsPage> createState() => _DiscussionChatsPageState();
}

class _DiscussionChatsPageState extends State<DiscussionChatsPage> {
  final TextEditingController _messageController = TextEditingController();

  final _authBloc = getIt<AuthBloc>();
  final _discussionBloc = getIt<DiscussionBloc>();
  final _focusNode = FocusNode();

  @override
  void initState() {
    final discussionId = widget.discussion.discussionId;

    if (discussionId != null) {
      _discussionBloc.add(
        DiscussionMessagesFetched(
          discussionId: discussionId,
          limit: 10,
          offset: 1,
        ),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocConsumer<DiscussionBloc, DiscussionState>(
      bloc: _discussionBloc,
      listener: (context, state) {
        if (state.status == DiscussionStatus.failure) {
          ToastUtil.showToast(
            context,
            title: 'Error',
            description: state.failure?.message ?? 'something went wrong',
            type: ToastificationType.error,
          );
        }
      },
      builder: (context, state) {
        final currentUserName = '${_authBloc.state.user?.firstName} '
            '${_authBloc.state.user?.lastName}';

        if (state.status == DiscussionStatus.success) {
          final messages = state.discussionMessages;
          return Scaffold(
            appBar: AppBar(
              title: CustomTextButton(
                onPressed: () => context.pushNamed(
                  DiscussionDetailsPage.name,
                  extra: widget.discussion,
                  pathParameters: {
                    'discussionId': '${widget.discussion.discussionId}',
                  },
                ),
                maxline: 2,
                text: widget.discussion.topic ?? '',
                style: textTheme.titleLarge?.copyWith(
                  color: LegalReferralColors.textBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.4,
                ),
              ),
            ),
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final discussionMessage = messages[index];

                        final isCurrentUser = discussionMessage?.senderId ==
                            _authBloc.state.user?.userId;
                        final senderName =
                            '${discussionMessage?.senderFirstName} '
                            '${discussionMessage?.senderLastName}';
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: isCurrentUser
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  if (!isCurrentUser)
                                    CustomAvatar(
                                      imageUrl:
                                          discussionMessage?.senderAvatarImg,
                                    )
                                  else
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          Text(
                                            currentUserName,
                                            style: textTheme.titleLarge,
                                          ),
                                          const SizedBox(width: 8),
                                          if (discussionMessage
                                                  ?.parentMessageId !=
                                              null)
                                            Text(
                                              'replied',
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  const SizedBox(width: 8),
                                  if (!isCurrentUser)
                                    Row(
                                      children: [
                                        Text(
                                          senderName,
                                          style: textTheme.titleLarge,
                                        ),
                                        const SizedBox(width: 8),
                                        if (discussionMessage
                                                ?.parentMessageId !=
                                            null)
                                          Text(
                                            'replied',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                      ],
                                    )
                                  else
                                    CustomAvatar(
                                      imageUrl: _authBloc.state.user?.avatarUrl,
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isCurrentUser
                                      ? const Color.fromRGBO(
                                          249,
                                          255,
                                          231,
                                          1,
                                        )
                                      : LegalReferralColors.containerWhite500,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      discussionMessage?.message ?? '',
                                      style: textTheme.bodyLarge?.copyWith(
                                        color: LegalReferralColors.textGrey117,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: isCurrentUser
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        HorizontalIconButton(
                                          height: 16,
                                          width: 16,
                                          icon: IconStringConstants.reply2,
                                          onTap: () => _replyToMessage(
                                            parentMessage: discussionMessage!,
                                          ),
                                          text: 'Reply',
                                          style: textTheme.titleSmall?.copyWith(
                                            color:
                                                LegalReferralColors.textGrey400,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          DateTimeUtil.getFormatTimeHHMM(
                                            discussionMessage?.sentAt,
                                          ),
                                          style: textTheme.bodySmall?.copyWith(
                                            color:
                                                LegalReferralColors.textGrey400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: BottomTextField(
              focusNode: _focusNode,
              height: state.parentMessage != null ? 104.h : 88.h,
              hintText: 'Your message here',
              parentMessage: state.parentMessage?.message,
              commentsController: _messageController,
              onSend: () {
                final message = _messageController.text;
                final discussionId = widget.discussion.discussionId;
                if (message.isNotEmpty) {
                  final userId = _authBloc.state.user?.userId;
                  if (userId != null && discussionId != null) {
                    _discussionBloc.add(
                      DiscussionMessageSent(
                        discussionMessage: DiscussionMessage(
                          discussionId: discussionId,
                          senderId: userId,
                          message: message,
                          repliedMessage: null,
                        ),
                      ),
                    );
                  }

                  _messageController.clear();
                  _focusNode.unfocus();
                }
              },
            ),
          );
        }

        return const Scaffold(
          body: CustomLoadingIndicator(),
        );
      },
    );
  }

  void _replyToMessage({required DiscussionMessage parentMessage}) {
    _discussionBloc.add(
      ParentMesssgeUpdated(message: parentMessage),
    );
    FocusScope.of(context).requestFocus(_focusNode);
  }
}
