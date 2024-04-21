import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/utils/utils.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_button.dart';
import 'package:legal_referral_ui/src/core/widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  void initState() {
    widget.profileBloc.add(ExperienceFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileSection(
      title: 'Experience',
      actions: [
        CustomIconButton(
          onTap: () => context.pushNamed(
            AddUpdateExperiencePage.name,
            extra: AddUpdateExperiencePageArgs(
              profileBloc: widget.profileBloc,
            ),
          ),
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
          onTap: () => context.pushNamed(
            ListExperiencesPage.name,
            extra: widget.profileBloc,
          ),
          icon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: SvgPicture.asset(ImageStringsUtil.editIcon),
          ),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: widget.profileBloc,
        builder: (context, state) {
          return state.experienceStatus == ExperienceStatus.loading
              ? const CustomLoadingIndicator()
              : ListView.separated(
                  itemCount: state.experiences.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final experience = state.experiences[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: ExperienceTile(userExp: experience),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[300],
                    thickness: 1.h,
                  ),
                );
        },
      ),
    );
  }
}
