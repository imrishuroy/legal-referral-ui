import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/widgets.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class EducationSection extends StatefulWidget {
  const EducationSection({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

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
              ? const CustomLoadingIndicator()
              : ListView.separated(
                  itemCount: state.educations.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final education = state.educations[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                      ),
                      child: EducationTile(
                        education: education,
                      ),
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