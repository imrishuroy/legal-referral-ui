import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class AboutShimmer extends StatelessWidget {
  const AboutShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      child: CustomShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            6,
            (index) {
              final containerWidths = <double>[
                100,
                double.maxFinite,
                250,
                double.maxFinite,
                double.maxFinite,
                300,
              ];
              return CustomShimmer(
                child: Container(
                  width: containerWidths[index].w,
                  height: 14.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
