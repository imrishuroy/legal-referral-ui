import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/discussion/presentation/pages/discussion_room_page.dart';

class ChatMessage {
  ChatMessage({
    required this.user,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.isReply = false,
    this.repliedTo = '',
  });
  final String user;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isReply;
  final String repliedTo;
}

class DiscussionChatScreen extends StatefulWidget {
  const DiscussionChatScreen({required this.discussionTitle, super.key});
  final String discussionTitle;
  @override
  State<DiscussionChatScreen> createState() => _DiscussionChatScreenState();
}

class _DiscussionChatScreenState extends State<DiscussionChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMessage> messages = [
    ChatMessage(
      user: 'Tom Hardy',
      message:
          'Creating a system for managing caseload involves'
          ' establishing a structured approach to '
          'handling cases. This can include utilizing'
          ' case management and software or organizing '
          'physical files with clear labels and '
          'categories. A well-organized system'
          ' enables easier tracking of case statuses '
          'and more efficient task management.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    ChatMessage(
      user: 'Tom Hardy',
      message:
          'Creating a system for managing caseload to be involves '
          'establishing a structured approach with an organized system.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    ChatMessage(
      user: 'Jane Shain',
      message:
          'Creating a system for managing caseload great involves'
          ' establishing a structured approach with an organized system.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
      isReply: true,
      repliedTo: 'Tom Hardy',
    ),
    ChatMessage(
      user: 'You',
      message:
          'Creating a system for managing caseload great involves '
          'establishing a structured approach with an organized system.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    ChatMessage(
      user: 'Tom Hardy',
      message:
          'Creating a system for managing caseload to be involves'
          ' establishing a structured approach with an organized system.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
    ChatMessage(
      user: 'Jane Shain',
      message:
          'Creating a system for managing caseload great involves'
          ' establishing a structured approach with an organized system.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
      isReply: true,
      repliedTo: 'Tom Hardy',
    ),
    ChatMessage(
      user: 'You',
      message:
          'Creating a system for managing caseload great involves'
          ' establishing a structured approach with an organized system.',
      time: '12:33 AM',
      avatarUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DiscussionRoomPage(
                discussionTitle: widget.discussionTitle,
              ),
            ),
          ),
          maxline: 2,
          text: widget.discussionTitle,
        ),
      ),
      body: Column(
        children: [
          // may overflow appers neet to fix
          Flexible(
            flex: 10,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isCurrentUser = message.user == 'You';
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
                            const CustomAvatar(
                              imageUrl: null,
                            )
                          else
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                message.user,
                                style: textTheme.titleLarge,
                              ),
                            ),
                          const SizedBox(width: 8),
                          if (!isCurrentUser)
                            Text(
                              message.user,
                              style: textTheme.titleLarge,
                            )
                          else
                            const CustomAvatar(
                              imageUrl: null,
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
                              ? const Color.fromRGBO(249, 255, 231, 1)
                              : LegalReferralColors.containerWhite500,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              message.message,
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
                                  icon: IconStringConstants.thumbUp,
                                  onTap: () {},
                                  text: 'Like • 2',
                                  style: textTheme.titleSmall?.copyWith(
                                    color: LegalReferralColors.textGrey400,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                HorizontalIconButton(
                                  height: 16,
                                  width: 16,
                                  icon: IconStringConstants.reply2,
                                  onTap: () {},
                                  text: 'Reply',
                                  style: textTheme.titleSmall?.copyWith(
                                    color: LegalReferralColors.textGrey400,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  message.time,
                                  style: textTheme.bodySmall?.copyWith(
                                    color: LegalReferralColors.textGrey400,
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'Your message here',
                    controller: _textEditingController,
                    onChanged: (value) {
                      return null;
                    },
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
                    _textEditingController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
