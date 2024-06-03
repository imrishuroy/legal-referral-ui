import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    required this.title,
    required this.onTapAdd,
    required this.onTapEdit,
    required this.showAddButton,
    required this.showEditButton,
    required this.child,
    required this.isCurrentUser,
    super.key,
  });

  final String title;
  final VoidCallback onTapAdd;
  final VoidCallback onTapEdit;
  final bool showAddButton;
  final bool showEditButton;
  final Widget child;
  final bool isCurrentUser;

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
              if (isCurrentUser)
                Row(
                  children: [
                    if (showAddButton)
                      CustomIconButton(
                        onTap: onTapAdd,
                        icon: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(IconStringConstants.addIcon),
                        ),
                      ),
                    if (showEditButton)
                      SizedBox(
                        width: 12.w,
                      ),
                    if (showEditButton)
                      CustomIconButton(
                        onTap: onTapEdit,
                        icon: SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: SvgPicture.asset(IconStringConstants.editIcon),
                        ),
                      ),
                  ],
                ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          child,
        ],
      ),
    );
  }
}
