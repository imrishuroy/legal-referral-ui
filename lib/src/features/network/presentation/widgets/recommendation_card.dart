import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/image_string_constants.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const textWhite450 = LegalReferralColors.textWhite450;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: Image.asset(
            'assets/tempImages/person.jpg',
            fit: BoxFit.cover,
            // width: 167.w,
            height: 226.h,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  ImageStringConstants.cross,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              const Spacer(),
              Text(
                'John Do',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(color: textWhite450),
              ),
              Text(
                'Real estate attorney',
                style:
                    theme.textTheme.bodyMedium?.copyWith(color: textWhite450),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 36.h,
                child: CustomElevatedButton(onTap: () {}, text: 'Connect'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
