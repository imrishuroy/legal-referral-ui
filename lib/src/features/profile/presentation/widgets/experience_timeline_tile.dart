import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceTimelineTile extends StatelessWidget {
  const ExperienceTimelineTile({
    required this.userExperiences,
    this.onTapEdit,
    super.key,
  });

  final List<UserExperience?> userExperiences;
  final VoidCallback? onTapEdit;

  @override
  Widget build(BuildContext context) {
    if (userExperiences.isEmpty) {
      return const SizedBox();
    }
    final userExp = userExperiences[0];
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomAvatar(
                  radius: 24.r,
                  imageUrl: userExp?.firm?.logoUrl,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userExp?.firm?.name ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      userExp?.firm?.location ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            for (int index = 0; index < userExperiences.length; index++)
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: index == 0,
                isLast: index == userExperiences.length - 1,
                indicatorStyle: IndicatorStyle(
                  color: LegalReferralColors.containerBlue100,
                  width: 12.w,
                  height: 100.h,
                  padding: EdgeInsets.only(
                    right: 8.w,
                  ),
                  indicatorXY: 0.14,
                ),
                beforeLineStyle: LineStyle(
                  color: LegalReferralColors.containerBlue100,
                  thickness: 2.w,
                ),
                afterLineStyle: LineStyle(
                  color: LegalReferralColors.containerBlue100,
                  thickness: 2.w,
                ),
                endChild: _RightChild(
                  userExp: userExperiences[index],
                  onTapEdit: onTapEdit,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    required this.userExp,
    this.onTapEdit,
  });

  final UserExperience? userExp;
  final VoidCallback? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 12.w,
        top: 8.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userExp?.experience?.title ?? '',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  userExp?.experience?.practiceArea ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  userExp?.experience?.startDate != null
                      ? DateTimeUtil.formatDateRange(
                          userExp!.experience!.startDate!,
                          userExp?.experience?.endDate,
                        )
                      : '',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LegalReferralColors.textGrey500,
                      ),
                ),
                Text(
                  userExp?.experience?.practiceLocation ?? '',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: LegalReferralColors.textGrey500,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  userExp?.experience?.description ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Skills: ${userExp?.experience?.skills.join(', ')}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          if (onTapEdit != null)
            CustomIconButton(
              onTap: onTapEdit!,
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(IconStringConstants.editIcon),
              ),
            ),
        ],
      ),
    );
  }
}
