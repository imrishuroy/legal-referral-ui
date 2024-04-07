import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget({
    required this.pinController,
    this.focusNode,
    this.length = 4,
    this.onChange,
    this.validator,
    this.onSubmitted,
    this.isError = false,
    this.errorText,
    super.key,
  });

  final int length;
  final TextEditingController pinController;
  final FocusNode? focusNode;
  final String? Function(String?)? onChange;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final bool isError;
  final String? errorText;

  final defaultPinTheme = PinTheme(
    width: 48.w,
    height: 54.h,
    textStyle: TextStyle(
      fontSize: 20.h,
      color: LegalReferralColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.borderBlue300),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 48.w,
    height: 54.h,
    textStyle: TextStyle(
      fontSize: 20.h,
      color: LegalReferralColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.borderBlue300),
      borderRadius: BorderRadius.circular(4.r),
    ),
  );

  final submittedPinTheme = PinTheme(
    width: 48.w,
    height: 54.h,
    textStyle: TextStyle(
      fontSize: 20.h,
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.borderBlue300),
      borderRadius: BorderRadius.circular(8.r),
      color: LegalReferralColors.containerBlue50,
    ),
  );
  final errorPinTheme = PinTheme(
    width: 48.w,
    height: 54.h,
    textStyle: TextStyle(
      fontSize: 20.h,
      color: LegalReferralColors.error,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.error),
      borderRadius: BorderRadius.circular(8.r),
      color: LegalReferralColors.containerWhite500,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      focusNode: focusNode,
      length: length,
      forceErrorState: isError,
      errorText: errorText,
      controller: pinController,
      onChanged: onChange,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      validator: validator,
      onSubmitted: onSubmitted,
      hapticFeedbackType: HapticFeedbackType.mediumImpact,
    );
  }
}
