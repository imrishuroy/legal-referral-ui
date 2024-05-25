import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({
    required this.image,
    required this.onEdit,
    required this.onDelete,
    required this.onTakePhoto,
    super.key,
  });

  final File? image;
  final VoidCallback onEdit;
  final VoidCallback onTakePhoto;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: const Text('Profile Picture'),
          backgroundColor: LegalReferralColors.primaryBackground,
          centerTitle: false,
          titleSpacing: 0,
        ),
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
              backgroundImage: image != null ? FileImage(image!) : null,
              child: image == null
                  ? SvgPicture.asset(
                      'assets/icons/avatar.svg',
                    )
                  : null,
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
                  onTap: onEdit,
                  child: Column(
                    children: [
                      SvgPicture.asset(IconStringConstants.editIcon),
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
                  onTap: onTakePhoto,
                  child: Column(
                    children: [
                      SvgPicture.asset(IconStringConstants.camera),
                      Text(
                        'Take Photo',
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
                  onTap: onDelete,
                  child: Column(
                    children: [
                      SvgPicture.asset(IconStringConstants.deleteIcon),
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
