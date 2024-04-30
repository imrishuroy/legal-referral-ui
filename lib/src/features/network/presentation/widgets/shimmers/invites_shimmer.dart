import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class InviteShimmer extends StatelessWidget {
  const InviteShimmer({
    required this.itemCount,
    super.key,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return _InviteCardShimmer();
      },
    );
  }
}

class _InviteCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.08).withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          color: LegalReferralColors.containerWhite500,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50.r,
                  height: 50.r,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 12.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 16.h,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 150.w,
                      height: 12.h,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 16.h,
              color: Colors.grey,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 36.h,
                    child: Container(
                      color: Colors.grey, // Adjust color for shimmer
                    ),
                  ),
                ),
                SizedBox(
                  width: 23.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 36.h,
                    child: Container(
                      color: Colors.grey, // Adjust color for shimmer
                    ),
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
