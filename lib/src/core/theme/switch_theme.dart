import 'package:flutter/material.dart';

class LegalReferralSwitchTheme {
  LegalReferralSwitchTheme._();
  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    trackOutlineWidth: WidgetStateProperty.all(1),
    trackOutlineColor: WidgetStateProperty.all<Color>(
      const Color.fromRGBO(219, 214, 219, 1),
    ),
    thumbColor: WidgetStateProperty.all<Color>(
      const Color.fromRGBO(255, 255, 255, 1),
    ),
    trackColor: WidgetStateProperty.all<Color>(
      const Color.fromRGBO(89, 158, 217, 1),
    ),
  );
}
