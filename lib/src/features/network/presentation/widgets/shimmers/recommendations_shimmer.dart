import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class RecommendationsShimmer extends StatelessWidget {
  const RecommendationsShimmer({
    required this.itemCount,
    super.key,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        mainAxisExtent: 226.h,
      ),
      itemBuilder: (context, index) {
        return _RecommendationCardShimmer();
      },
    );
  }
}

class _RecommendationCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: Colors.grey, // Adjust color for shimmer
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Container(
                  color: Colors.grey, // Adjust color for shimmer
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      color: Colors.grey, // Adjust color for shimmer
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 150.w, // Adjust width for shimmer
                    height: 24.h, // Adjust height for shimmer
                    color: Colors.grey, // Adjust color for shimmer
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 200.w, // Adjust width for shimmer
                    height: 16.h, // Adjust height for shimmer
                    color: Colors.grey, // Adjust color for shimmer
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    height: 36.h,
                    child: Container(
                      color: Colors.grey, // Adjust color for shimmer
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
