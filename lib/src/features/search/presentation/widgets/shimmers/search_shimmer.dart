import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LegalReferralColors.containerWhite500,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: CustomShimmer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 22.h,
            ),
            Wrap(
              spacing: 12.w,
              children: [
                for (var i = 0; i < 3; i++)
                  Column(
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
                        height: 4.h,
                      ),
                      Container(
                        width: 50.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        width: 25.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            SizedBox(height: 26.h),
            for (var i = 0; i < 3; i++)
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      Container(
                        width: 100.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 12,
                    color: Colors.grey,
                  ),
                ],
              ),
            SizedBox(height: 34.h),

            for (var i = 0; i < 3; i++)
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.r,
                        height: 40.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            width: 150.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            width: 100.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            // const Text("Today's news and views"),
          ],
        ),
      ),
    );
  }
}
