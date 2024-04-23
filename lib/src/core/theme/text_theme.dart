import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class LegalReferralTextTheme {
  LegalReferralTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    bodySmall: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w400,
      fontSize: 10.h,
    ),
    bodyMedium: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w400,
      fontSize: 12.h,
    ),
    bodyLarge: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w400,
      fontSize: 14.h,
    ),
    titleSmall: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w500,
      fontSize: 14.h,
    ),
    labelMedium: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
      fontSize: 14.h,
    ),
    titleMedium: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w400,
      fontSize: 16.h,
    ),
    titleLarge: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w500,
      fontSize: 16.h,
    ),
    headlineSmall: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
      fontSize: 16.h,
    ),
    headlineMedium: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
      fontSize: 18.h,
    ),
    headlineLarge: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
      fontSize: 20.h,
    ),
    displaySmall: TextStyle(
      color: LegalReferralColors.textBlack,
      fontWeight: FontWeight.w600,
      fontSize: 24.h,
    ),
  );
}
