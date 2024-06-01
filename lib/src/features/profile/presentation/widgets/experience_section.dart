import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({
    required this.profileBloc,
    required this.isCurrentUser,
    super.key,
  });

  final ProfileBloc profileBloc;
  final bool isCurrentUser;

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
      isCurrentUser: widget.isCurrentUser,
      onTapAdd: () => context.pushNamed(
        AddUpdateExperiencePage.name,
        extra: AddUpdateExperiencePageArgs(
          profileBloc: widget.profileBloc,
        ),
      ),
      onTapEdit: () => context.pushNamed(
        ListExperiencePage.name,
        extra: widget.profileBloc,
      ),
      showAddButton: true,
      showEditButton: widget.profileBloc.state.experiences.isNotEmpty,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: widget.profileBloc,
        builder: (context, state) {
          return state.experienceStatus == ExperienceStatus.loading
              ? const ExperienceShimmer()
              : ListView.builder(
                  itemCount: state.experiences.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final userExp = state.experiences[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      child: ExperienceTile(userExp: userExp),
                    );
                  },
                );
        },
      ),
    );
  }
}
