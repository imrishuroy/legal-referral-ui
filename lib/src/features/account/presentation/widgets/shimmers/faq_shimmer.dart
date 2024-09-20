import 'package:flutter/material.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class FAQShimmer extends StatelessWidget {
  const FAQShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListView.separated(
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 38,
            width: double.infinity,
            color: Colors.grey.shade300,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
            color: Colors.black,
            thickness: 0.8,
          );
        },
      ),
    );
  }
}
