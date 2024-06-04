import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';

class PostStructure extends StatelessWidget {
  const PostStructure({
    required this.child,
    super.key,
    this.profileImage,
    this.attorneyName,
    this.attorneyType,
    this.postedTime,
  });
  final Widget child;
  final String? profileImage;
  final String? attorneyName;
  final String? attorneyType;
  final String? postedTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ColoredBox(
      color: LegalReferralColors.containerWhite500,
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: LegalReferralColors.borderGrey300,
                    ),
                  ),
                  child: CustomAvatar(
                    imageUrl: profileImage,
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
                          attorneyName ?? '',
                          style: theme.labelMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        attorneyType ?? '',
                        style: theme.bodyLarge
                            ?.copyWith(color: LegalReferralColors.textGrey117),
                      ),
                      Text(
                        postedTime ?? '',
                        style: theme.bodyLarge
                            ?.copyWith(color: LegalReferralColors.textGrey117),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(IconStringConstants.threeDots),
              ],
            ),
          ),
          child,
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
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
