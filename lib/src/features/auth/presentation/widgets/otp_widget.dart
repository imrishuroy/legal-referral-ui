import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget({
    required this.pinController,
    this.onChange,
    this.validator,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController pinController;
  final String? Function(String?)? onChange;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;

  final defaultPinTheme = PinTheme(
    width: 48,
    height: 54,
    textStyle: const TextStyle(
      fontSize: 20,
      color: LegalReferralColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.borderBlue300),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: 48,
    height: 54,
    textStyle: const TextStyle(
      fontSize: 20,
      color: LegalReferralColors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.borderBlue300),
      borderRadius: BorderRadius.circular(4),
    ),
  );

  final submittedPinTheme = PinTheme(
    width: 48,
    height: 54,
    textStyle: const TextStyle(
      fontSize: 20,
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.borderBlue300),
      borderRadius: BorderRadius.circular(8),
      color: LegalReferralColors.containerBlue50,
    ),
  );
  final errorPinTheme = PinTheme(
    width: 48,
    height: 54,
    textStyle: const TextStyle(
      fontSize: 20,
      color: LegalReferralColors.error,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: LegalReferralColors.error),
      borderRadius: BorderRadius.circular(8),
      color: LegalReferralColors.containerWhite500,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: pinController,
      onChanged: onChange,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      validator: validator,
      onSubmitted: onSubmitted,
    );
  }
}
