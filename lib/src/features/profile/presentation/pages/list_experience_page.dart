import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ListExperiencePage extends StatelessWidget {
  const ListExperiencePage({
    required this.profileBloc,
    super.key,
  });

  final ProfileBloc profileBloc;

  static const String name = 'ListExperiencePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          'Experience',
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
          builder: (conext, state) {
            return state.experienceStatus == ExperienceStatus.loading
                ? const CustomLoadingIndicator()
                : ListView.separated(
                    itemCount: state.experiences.length,
                    itemBuilder: (context, index) {
                      final userExp = state.experiences[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                        ),
                        child: ExperienceTile(
                          userExp: userExp,
                          onTapEdit: () => context.pushNamed(
                            AddUpdateExperiencePage.name,
                            extra: AddUpdateExperiencePageArgs(
                              profileBloc: profileBloc,
                              userExp: userExp,
                            ),
                          ),
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
      ),
    );
  }
}
