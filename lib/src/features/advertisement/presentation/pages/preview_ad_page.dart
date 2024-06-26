import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/advertisement/presentation/pages/payment_cycle_page.dart';
import 'package:legal_referral_ui/src/features/feed/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/post/domain/entities/post.dart';

class PreviewAdPage extends StatelessWidget {
  const PreviewAdPage({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Preview', style: textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //preview widget
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              color: LegalReferralColors.backgroundWhite255,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: textTheme.headlineSmall
                          ?.copyWith(color: LegalReferralColors.textBlack300),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      style: textTheme.bodyLarge
                          ?.copyWith(color: LegalReferralColors.textBlack300),
                    ),
                  ),
                  MediaPost(
                    mediaUrls: const ['mediaUrls', 'mediaUrls'],
                    postType: PostType.image,
                    imageHeight: 400.h,
                  ),
                  CustomOutlinedButton(
                    height: 38.h,
                    width: 122.w,
                    text: 'Learn More',
                    onPressed: () {},
                    textColor: LegalReferralColors.borderBlue100,
                    borderColor: LegalReferralColors.borderBlue100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconStringConstants.thumbUp,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              '0 Like',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconStringConstants.comment,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              '0 Comment',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      VerticalIconButton(
                        icon: IconStringConstants.thumbUp,
                        text: 'Like',
                        textColor: LegalReferralColors.textGrey117,
                        onTap: () {},
                        iconColor: LegalReferralColors.textGrey117,
                      ),
                      VerticalIconButton(
                        icon: IconStringConstants.comment,
                        text: 'Comment',
                        textColor: LegalReferralColors.textGrey117,
                        onTap: () {},
                      ),
                      VerticalIconButton(
                        icon: IconStringConstants.discuss,
                        text: 'Discuss',
                        textColor: LegalReferralColors.textGrey117,
                        onTap: () {},
                      ),
                      VerticalIconButton(
                        icon: IconStringConstants.share,
                        text: 'Share',
                        textColor: LegalReferralColors.textGrey117,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const Gap(height: 16),
                ],
              ),
            ),
            //select payment cycle
            const PaymentCycleWidget(),
          ],
        ),
      ),
    );
  }
}
