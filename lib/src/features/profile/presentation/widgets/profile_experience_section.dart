import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/widgets/experience_widget.dart';

class ProfileExperienceSection extends StatelessWidget {
  const ProfileExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: 'Experience',
      actions: [
        CustomIconButton(
          onTap: () => context.pushNamed(AddExperiencePage.name),
          icon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: SvgPicture.asset(ImageStringsUtil.addIcon),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        CustomIconButton(
          onTap: () {},
          icon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: SvgPicture.asset(ImageStringsUtil.editIcon),
          ),
        ),
      ],
      child: const ExperienceWidget(),
    );
  }
}
