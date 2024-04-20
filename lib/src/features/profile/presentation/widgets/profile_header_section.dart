import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/config/config.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/image_strings_util.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_avatar.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ProfileHeaderSection extends StatefulWidget {
  const ProfileHeaderSection({
    required this.profileBloc,
    required this.user,
    super.key,
  });

  final UserProfile? user;
  final ProfileBloc profileBloc;

  @override
  State<ProfileHeaderSection> createState() => _ProfileHeaderSectionState();
}

class _ProfileHeaderSectionState extends State<ProfileHeaderSection> {
  //File? _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Stack(
        children: [
          SizedBox(
            height: 140.h,
            width: double.infinity,
            child: widget.user?.bannerUrl != null
                ? Image.network(
                    widget.user!.bannerUrl!,
                    fit: BoxFit.fitWidth,
                  )
                : Image.asset(
                    'assets/tempImages/Banner.png',
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Positioned(
            right: 16.w,
            top: 148.h,
            child: CustomIconButton(
              onTap: () => context.pushNamed(
                UpdateUserInfoPage.name,
                extra: widget.user,
              ),
              icon: SvgPicture.asset(
                ImageStringsUtil.editIcon,
              ),
            ),
          ),
          Positioned(
            right: 16.w,
            top: 16.h,
            child: CustomIconButton(
              onTap: _updateBannerImage,
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset(
                  ImageStringsUtil.editIcon,
                ),
              ),
            ),
          ),
          Positioned(
            top: 61.h,
            left: 16.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: LegalReferralColors.containerWhite500,
                  width: 2.w,
                ),
              ),
              child: CustomAvatar(
                imageUrl: widget.user?.avatarUrl,
                radius: 78.r,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateBannerImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.profileBloc.add(BannerUpdated(file: File(pickedFile.path)));

      // AppLogger.info('pickedFile: ${pickedFile.path}');
      // setState(() {
      //   _image = File(pickedFile.path);
      // });
    } else {
      AppLogger.info('No image selected');
    }
  }
}
