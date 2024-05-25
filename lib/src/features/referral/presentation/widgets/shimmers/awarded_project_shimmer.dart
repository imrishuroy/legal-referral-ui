import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class AwardedProjectShimmer extends StatelessWidget {
  const AwardedProjectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        height: 218.h,
        width: double.maxFinite,
        color: LegalReferralColors.containerWhite500,
      ),
    );
  }
}
