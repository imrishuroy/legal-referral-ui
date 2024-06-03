import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    required this.profileBloc,
    required this.user,
    required this.isCurrentUser,
    super.key,
  });

  final UserProfile? user;
  final ProfileBloc profileBloc;
  final bool isCurrentUser;

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: Stack(
        children: [
          _UserBannerWidget(
            bannerUrl: widget.user?.bannerUrl,
            onTapEdit: () => _updateBannerImage(context),
            isCurrentUser: widget.isCurrentUser,
          ),
          if (widget.isCurrentUser)
            Positioned(
              right: 16.w,
              top: 148.h,
              child: CustomIconButton(
                onTap: () => context.pushNamed(
                  UpdateUserInfoPage.name,
                  extra: widget.profileBloc,
                ),
                icon: SvgPicture.asset(
                  IconStringConstants.editIcon,
                ),
              ),
            ),
          Positioned(
            top: 61.h,
            left: 16.w,
            child: _UserAvatarWidget(
              avatarUrl: widget.user?.avatarUrl,
              onTapEdit: () => _updateAvatarImage(context),
              isCurrentUser: widget.isCurrentUser,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateBannerImage(BuildContext context) async {
    final imageOption = await ImageUtil.showMediaOptionSheet(context);
    if (imageOption == MediaLocation.gallery) {
      final pickedFile = await ImageUtil.pickImage(
        cropStyle: CropStyle.rectangle,
      );
      if (pickedFile != null) {
        widget.profileBloc.add(
          BannerUpdated(
            file: File(pickedFile.path),
          ),
        );
      }
    } else if (imageOption == MediaLocation.camera) {
      if (context.mounted) {
        await context.pushNamed<CameraPageArgs?>(
          CameraPage.name,
          extra: CameraPageArgs(
            cropStyle: CropStyle.rectangle,
            onImageCaptured: (filePath) {
              if (filePath != null) {
                widget.profileBloc.add(
                  BannerUpdated(
                    file: File(filePath),
                  ),
                );
              }
            },
          ),
        );
      }
    }
  }

  Future<void> _updateAvatarImage(BuildContext context) async {
    final mediaLocation = await ImageUtil.showMediaOptionSheet(context);
    if (mediaLocation == MediaLocation.gallery) {
      final pickedFile = await ImageUtil.pickImage(
        cropStyle: CropStyle.circle,
      );
      if (pickedFile != null) {
        widget.profileBloc.add(
          AvatarUpdated(
            file: File(pickedFile.path),
          ),
        );
      }
    } else if (mediaLocation == MediaLocation.camera) {
      if (context.mounted) {
        await context.pushNamed<CameraPageArgs?>(
          CameraPage.name,
          extra: CameraPageArgs(
            cropStyle: CropStyle.circle,
            onImageCaptured: (filePath) {
              if (filePath != null) {
                widget.profileBloc.add(
                  AvatarUpdated(
                    file: File(filePath),
                  ),
                );
              }
            },
          ),
        );
      }
    }
  }
}

class _UserBannerWidget extends StatelessWidget {
  const _UserBannerWidget({
    required this.bannerUrl,
    required this.onTapEdit,
    required this.isCurrentUser,
  });

  final String? bannerUrl;
  final VoidCallback onTapEdit;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNetworkImage(
          imageUrl: bannerUrl,
          height: 140.h,
          width: double.infinity,
        ),
        if (isCurrentUser)
          Positioned(
            right: 16.w,
            top: 16.h,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LegalReferralColors.containerWhite500,
              ),
              padding: const EdgeInsets.all(8),
              child: CustomIconButton(
                onTap: onTapEdit,
                icon: SvgPicture.asset(
                  IconStringConstants.editIcon,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _UserAvatarWidget extends StatelessWidget {
  const _UserAvatarWidget({
    required this.avatarUrl,
    required this.onTapEdit,
    required this.isCurrentUser,
  });

  final String? avatarUrl;
  final VoidCallback onTapEdit;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: LegalReferralColors.containerWhite500,
              width: 2.w,
            ),
          ),
          child: CustomAvatar(
            imageUrl: avatarUrl,
            radius: 78.r,
          ),
        ),
        if (isCurrentUser)
          Positioned(
            right: 8.w,
            bottom: 2.h,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LegalReferralColors.containerWhite500,
              ),
              padding: const EdgeInsets.all(8),
              child: CustomIconButton(
                onTap: onTapEdit,
                icon: SvgPicture.asset(
                  IconStringConstants.editIcon,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
