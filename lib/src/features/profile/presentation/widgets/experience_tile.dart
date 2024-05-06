import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_avatar.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({
    required this.userExp,
    this.onTapEdit,
    super.key,
  });

  final UserExperience? userExp;
  final VoidCallback? onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAvatar(
          radius: 24.r,
          imageUrl: userExp?.firm?.logoUrl,
        ),
        SizedBox(
          width: 12.w,
        ),
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
                userExp?.firm?.location ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                userExp?.experience?.description ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 12.h,
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
    );
  }
}
