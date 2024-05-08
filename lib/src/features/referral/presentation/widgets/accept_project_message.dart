import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class AcceptProjectDialog extends StatelessWidget {
  const AcceptProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
            'Barry E.Janay has awarded you the referral: '
            '\nAkron, Divorce Lawyer Wanted',
            style: textTheme.bodyLarge
                ?.copyWith(color: LegalReferralColors.textWhite255),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Please Accept to get started.',
            style: textTheme.bodyLarge
                ?.copyWith(color: LegalReferralColors.textWhite255),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            width: double.maxFinite,
            height: 57.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  LegalReferralColors.backgroundWhite255,
                ),
                shape: MaterialStateProperty.all(
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
              style: textTheme.labelMedium
                  ?.copyWith(color: LegalReferralColors.textWhite255),
              text: 'I do not want to Accept',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
