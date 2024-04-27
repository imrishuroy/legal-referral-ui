import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_bottom_sheet.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/constants/image_string_constants.dart';

class ConnectionListTile extends StatelessWidget {
  const ConnectionListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: LegalReferralColors.borderGrey300,
                width: 1.w,
              ),
            ),
            child: CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage(
                'assets/tempImages/Ellipse 41.png',
              ),
            ),
          ),
          SizedBox(
            width: 12.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'John Tim',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Legal Advisor, ONIO • 2nd',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
              Text(
                'Connected 4 days ago',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: LegalReferralColors.textGrey500,
                    ),
              ),
            ],
          ),
          const Spacer(),
          CustomIconButton(
            icon: SvgPicture.asset(
              ImageStringConstants.threeDots,
            ),
            onTap: () {
              CustomBottomSheet.show(
                isDismissible: true,
                isScrollControlled: false,
                context: context,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    HorizontalIconButon(
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey500,
                          ),
                      text: 'Message',
                      icon: ImageStringConstants.message,
                      onTap: () {},
                    ),
                    const Divider(),
                    HorizontalIconButon(
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: LegalReferralColors.textGrey500,
                          ),
                      text: 'Remote Connection',
                      icon: ImageStringConstants.removeConnection,
                      onTap: () {},
                    ),
                    const Divider(),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
