import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitRing(
        color: LegalReferralColors.containerBlue100,
        lineWidth: 4,
        size: 48,
      ),
    );
  }
}
