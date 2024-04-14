import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: const AssetImage(
            'assets/tempImages/Ellipse 39.png',
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harvard University, Cambridge',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'Law and History Program ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'June 2014 - March 2017',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: LegalReferralColors.textGrey500,
                  ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'Team lead • 1st class',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
