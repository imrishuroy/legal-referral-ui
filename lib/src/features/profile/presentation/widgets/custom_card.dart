import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.title,
    this.subTitle,
    this.child,
    this.isNewdetails = false,
  });
  final String? title;
  final String? subTitle;
  final Widget? child;
  final bool? isNewdetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Text(
                '$title',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              if (isNewdetails!)
                CustomIconButton(
                  onTap: () {},
                  icon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(ImageStringsUtil.addIcon),
                  ),
                )
              else
                CustomIconButton(
                  onTap: () {},
                  icon: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      ImageStringsUtil.editIcon,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          if (isNewdetails!)
            Text(
              'Add details...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: LegalReferralColors.textGrey500,
                  ),
            )
          else
            child ?? const SizedBox.shrink(),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
