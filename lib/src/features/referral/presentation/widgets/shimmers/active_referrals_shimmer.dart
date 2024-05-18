import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ActiveReferralShimmer extends StatelessWidget {
  const ActiveReferralShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomShimmer(
          child: ColoredBox(
            color: LegalReferralColors.backgroundWhite255,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 2.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    width: 200.w,
                    height: 20.h,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 100.w,
                    height: 20.h,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100.w,
                        height: 20.h,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 100.w,
                        height: 20.h,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 100.w,
                    height: 20.h,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 8.h,
      ),
      itemCount: 4,
    );
  }
}
