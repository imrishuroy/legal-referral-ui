import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';

class ProposalShimmer extends StatelessWidget {
  const ProposalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (constext, _) {
        return CustomShimmer(
          child: Container(
            height: 116.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),
        );
      },
      separatorBuilder: (context, _) => Divider(
        height: 0,
        thickness: 1,
        color: Colors.grey.shade300,
      ),
    );
  }
}
