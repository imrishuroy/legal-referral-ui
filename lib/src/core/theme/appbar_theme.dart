import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class LegalReferralAppBarTheme {
  LegalReferralAppBarTheme._();
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    centerTitle: false,
    surfaceTintColor: LegalReferralColors.containerWhite500,
    titleSpacing: 0,
  );
}
