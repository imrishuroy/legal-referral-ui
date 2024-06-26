import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class AdTypeCard extends StatelessWidget {
  const AdTypeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: LegalReferralColors.containerWhite500,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(width: 2, color: Colors.blue),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgButton(
            height: 177,
            width: 188,
            imagePath: 'assets/images/Frame.svg',
            onPressed: () {},
          ),
          const Gap(height: 8),
          Text(
            'Advertise with image',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
