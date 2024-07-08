import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/gap.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class AdTypeCard extends StatelessWidget {
  const AdTypeCard({
    required this.onPressed,
    required this.adTitle,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onPressed;
  final String adTitle;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: LegalReferralColors.containerWhite500,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          width: 2,
          color: isSelected ? Colors.blue : Colors.transparent,
        ),
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
            onPressed: onPressed,
          ),
          const Gap(height: 8),
          Text(
            adTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
