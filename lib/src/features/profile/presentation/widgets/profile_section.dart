import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    required this.title,
    required this.actions,
    required this.child,
    super.key,
  });

  final String title;
  final List<Widget> actions;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 2.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      color: LegalReferralColors.containerWhite500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              if (actions.isNotEmpty)
                Row(
                  children: actions,
                )
              else
                const SizedBox.shrink(),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          child,
          // if (isNewdetails!)
          //   Text(
          //     'Add details...',
          //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          //           color: LegalReferralColors.textGrey500,
          //         ),
          //   )
          // else
          //   child ?? const SizedBox.shrink(),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
