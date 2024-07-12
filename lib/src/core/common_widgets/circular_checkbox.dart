import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CircularCheckBox extends StatelessWidget {
  const CircularCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: LegalReferralColors.containerBlue79,
      radius: 24.r,
      child: const Icon(
        Icons.done_rounded,
        color: Colors.white,
      ),
    );
  }
}
