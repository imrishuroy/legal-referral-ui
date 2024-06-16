import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class NotificationLabel extends StatelessWidget {
  const NotificationLabel({
    required this.notificationNum,
    super.key,
  });
  final String notificationNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: LegalReferralColors.containerBlue100,
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Text(
        notificationNum,
        style: const TextStyle(
          color: LegalReferralColors.textWhite255,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
