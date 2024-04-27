import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08).withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        color: LegalReferralColors.containerWhite500,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: LegalReferralColors.borderGrey300,
                    width: 1.w,
                  ),
                ),
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const AssetImage(
                    'assets/tempImages/Ellipse 41.png',
                  ),
                ),
              ),
              SizedBox(
                width: 12.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Tim',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    'Legal Advisor, ONIO • 2nd',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: LegalReferralColors.textGrey500,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Inviting you to connect',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: CustomOutlinedButton(onPressed: () {}, text: 'Reject'),
                ),
              ),
              SizedBox(
                width: 23.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: CustomElevatedButton(onTap: () {}, text: 'Accept'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
