import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/icon_string_constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

class ReferralCard extends StatelessWidget {
  const ReferralCard({
    super.key,
    this.referral,
    this.showTitle = true,
  });

  final Project? referral;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LegalReferralColors.backgroundWhite255,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 2.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showTitle)
              SizedBox(
                height: 12.h,
              ),
            if (showTitle)
              Text(
                referral?.title ?? '',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            // Text(
            //   '4 Proposals',
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium
            //       ?.copyWith(color: LegalReferralColors.textGrey500),
            // ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HorizontalIconText(
                  icon: IconStringConstants.location,
                  title: referral?.practiceLocation,
                ),
                HorizontalIconText(
                  icon: IconStringConstants.calender,
                  title: DateTimeUtil.formatReferralDate(
                    referral?.createdAt,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            HorizontalIconText(
              icon: IconStringConstants.bag,
              title: referral?.practiceArea ?? '',
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
