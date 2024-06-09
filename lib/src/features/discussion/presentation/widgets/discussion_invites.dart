import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class DiscussionInvites extends StatelessWidget {
  const DiscussionInvites({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                CircleAvatar(
                  radius: 12.r,
                  backgroundImage: const NetworkImage(
                    'https://via.placeholder.com/24',
                  ),
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'David John ',
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
              'Recent changes in legislation '
              'or case law affecting your practise area.',
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  '12/12/2013',
                  style: textTheme.bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
                const SizedBox(width: 8),
                Text(
                  '• 16:24',
                  style: textTheme.bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
              ],
            ),
            const Divider(
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: CustomTextButton(
                      onPressed: () {},
                      text: 'Reject',
                      style: textTheme.headlineSmall
                          ?.copyWith(color: LegalReferralColors.textGrey400),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {},
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
