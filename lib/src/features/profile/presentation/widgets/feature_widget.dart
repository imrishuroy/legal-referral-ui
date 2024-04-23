import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: LegalReferralColors.borderLightGrey300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              'post'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: LegalReferralColors.textGrey400,
                  ),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            height: 212.h,
            width: 253.w,
            child: Image.asset(
              'assets/tempImages/Frame 202.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              'Guidelines to file bankruptcy',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              'Lorem ipsum dolor sit amet',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: LegalReferralColors.textGrey400,
                  ),
            ),
          ),
          SizedBox(height: 19.h),
        ],
      ),
    );
  }
}
