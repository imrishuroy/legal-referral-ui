import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CaseDetails extends StatelessWidget {
  const CaseDetails({
    required this.caseName,
    required this.practiceArea,
    required this.attorneyType,
    required this.date,
    this.proposals,
    super.key,
    this.padding,
  });
  final String? caseName;
  final String? practiceArea;
  final String? attorneyType;
  final int? proposals;
  final String? date;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          (padding != null) ? padding : EdgeInsets.symmetric(horizontal: 16.w),
      color: LegalReferralColors.backgroundWhite255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          if (caseName == null)
            const SizedBox.shrink()
          else
            Text(
              caseName ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          if (proposals != null)
            Text(
              '$proposals Proposals',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: LegalReferralColors.textGrey500),
            )
          else
            const SizedBox.shrink(),
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
