import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    required this.value,
    this.onChanged,
    super.key,
  });

  final bool value;
  final Function({required bool value})? onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveTrackColor: LegalReferralColors.buttonGrey100,
      value: value,
      onChanged: (bool value) => onChanged?.call(value: value),
    );
  }
}
