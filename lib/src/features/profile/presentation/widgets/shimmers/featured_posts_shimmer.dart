import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class FeaturedPostsShimmer extends StatelessWidget {
  const FeaturedPostsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: SizedBox(
        height: 304.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 304.h,
              width: 253.w,
            );
          },
        ),
      ),
    );
  }
}
