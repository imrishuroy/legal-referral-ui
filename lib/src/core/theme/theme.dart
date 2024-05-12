import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/theme/appbar_theme.dart';
import 'package:legal_referral_ui/src/core/theme/switch_theme.dart';
import 'package:legal_referral_ui/src/core/theme/text_theme.dart';

class LegalReferralTheme {
  LegalReferralTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    chipTheme: const ChipThemeData(
      backgroundColor: LegalReferralColors.containerWhite500,
    ),
    textTheme: LegalReferralTextTheme.lightTextTheme,
    switchTheme: LegalReferralSwitchTheme.lightSwitchTheme,
    //scaffoldBackgroundColor: LegalReferralColors.primaryBackground,
    appBarTheme: LegalReferralAppBarTheme.lightAppBarTheme,
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.black),
      fillColor: MaterialStateProperty.all(Colors.transparent),
      side: MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(color: LegalReferralColors.borderBlue300),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
