import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class AdTileShimmer extends StatelessWidget {
  const AdTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        children: List.generate(2, (index) {
          return CustomShimmer(
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
      ),
    );
  }
}
