import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/features/profile/domain/domain.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:toastification/toastification.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    required this.profileBloc,
    required this.user,
    super.key,
  });

  final UserProfile? user;
  final ProfileBloc profileBloc;

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
            onTapEdit: _updateBannerImage,
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
            top: 61.h,
            left: 16.w,
            child: _UserAvatarWidget(
              avatarUrl: widget.user?.avatarUrl,
              onTapEdit: _updateAvatarImage,
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
    } else {
      if (mounted) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'No image selected',
          type: ToastificationType.error,
        );
      }
    }
  }

  Future<void> _updateAvatarImage() async {
    final pickedFile = await ImageUtil.pickImage(context);

    if (pickedFile != null) {
      widget.profileBloc.add(
        AvatarUpdated(
          file: File(pickedFile.path),
        ),
      );
    } else {
      if (mounted) {
        ToastUtil.showToast(
          context,
          title: 'Error',
          description: 'No image selected',
          type: ToastificationType.error,
        );
      }
    }
  }
}

class _UserBannerWidget extends StatelessWidget {
  const _UserBannerWidget({
    required this.bannerUrl,
    required this.onTapEdit,
  });

  final String? bannerUrl;
  final VoidCallback onTapEdit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNetworkImage(
          imageUrl: bannerUrl,
          height: 140.h,
          width: double.infinity,
        ),
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
                ImageStringsUtil.editIcon,
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
  });

  final String? avatarUrl;
  final VoidCallback onTapEdit;

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
                ImageStringsUtil.editIcon,
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
