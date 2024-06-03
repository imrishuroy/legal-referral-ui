import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({
    required this.profileBloc,
    required this.isCurrentUser,
    super.key,
  });

  final ProfileBloc profileBloc;
  final bool isCurrentUser;

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  @override
  void initState() {
    widget.profileBloc.add(EducationFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = widget.profileBloc;
    return ProfileSection(
      title: 'Education',
      isCurrentUser: widget.isCurrentUser,
      onTapAdd: () => context.pushNamed(
        AddUpdateEducationPage.name,
        extra: AddUpdateEducationPageArgs(
          profileBloc: profileBloc,
        ),
      ),
      onTapEdit: () => context.pushNamed(
        ListEducationPage.name,
        extra: widget.profileBloc,
      ),
      showAddButton: true,
      showEditButton: profileBloc.state.educations.isNotEmpty,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        builder: (context, state) {
          return state.educationStatus == EducationStatus.loading
              ? const EducationShimmer()
              : ListView.builder(
                  itemCount: state.educations.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final education = state.educations[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      child: EducationTile(
                        education: education,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
