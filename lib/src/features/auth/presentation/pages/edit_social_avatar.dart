import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/colors.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';

class EditProfilePicture extends StatelessWidget {
  const EditProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        title: const Text('Profile Picture'),
        backgroundColor: LegalReferralColors.primaryBackground,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          Center(
            child: CircleAvatar(
              radius: 148.5.r,
              backgroundColor: LegalReferralColors.containerWhite500,
              child: SvgPicture.asset(
                'assets/icons/avatar.svg',
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: 24.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  child: Column(
                    children: [
                      SvgPicture.asset(ImageStringsUtil.editIcon),
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400,
                          color: LegalReferralColors.textGrey400,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  child: Column(
                    children: [
                      SvgPicture.asset(ImageStringsUtil.deleteIcon),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400,
                          color: LegalReferralColors.textGrey400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
