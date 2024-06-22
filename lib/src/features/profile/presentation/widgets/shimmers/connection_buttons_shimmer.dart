import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ConnectionButtonShimmer extends StatelessWidget {
  const ConnectionButtonShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: CustomShimmer(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LegalReferralColors.textGrey400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: LegalReferralColors.textGrey400,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
