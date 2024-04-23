import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:legal_referral_ui/src/core/common_widgets/custom_loading_indicator.dart';
import 'package:legal_referral_ui/src/core/constants/constants.dart';
import 'package:legal_referral_ui/src/features/profile/presentation/presentation.dart';

class ListSocialPage extends StatelessWidget {
  const ListSocialPage({
    required this.profileBloc,
    super.key,
  });

  static const String name = 'ListSocialPage';
  final ProfileBloc profileBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LegalReferralColors.primaryBackground,
      appBar: AppBar(
        elevation: 2.h,
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.08),
        title: Text(
          'Social',
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
            return state.socialStatus == SocialStatus.loading
                ? const CustomLoadingIndicator()
                : ListView.separated(
                    itemCount: state.socials.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final social = state.socials[index];
                      return SocialTile(
                        social: social,
                        onEdit: () => context.pushNamed(
                          AddUpdateSocialPage.name,
                          extra: AddUpdateSocialPageArgs(
                            profileBloc: profileBloc,
                            social: social,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[300],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
