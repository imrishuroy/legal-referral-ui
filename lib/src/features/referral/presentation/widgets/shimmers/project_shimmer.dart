import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class ProjectShimmer extends StatelessWidget {
  const ProjectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 2; i++)
          CustomShimmer(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 6.h,
              ),
              child: Container(
                height: 128,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
