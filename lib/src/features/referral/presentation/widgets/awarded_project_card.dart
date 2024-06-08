import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/features/referral/domain/domain.dart';

class AwardedProjectCard extends StatelessWidget {
  const AwardedProjectCard({
    required this.project,
    required this.onAccept,
    required this.onReject,
    super.key,
  });

  final Project? project;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final name = '${project?.user?.firstName ?? ''} '
        '${project?.user?.lastName ?? ''}';
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      color: LegalReferralColors.containerGreen95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Congratulations! You have been Awarded!',
            style: textTheme.headlineMedium
                ?.copyWith(color: LegalReferralColors.textWhite255),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            '$name has awarded you the referral: '
            '\n${project?.title ?? ''}',
            style: textTheme.bodyLarge?.copyWith(
              color: LegalReferralColors.textWhite255,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Please Accept to get started.',
            style: textTheme.bodyLarge?.copyWith(
              color: LegalReferralColors.textWhite255,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 57.h,
            child: ElevatedButton(
              onPressed: onAccept,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  LegalReferralColors.backgroundWhite255,
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                      color: LegalReferralColors.borderBlue300,
                    ),
                  ),
                ),
              ),
              child: Text(
                'Accept Project',
                style: textTheme.headlineMedium?.copyWith(
                  color: LegalReferralColors.textBlue100,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Align(
            child: CustomTextButton(
              style: textTheme.labelMedium?.copyWith(
                color: LegalReferralColors.textWhite255,
              ),
              text: 'I do not want to Accept',
              onPressed: onReject,
            ),
          ),
        ],
      ),
    );
  }
}
