import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class PostProposalTile extends StatelessWidget {
  const PostProposalTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: LegalReferralColors.backgroundWhite255,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      margin:  EdgeInsets.symmetric( vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Attorney details
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: LegalReferralColors.borderGrey300,
                  ),
                ),
                child: CustomAvatar(
                  imageUrl: null,
                  radius: 28.r,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        'name',
                        style: textTheme.titleLarge?.copyWith(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: textTheme.bodyLarge?.copyWith(
                              color: LegalReferralColors.textGrey117,
                            ),
                            children: const [
                              TextSpan(text: '${'practiceArea'} '),
                              TextSpan(text: ' • 1st'),
                            ],
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.8.h,
                    ),
                    Text(
                      DateTimeUtil.timeAgo(DateTime.now()),
                      style: textTheme.bodyMedium?.copyWith(
                        color: LegalReferralColors.textGrey117,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // Post details options
              SvgButton(
                height: 24.w,
                width: 24.h,
                imagePath: IconStringConstants.threeDots,
                onPressed: () {},
              ),
            ],
          ),
          const Divider(),
          //case details
          Text(
            'Akron, Ohio car accident',
            style: textTheme.titleSmall
                ?.copyWith(color: LegalReferralColors.textBlack400),
          ),
          const Gap(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Location:',
                  style: textTheme.bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
                TextSpan(
                  text: ' Ohio',
                  style: textTheme.titleSmall
                      ?.copyWith(color: LegalReferralColors.textBlack300),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Practise Area:',
                  style: textTheme.bodyLarge
                      ?.copyWith(color: LegalReferralColors.textGrey400),
                ),
                TextSpan(
                  text: ' Financial Attorney',
                  style: textTheme.titleSmall
                      ?.copyWith(color: LegalReferralColors.textBlack300),
                ),
              ],
            ),
          ),
          const Gap(height: 8),
          ExpandableText(
            style: textTheme.bodyLarge
                ?.copyWith(color: LegalReferralColors.textBlack300),
            maxLines: 3,
            text: 'Lorem ipsum dolor sit amet consectetur. '
                'By Adipiscing sagittis id velit orci in adipiscing.'
                ' Dignissim ultrices orci lorem neque odio ultricies nec.'
                ' A dolor turpis nulla '
                'Lorem ipsum dolor sit amet consectetur. '
                'By Adipiscing sagittis id velit orci in adipiscing.'
                ' Dignissim ultrices orci lorem neque odio ultricies nec.'
                ' A dolor turpis nulla',
          ),
          const Gap(height: 8),
          CustomElevatedButton(
            text: 'Show Interest',
            onTap: () {},
          ),
          CustomOutlinedButton(
            text: 'Dismiss',
            onPressed: () {},
            borderColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
