import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // this will be generating dynamically list based on User
        // wraping in listview.builder
        Row(
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset(IconStringConstants.facebook),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'Barry.E123',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: LegalReferralColors.textBlue100,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
