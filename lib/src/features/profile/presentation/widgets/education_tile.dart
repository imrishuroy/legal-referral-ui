import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

class EducationTile extends StatelessWidget {
  const EducationTile({
    required this.education,
    this.onTapEdit,
    super.key,
  });

  final Education? education;
  final VoidCallback? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24.r,
          child: SizedBox(
            height: 24.h,
            width: 24.w,
            child: SvgPicture.asset(IconStringConstants.school),
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
                education?.school ?? '',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                education?.degree ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                education?.startDate != null
                    ? DateTimeUtil.formatDateRange(
                        education!.startDate!,
                        education?.endDate,
                      )
                    : '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Grade: ${education?.grade}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Achievements: ${education?.achievements}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Skills: ${education?.skills.join(', ')}',
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
    );
  }
}
