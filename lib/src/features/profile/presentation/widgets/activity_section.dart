import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '898 Followers',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: LegalReferralColors.textGrey400),
        ),
        SizedBox(
          height: 12.h,
        ),
        CustomOutlinedButton(
          height: 35.h,
          width: 76.w,
          text: 'Posts',
          onPressed: () {},
          borderRadius: 64,
        ),
        SizedBox(
          height: 28.h,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: LegalReferralColors.borderGrey300,
                  width: 1.w,
                ),
              ),
              child: CircleAvatar(
                radius: 27.r,
                backgroundImage: const AssetImage(
                  'assets/tempImages/Ellipse 38.png',
                ),
              ),
            ),
            SizedBox(
              width: 12.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Barry E. Janay',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  'Founder, ONYX • 2nd',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LegalReferralColors.textGrey500,
                      ),
                ),
                Text(
                  '13 min ago',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: LegalReferralColors.textGrey500,
                      ),
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(IconStringConstants.threeDots),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Nam pellentesque magna ac ex convallis ullamcorper.'
          ' Mauris iaculis semper malesuada. '
          'Donec mi massa, '
          'iaculis non porttitor ut,'
          ' volutpat nec arcu. Fusce quis finibus felis',
          style: Theme.of(context).textTheme.bodyLarge,

          // maxLines: _showMoreText ? null : 2,
        ),
        // CustomTextButton(
        //   onPressed: () {
        //     _showMoreText = true;
        //   },
        //   text: !_showMoreText ? 'Read more...' : '\nShow less...',
        // ),
        SizedBox(
          height: 8.h,
        ),
        Row(
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
                  '21 Likes',
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
                  'Comments',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VerticalIconButton(
              icon: IconStringConstants.thumbUp,
              text: 'Like',
              textColor: LegalReferralColors.textGrey500,
              onTap: () {},
            ),
            VerticalIconButton(
              icon: IconStringConstants.comment,
              text: 'Comment',
              textColor: LegalReferralColors.textGrey500,
              onTap: () {},
            ),
            VerticalIconButton(
              icon: IconStringConstants.discuss,
              text: 'Discuss',
              textColor: LegalReferralColors.textGrey500,
              onTap: () {},
            ),
            VerticalIconButton(
              icon: IconStringConstants.share,
              text: 'Share',
              textColor: LegalReferralColors.textGrey500,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/tempImages/Likes.png',
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: LegalReferralColors.containerWhite400,
                  ),
                  padding: const EdgeInsets.all(8),
                  width: 295.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sinan Rakib • 1st',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Finance attorney',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: LegalReferralColors.textGrey400,
                            ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur.'
                        ' Risus lectus sit maecenas et.'
                        ' Adipiscing viverra ac risus blandit'
                        ' dignissim condimentum gravida.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    HorizontalIconButton(
                      text: 'Like •4',
                      style: Theme.of(context).textTheme.titleSmall,
                      height: 16.h,
                      width: 16.w,
                      icon: IconStringConstants.thumbUp,
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    HorizontalIconButton(
                      text: 'Reply',
                      style: Theme.of(context).textTheme.titleSmall,
                      height: 16.h,
                      width: 16.w,
                      icon: IconStringConstants.reply,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 28.h,
        ),
        Divider(
          thickness: 1.w,
        ),
        Center(
          child: CustomOutlinedButton(
            height: 40.h,
            width: 166.w,
            onPressed: () {},
            text: 'See All Posts',
          ),
        ),
      ],
    );
  }
}
