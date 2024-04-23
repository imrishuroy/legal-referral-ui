import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ListEducationPage extends StatelessWidget {
  const ListEducationPage({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  static const String name = 'ListEducationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          'Education',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          bloc: profileBloc,
          builder: (context, state) {
            return state.educationStatus == EducationStatus.loading
                ? const CustomLoadingIndicator()
                : ListView.separated(
                    itemCount: state.educations.length,
                    itemBuilder: (context, index) {
                      final education = state.educations[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                        ),
                        child: EducationTile(
                          education: education,
                          onTapEdit: () => context.pushNamed(
                            AddUpdateEducationPage.name,
                            extra: AddUpdateEducationPageArgs(
                              profileBloc: profileBloc,
                              education: education,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[300],
                      height: 1.h,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
