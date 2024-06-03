import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ReferredUsersShimmer extends StatelessWidget {
  const ReferredUsersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return CustomShimmer(
          child: Container(
            height: 250,
            color: LegalReferralColors.backgroundWhite255,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 8.h,
      ),
    );
  }
}
