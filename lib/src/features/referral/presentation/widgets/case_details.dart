import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';

class CaseDetails extends StatelessWidget {
  const CaseDetails({
    required this.caseName,
    required this.practiceArea,
    required this.attorneyType,
    required this.date,
    super.key,
  });
  final String? caseName;
  final String? practiceArea;
  final String? attorneyType;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: LegalReferralColors.backgroundWhite255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Text(
            caseName ?? '',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // Text(
          //   '4 Proposals',
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyMedium
          //       ?.copyWith(color: LegalReferralColors.textGrey500),
          // ),
          SizedBox(
            height: 8.h,
          ),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.w / .15.h,
            children: [
              HorizontalIconText(
                icon: IconStringConstants.location,
                title: practiceArea,
              ),
              HorizontalIconText(
                icon: IconStringConstants.calender,
                title: date,
              ),
              HorizontalIconText(
                icon: IconStringConstants.bag,
                title: attorneyType,
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
         
        ],
      ),
    );
  }
}

class HorizontalIconText extends StatelessWidget {
  const HorizontalIconText({
    required this.icon,
    required this.title,
    super.key,
  });
  final String? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(
          icon ?? '',
        ),
        const SizedBox(width: 10),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
