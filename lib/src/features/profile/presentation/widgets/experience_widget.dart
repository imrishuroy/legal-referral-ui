import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
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
            'assets/tempImages/Ellipse 40.png',
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Senior Attorney',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Finance Attorney, Simon Law Firm',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'June 2019 - March 2021',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
              Text(
                'Alaska, USA',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Lorem ipsum dolor sit amet consectetur.'
                ' Risus lectus sit maecenas et.'
                ' Adipiscing viverra ac risus blandit'
                ' dignissim condimentum gravida.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Senior Attorney • Team lead • Client Handling',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
