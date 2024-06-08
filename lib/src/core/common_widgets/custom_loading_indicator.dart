import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.color = LegalReferralColors.containerBlue100,
    this.lineWidth = 4,
    this.size = 48,
  });

  final Color color;
  final double lineWidth;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRing(
        color: color,
        lineWidth: lineWidth,
        size: size,
      ),
    );
  }
}
