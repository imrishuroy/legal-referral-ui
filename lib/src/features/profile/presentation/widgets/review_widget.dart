import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 318.w,
      decoration: BoxDecoration(
        color: LegalReferralColors.containerWhite500,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: LegalReferralColors.borderGrey200,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
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
                  radius: 20.r,
                  backgroundImage: const AssetImage(
                    'assets/tempImages/Ellipse 41.png',
                  ),
                ),
              ),
              SizedBox(
                width: 8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John David',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Sr. Attorney',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    IconStringConstants.favIcon,
                    height: 18.h,
                    width: 18.w,
                  ),
                  Text(
                    '4.3',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Lorem ipsum dolor sit amet consectetur.'
            ' Risus lectus sit maecenas et.'
            ' Adipiscing viverra ac risus blandit'
            ' dignissim condimentum gravida.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
