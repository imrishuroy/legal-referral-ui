import 'package:flutter/material.dart';

class LegalReferralSwitchTheme {
  LegalReferralSwitchTheme._();
  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    trackOutlineWidth: MaterialStateProperty.all(1),
    trackOutlineColor: MaterialStateProperty.all<Color>(
      const Color.fromRGBO(219, 214, 219, 1),
    ),
    thumbColor: MaterialStateProperty.all<Color>(
      const Color.fromRGBO(255, 255, 255, 1),
    ),
    trackColor: MaterialStateProperty.all<Color>(
      const Color.fromRGBO(89, 158, 217, 1),
    ),
  );
}
