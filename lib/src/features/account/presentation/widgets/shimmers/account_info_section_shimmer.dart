import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class AccountInfoSectionShimmer extends StatelessWidget {
  const AccountInfoSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 78.r,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 16.h),
            Container(
              height: 16.h,
              width: 200.w,
              color: Colors.grey,
            ),
            SizedBox(height: 8.h),
            Container(
              height: 14.h,
              width: 100.w,
              color: Colors.grey,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                SvgPicture.asset(
                  IconStringConstants.rating,
                ),
                Container(
                  height: 16.h,
                  width: 100.w,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              height: 16.h,
              width: 100.w,
              color: Colors.grey,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
