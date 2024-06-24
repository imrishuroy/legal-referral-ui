import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_shimmer.dart';

class LikesUsersShimmer extends StatelessWidget {
  const LikesUsersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(right: 10.h),
          child: const CustomShimmer(
            child: CircleAvatar(
              radius: 28,
            ),
          ),
        );
      },
    );
  }
}
