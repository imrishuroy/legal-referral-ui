import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveTrackColor: LegalReferralColors.buttonGrey100,
      value: value,
      onChanged: onChanged,
    );
  }
}
