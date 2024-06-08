import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/theme/appbar_theme.dart';
import 'package:legal_referral_ui/src/core/theme/switch_theme.dart';
import 'package:legal_referral_ui/src/core/theme/text_theme.dart';

class LegalReferralTheme {
  LegalReferralTheme._();
  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: LegalReferralColors.borderBlue300.withOpacity(.5),
      cursorColor: LegalReferralColors.borderBlue300,
      selectionHandleColor: LegalReferralColors.borderBlue300.withOpacity(1),
    ),
    brightness: Brightness.light,
    chipTheme: const ChipThemeData(
      backgroundColor: LegalReferralColors.containerWhite500,
    ),
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 8,
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      visualDensity: VisualDensity(vertical: -3),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      color: LegalReferralColors.white,
      surfaceTintColor: LegalReferralColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    textTheme: LegalReferralTextTheme.lightTextTheme,
    switchTheme: LegalReferralSwitchTheme.lightSwitchTheme,
    scaffoldBackgroundColor: LegalReferralColors.primaryBackground,
    appBarTheme: LegalReferralAppBarTheme.lightAppBarTheme,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.black),
      fillColor: WidgetStateProperty.all(Colors.transparent),
      side: WidgetStateBorderSide.resolveWith(
        (states) => const BorderSide(color: LegalReferralColors.borderBlue300),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
