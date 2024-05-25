import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

class ActiveProposalCard extends StatelessWidget {
  const ActiveProposalCard({
    super.key,
    this.proposal,
  });

  final Proposal? proposal;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LegalReferralColors.backgroundWhite255,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: LegalReferralColors.borderGrey300,
                    ),
                  ),
                  child: CustomAvatar(
                    imageUrl: proposal?.referrerAvatarUrl,
                    radius: 22.r,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${proposal?.referrerFirstName ?? ''} '
                      '${proposal?.referrerLastName ?? ''}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      proposal?.referrerPracticeArea ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey500,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HorizontalIconText(
                  icon: IconStringConstants.location,
                  title: proposal?.preferredPracticeLocation,
                ),
                HorizontalIconText(
                  icon: IconStringConstants.calender,
                  title: DateTimeUtil.formatReferralDate(
                    proposal?.createdAt,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            HorizontalIconText(
              icon: IconStringConstants.bag,
              title: proposal?.preferredPracticeArea ?? '',
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
