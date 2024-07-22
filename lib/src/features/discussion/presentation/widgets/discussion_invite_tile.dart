import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/discussion/domain/domain.dart';

class DiscussionInviteTile extends StatelessWidget {
  const DiscussionInviteTile({
    required this.discussionInviteRes,
    required this.onJoin,
    required this.onReject,
    super.key,
  });

  final DiscussionInviteRes? discussionInviteRes;
  final VoidCallback onJoin;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final userName = '${discussionInviteRes?.user.firstName} '
        '${discussionInviteRes?.user.lastName}';
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CustomAvatar(
                  imageUrl: discussionInviteRes?.user.avatarUrl,
                  radius: 12,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: userName,
                        style: textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: 'invited you to discuss on',
                        style: textTheme.bodyLarge
                            ?.copyWith(color: LegalReferralColors.textGrey117),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              discussionInviteRes?.discussion.topic ?? '',
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  discussionInviteRes?.discussionInvite.createdAt != null
                      ? DateTimeUtil.getFormattedDate(
                          discussionInviteRes!.discussionInvite.createdAt!,
                        )
                      : '',
                  style: textTheme.bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
                const SizedBox(width: 8),
                Text(
                  '• ${DateTimeUtil.getFormatTimeHHMM(
                    discussionInviteRes!.discussionInvite.createdAt,
                  )}',
                  style: textTheme.bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
              ],
            ),
            const Divider(
              color: Color(0x17000000),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: CustomTextButton(
                      onPressed: onReject,
                      text: 'Reject',
                      style: textTheme.headlineSmall
                          ?.copyWith(color: LegalReferralColors.textGrey400),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: onJoin,
                    text: 'Join',
                    height: 36.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
