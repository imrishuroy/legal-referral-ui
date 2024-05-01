import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_tile.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class RecentWidget extends StatelessWidget {
  const RecentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LegalReferralColors.containerWhite500,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Recent',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: LegalReferralColors.textGrey400),
              ),
              const Spacer(),
              CustomTextButton(
                textColor: LegalReferralColors.textGrey400,
                fontSize: 14.h,
                fontWeight: FontWeight.w400,
                text: 'Clear',
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Wrap(
            spacing: 12.w,
            children: [
              for (var i = 0; i < 3; i++)
                SizedBox(
                  width: 60.w,
                  child: VerticalTile(
                    onPressed: () {},
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: LegalReferralColors.borderGrey300,
                          width: 1.w,
                        ),
                      ),
                      child: CustomAvatar(
                        imageUrl: null,
                        radius: 28.r,
                      ),
                    ),
                    trailing: Text(
                      'Tim Yong Yusuf',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 26.h),
          for (var i = 0; i < 3; i++)
            Column(
              children: [
                HorizontalIconButton(
                  height: 20.h,
                  width: 20.h,
                  text: 'Michael',
                  icon: ImageStringConstants.historyIcon,
                  onTap: () {},
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(
                  height: 12,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ],
            ),
          SizedBox(height: 24.h),
          Text(
            'Popular search',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: LegalReferralColors.textGrey400),
          ),
          SizedBox(height: 22.h),
          for (var i = 0; i < 3; i++)
            Column(
              children: [
                HorizontalTile(
                  onPressed: () {},
                  leading: SvgPicture.asset(ImageStringConstants.historyIcon),
                  spacing: 8.h,
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Finance Attorney',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Texas',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: LegalReferralColors.textGrey400,
                            ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
              ],
            ),
          // const Text("Today's news and views"),
        ],
      ),
    );
  }
}
