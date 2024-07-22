import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class StartAdWidget extends StatelessWidget {
  const StartAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Advertise with us and improve your business',
            style: textTheme.titleMedium,
          ),
          const Gap(height: 24),
          CustomElevatedButton(
            height: 44.h,
            text: 'Start Advertising',
            onTap: () {
              //add ad page
            },
          ),
        ],
      ),
    );
  }
}
