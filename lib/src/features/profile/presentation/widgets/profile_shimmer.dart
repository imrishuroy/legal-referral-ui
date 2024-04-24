import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4.h),
          _ProfileHeaderShimmer(),
          const PriceShimmer(),
          const AverageBillingShimmer(),
          const CaseResolutionShimmer(),
          const AboutShimmer(),
          const SocialShimmer(),
          const ExperienceShimmer(),
          const EducationShimmer(),
        ],
      ),
    );
  }
}

class _ProfileHeaderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        children: [
          SizedBox(
            height: 220.h,
            child: Stack(
              children: [
                SizedBox(
                  height: 140.h,
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 61.h,
                  left: 14.w,
                  child: CircleAvatar(
                    radius: 78.r,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14.h,
                  width: 180.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 14.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Container(
                      height: 14.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      height: 14.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 14.h,
                  width: 240.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
