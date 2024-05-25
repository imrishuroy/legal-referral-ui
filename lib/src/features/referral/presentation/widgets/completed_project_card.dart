import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

class CompletedProjectCard extends StatelessWidget {
  const CompletedProjectCard({
    super.key,
    this.project,
  });

  final Project? project;

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
            SizedBox(
              height: 12.h,
            ),
            Text(
              project?.title ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HorizontalIconText(
                  icon: IconStringConstants.location,
                  title: project?.practiceLocation,
                ),
                HorizontalIconText(
                  icon: IconStringConstants.calender,
                  title: DateTimeUtil.formatReferralDate(
                    project?.createdAt,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            HorizontalIconText(
              icon: IconStringConstants.bag,
              title: project?.practiceArea,
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
